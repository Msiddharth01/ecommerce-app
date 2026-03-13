'use client'

import { createContext, useContext, useCallback, type ReactNode } from 'react'
import useSWR, { mutate } from 'swr'
import { createClient } from '@/lib/supabase/client'
import type { CartItem, Product } from '@/lib/types'
import { toast } from 'sonner'

interface CartContextType {
  items: CartItem[]
  isLoading: boolean
  error: Error | null
  addToCart: (product: Product, quantity?: number) => Promise<void>
  removeFromCart: (itemId: string) => Promise<void>
  updateQuantity: (itemId: string, quantity: number) => Promise<void>
  clearCart: () => Promise<void>
  totalItems: number
  subtotal: number
}

const CartContext = createContext<CartContextType | undefined>(undefined)

async function fetchCart(): Promise<CartItem[]> {
  const supabase = createClient()
  const { data: { user } } = await supabase.auth.getUser()
  
  if (!user) return []
  
  const { data, error } = await supabase
    .from('cart_items')
    .select('*, product:products(*)')
    .eq('user_id', user.id)
    .order('created_at', { ascending: false })
  
  if (error) throw error
  return data || []
}

export function CartProvider({ children }: { children: ReactNode }) {
  const { data: items = [], error, isLoading } = useSWR<CartItem[]>('cart', fetchCart)
  
  const addToCart = useCallback(async (product: Product, quantity = 1) => {
    const supabase = createClient()
    const { data: { user } } = await supabase.auth.getUser()
    
    if (!user) {
      toast.error('Please sign in to add items to cart')
      return
    }
    
    // Check if item already exists in cart
    const existingItem = items.find(item => item.product_id === product.id)
    
    if (existingItem) {
      const newQuantity = existingItem.quantity + quantity
      const { error } = await supabase
        .from('cart_items')
        .update({ quantity: newQuantity })
        .eq('id', existingItem.id)
      
      if (error) {
        toast.error('Failed to update cart')
        return
      }
    } else {
      const { error } = await supabase
        .from('cart_items')
        .insert({ user_id: user.id, product_id: product.id, quantity })
      
      if (error) {
        toast.error('Failed to add to cart')
        return
      }
    }
    
    toast.success(`${product.name} added to cart`)
    mutate('cart')
  }, [items])
  
  const removeFromCart = useCallback(async (itemId: string) => {
    const supabase = createClient()
    
    const { error } = await supabase
      .from('cart_items')
      .delete()
      .eq('id', itemId)
    
    if (error) {
      toast.error('Failed to remove item')
      return
    }
    
    toast.success('Item removed from cart')
    mutate('cart')
  }, [])
  
  const updateQuantity = useCallback(async (itemId: string, quantity: number) => {
    if (quantity < 1) return
    
    const supabase = createClient()
    
    const { error } = await supabase
      .from('cart_items')
      .update({ quantity })
      .eq('id', itemId)
    
    if (error) {
      toast.error('Failed to update quantity')
      return
    }
    
    mutate('cart')
  }, [])
  
  const clearCart = useCallback(async () => {
    const supabase = createClient()
    const { data: { user } } = await supabase.auth.getUser()
    
    if (!user) return
    
    const { error } = await supabase
      .from('cart_items')
      .delete()
      .eq('user_id', user.id)
    
    if (error) {
      toast.error('Failed to clear cart')
      return
    }
    
    toast.success('Cart cleared')
    mutate('cart')
  }, [])
  
  const totalItems = items.reduce((sum, item) => sum + item.quantity, 0)
  const subtotal = items.reduce((sum, item) => {
    const price = item.product?.price || 0
    return sum + (price * item.quantity)
  }, 0)
  
  return (
    <CartContext.Provider value={{
      items,
      isLoading,
      error: error || null,
      addToCart,
      removeFromCart,
      updateQuantity,
      clearCart,
      totalItems,
      subtotal
    }}>
      {children}
    </CartContext.Provider>
  )
}

export function useCart() {
  const context = useContext(CartContext)
  if (!context) {
    throw new Error('useCart must be used within a CartProvider')
  }
  return context
}
