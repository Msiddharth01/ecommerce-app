'use client'

import { createContext, useContext, useCallback, type ReactNode } from 'react'
import useSWR, { mutate } from 'swr'
import { createClient } from '@/lib/supabase/client'
import type { WishlistItem, Product } from '@/lib/types'
import { toast } from 'sonner'

interface WishlistContextType {
  items: WishlistItem[]
  isLoading: boolean
  error: Error | null
  addToWishlist: (product: Product) => Promise<void>
  removeFromWishlist: (productId: string) => Promise<void>
  isInWishlist: (productId: string) => boolean
  totalItems: number
}

const WishlistContext = createContext<WishlistContextType | undefined>(undefined)

async function fetchWishlist(): Promise<WishlistItem[]> {
  const supabase = createClient()
  const { data: { user } } = await supabase.auth.getUser()
  
  if (!user) return []
  
  const { data, error } = await supabase
    .from('wishlist')
    .select('*, product:products(*)')
    .eq('user_id', user.id)
    .order('created_at', { ascending: false })
  
  if (error) throw error
  return data || []
}

export function WishlistProvider({ children }: { children: ReactNode }) {
  const { data: items = [], error, isLoading } = useSWR<WishlistItem[]>('wishlist', fetchWishlist)
  
  const addToWishlist = useCallback(async (product: Product) => {
    const supabase = createClient()
    const { data: { user } } = await supabase.auth.getUser()
    
    if (!user) {
      toast.error('Please sign in to add items to wishlist')
      return
    }
    
    // Check if already in wishlist
    const existing = items.find(item => item.product_id === product.id)
    if (existing) {
      toast.info('Item already in wishlist')
      return
    }
    
    const { error } = await supabase
      .from('wishlist')
      .insert({ user_id: user.id, product_id: product.id })
    
    if (error) {
      toast.error('Failed to add to wishlist')
      return
    }
    
    toast.success(`${product.name} added to wishlist`)
    mutate('wishlist')
  }, [items])
  
  const removeFromWishlist = useCallback(async (productId: string) => {
    const supabase = createClient()
    const { data: { user } } = await supabase.auth.getUser()
    
    if (!user) return
    
    const { error } = await supabase
      .from('wishlist')
      .delete()
      .eq('user_id', user.id)
      .eq('product_id', productId)
    
    if (error) {
      toast.error('Failed to remove from wishlist')
      return
    }
    
    toast.success('Removed from wishlist')
    mutate('wishlist')
  }, [])
  
  const isInWishlist = useCallback((productId: string) => {
    return items.some(item => item.product_id === productId)
  }, [items])
  
  return (
    <WishlistContext.Provider value={{
      items,
      isLoading,
      error: error || null,
      addToWishlist,
      removeFromWishlist,
      isInWishlist,
      totalItems: items.length
    }}>
      {children}
    </WishlistContext.Provider>
  )
}

export function useWishlist() {
  const context = useContext(WishlistContext)
  if (!context) {
    throw new Error('useWishlist must be used within a WishlistProvider')
  }
  return context
}
