-- Seed Categories
INSERT INTO public.categories (name, slug, description, image_url) VALUES
  ('Electronics', 'electronics', 'Latest gadgets and electronic devices', 'https://images.unsplash.com/photo-1498049794561-7780e7231661?w=400'),
  ('Clothing', 'clothing', 'Fashion and apparel for all', 'https://images.unsplash.com/photo-1445205170230-053b83016050?w=400'),
  ('Home & Garden', 'home-garden', 'Everything for your home', 'https://images.unsplash.com/photo-1484101403633-562f891dc89a?w=400'),
  ('Sports', 'sports', 'Sports equipment and activewear', 'https://images.unsplash.com/photo-1461896836934- voices?w=400'),
  ('Books', 'books', 'Books, e-readers, and more', 'https://images.unsplash.com/photo-1512820790803-83ca734da794?w=400')
ON CONFLICT (slug) DO NOTHING;

-- Seed Products
INSERT INTO public.products (name, slug, description, price, original_price, image_url, category_id, stock, rating, reviews_count, is_featured, is_new) VALUES
  -- Electronics
  ('Wireless Bluetooth Headphones', 'wireless-bluetooth-headphones', 'Premium noise-canceling wireless headphones with 30-hour battery life and crystal clear audio quality.', 199.99, 249.99, 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400', (SELECT id FROM public.categories WHERE slug = 'electronics'), 50, 4.8, 234, true, true),
  ('Smart Watch Pro', 'smart-watch-pro', 'Advanced fitness tracking, heart rate monitoring, and seamless smartphone integration.', 349.99, NULL, 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400', (SELECT id FROM public.categories WHERE slug = 'electronics'), 30, 4.6, 156, true, false),
  ('4K Ultra HD Camera', '4k-ultra-hd-camera', 'Professional-grade 4K camera with image stabilization and low-light performance.', 899.99, 999.99, 'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?w=400', (SELECT id FROM public.categories WHERE slug = 'electronics'), 15, 4.9, 89, false, true),
  ('Portable Bluetooth Speaker', 'portable-bluetooth-speaker', 'Waterproof speaker with 360-degree sound and 20-hour playtime.', 79.99, 99.99, 'https://images.unsplash.com/photo-1608043152269-423dbba4e7e1?w=400', (SELECT id FROM public.categories WHERE slug = 'electronics'), 100, 4.5, 312, true, false),
  ('Wireless Earbuds', 'wireless-earbuds', 'True wireless earbuds with active noise cancellation and touch controls.', 149.99, NULL, 'https://images.unsplash.com/photo-1590658268037-6bf12165a8df?w=400', (SELECT id FROM public.categories WHERE slug = 'electronics'), 75, 4.7, 445, false, true),
  
  -- Clothing
  ('Premium Cotton T-Shirt', 'premium-cotton-tshirt', 'Soft, breathable 100% organic cotton t-shirt. Perfect for everyday wear.', 29.99, 39.99, 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=400', (SELECT id FROM public.categories WHERE slug = 'clothing'), 200, 4.4, 567, true, false),
  ('Classic Denim Jacket', 'classic-denim-jacket', 'Timeless denim jacket with vintage wash. A wardrobe essential.', 89.99, NULL, 'https://images.unsplash.com/photo-1576995853123-5a10305d93c0?w=400', (SELECT id FROM public.categories WHERE slug = 'clothing'), 45, 4.6, 234, false, true),
  ('Running Sneakers', 'running-sneakers', 'Lightweight running shoes with responsive cushioning and breathable mesh.', 129.99, 159.99, 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400', (SELECT id FROM public.categories WHERE slug = 'clothing'), 60, 4.8, 789, true, true),
  ('Leather Crossbody Bag', 'leather-crossbody-bag', 'Genuine leather bag with adjustable strap and multiple compartments.', 149.99, NULL, 'https://images.unsplash.com/photo-1548036328-c9fa89d128fa?w=400', (SELECT id FROM public.categories WHERE slug = 'clothing'), 35, 4.5, 156, false, false),
  ('Wool Winter Scarf', 'wool-winter-scarf', 'Luxuriously soft merino wool scarf. Keep warm in style.', 49.99, 69.99, 'https://images.unsplash.com/photo-1520903920243-00d872a2d1c9?w=400', (SELECT id FROM public.categories WHERE slug = 'clothing'), 80, 4.3, 98, false, true),
  
  -- Home & Garden
  ('Modern Table Lamp', 'modern-table-lamp', 'Minimalist design lamp with adjustable brightness and warm lighting.', 79.99, NULL, 'https://images.unsplash.com/photo-1507473885765-e6ed057f782c?w=400', (SELECT id FROM public.categories WHERE slug = 'home-garden'), 40, 4.6, 178, true, false),
  ('Indoor Plant Set', 'indoor-plant-set', 'Set of 3 low-maintenance indoor plants with decorative pots.', 59.99, 79.99, 'https://images.unsplash.com/photo-1459411552884-841db9b3cc2a?w=400', (SELECT id FROM public.categories WHERE slug = 'home-garden'), 25, 4.4, 234, false, true),
  ('Ceramic Coffee Mug Set', 'ceramic-coffee-mug-set', 'Set of 4 handcrafted ceramic mugs in earth tones.', 34.99, NULL, 'https://images.unsplash.com/photo-1514228742587-6b1558fcca3d?w=400', (SELECT id FROM public.categories WHERE slug = 'home-garden'), 100, 4.7, 456, true, false),
  ('Throw Blanket', 'throw-blanket', 'Ultra-soft knitted throw blanket. Perfect for cozy evenings.', 44.99, 59.99, 'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=400', (SELECT id FROM public.categories WHERE slug = 'home-garden'), 65, 4.8, 321, false, false),
  
  -- Sports
  ('Yoga Mat Pro', 'yoga-mat-pro', 'Non-slip yoga mat with alignment guides and extra cushioning.', 49.99, 69.99, 'https://images.unsplash.com/photo-1601925260368-ae2f83cf8b7f?w=400', (SELECT id FROM public.categories WHERE slug = 'sports'), 90, 4.7, 567, true, true),
  ('Resistance Bands Set', 'resistance-bands-set', 'Complete set of 5 resistance bands for home workouts.', 29.99, NULL, 'https://images.unsplash.com/photo-1598289431512-b97b0917affc?w=400', (SELECT id FROM public.categories WHERE slug = 'sports'), 150, 4.5, 890, false, false),
  ('Stainless Steel Water Bottle', 'stainless-steel-water-bottle', 'Insulated bottle that keeps drinks cold for 24 hours or hot for 12.', 34.99, 44.99, 'https://images.unsplash.com/photo-1602143407151-7111542de6e8?w=400', (SELECT id FROM public.categories WHERE slug = 'sports'), 200, 4.8, 1234, true, false),
  ('Fitness Tracker Band', 'fitness-tracker-band', 'Track your steps, heart rate, and sleep patterns.', 59.99, 79.99, 'https://images.unsplash.com/photo-1576243345690-4e4b79b63288?w=400', (SELECT id FROM public.categories WHERE slug = 'sports'), 55, 4.4, 678, false, true),
  
  -- Books
  ('The Art of Minimalism', 'the-art-of-minimalism', 'A guide to living with less and finding more meaning.', 19.99, 24.99, 'https://images.unsplash.com/photo-1544947950-fa07a98d237f?w=400', (SELECT id FROM public.categories WHERE slug = 'books'), 300, 4.6, 234, true, false),
  ('Cooking Masterclass', 'cooking-masterclass', 'Learn professional cooking techniques from world-renowned chefs.', 34.99, NULL, 'https://images.unsplash.com/photo-1589998059171-988d887df646?w=400', (SELECT id FROM public.categories WHERE slug = 'books'), 150, 4.8, 456, false, true)
ON CONFLICT (slug) DO NOTHING;
