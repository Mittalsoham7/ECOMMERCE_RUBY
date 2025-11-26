# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

require 'faker'

puts "🌱 Starting seed process..."
puts "Clearing existing data..."

# Clear existing data
OrderItem.destroy_all
Order.destroy_all
Address.destroy_all
User.destroy_all
Province.destroy_all
ProductCategory.destroy_all
Product.destroy_all
Category.destroy_all

puts "✅ Existing data cleared"
puts ""

# Create Provinces with correct tax rates (Feature 3.1.5)
puts "Creating provinces with tax rates..."

provinces_data = [
  { name: "Alberta", gst_rate: 0.05, pst_rate: 0.00, hst_rate: 0.00 },
  { name: "British Columbia", gst_rate: 0.05, pst_rate: 0.07, hst_rate: 0.00 },
  { name: "Manitoba", gst_rate: 0.05, pst_rate: 0.07, hst_rate: 0.00 },
  { name: "New Brunswick", gst_rate: 0.00, pst_rate: 0.00, hst_rate: 0.15 },
  { name: "Newfoundland and Labrador", gst_rate: 0.00, pst_rate: 0.00, hst_rate: 0.15 },
  { name: "Northwest Territories", gst_rate: 0.05, pst_rate: 0.00, hst_rate: 0.00 },
  { name: "Nova Scotia", gst_rate: 0.00, pst_rate: 0.00, hst_rate: 0.15 },
  { name: "Nunavut", gst_rate: 0.05, pst_rate: 0.00, hst_rate: 0.00 },
  { name: "Ontario", gst_rate: 0.00, pst_rate: 0.00, hst_rate: 0.13 },
  { name: "Prince Edward Island", gst_rate: 0.00, pst_rate: 0.00, hst_rate: 0.15 },
  { name: "Quebec", gst_rate: 0.05, pst_rate: 0.09975, hst_rate: 0.00 },
  { name: "Saskatchewan", gst_rate: 0.05, pst_rate: 0.06, hst_rate: 0.00 },
  { name: "Yukon", gst_rate: 0.05, pst_rate: 0.00, hst_rate: 0.00 }
]

provinces = provinces_data.map do |prov_data|
  province = Province.create!(prov_data)
  puts "  ✓ Created province: #{province.name} (Total tax: #{(province.total_tax_rate * 100).round(2)}%)"
  province
end

puts "✅ #{provinces.count} provinces created"
puts ""

# Create Categories
puts "Creating categories..."

categories_data = [
  {
    name: "Soy Candles",
    description: "Hand-poured soy candles made with natural soy wax and premium fragrance oils. Clean burning and eco-friendly."
  },
  {
    name: "Beeswax Candles",
    description: "Pure beeswax candles that naturally purify the air. Long-lasting with a subtle honey aroma."
  },
  {
    name: "Wax Melts",
    description: "Flameless fragrance wax melts perfect for any wax warmer. Intense scent throw without the flame."
  },
  {
    name: "Essential Oils",
    description: "100% pure therapeutic grade essential oils. Perfect for aromatherapy, diffusers, and DIY projects."
  },
  {
    name: "Diffusers",
    description: "Reed diffusers and ultrasonic diffusers to fill your space with continuous fragrance."
  },
  {
    name: "Room Sprays",
    description: "Instant room refreshers with natural ingredients. Quick and effective home fragrance solution."
  },
  {
    name: "Gift Sets",
    description: "Curated gift collections perfect for any occasion. Beautifully packaged artisan fragrance sets."
  },
  {
    name: "Seasonal Collection",
    description: "Limited edition seasonal scents celebrating the essence of each season."
  }
]

categories = categories_data.map do |cat_data|
  category = Category.create!(cat_data)
  puts "  ✓ Created category: #{category.name}"
  category
end

puts "✅ #{categories.count} categories created"
puts ""

# Scent profiles for products
scent_profiles = {
  floral: ["Lavender", "Rose", "Jasmine", "Peony", "Gardenia", "Lily", "Magnolia", "Honeysuckle"],
  citrus: ["Lemon", "Orange", "Grapefruit", "Bergamot", "Lime", "Mandarin"],
  woody: ["Sandalwood", "Cedar", "Pine", "Oakmoss", "Patchouli", "Vetiver"],
  fresh: ["Ocean Breeze", "Fresh Linen", "Rain", "Eucalyptus", "Mint", "Bamboo"],
  sweet: ["Vanilla", "Caramel", "Honey", "Brown Sugar", "Cinnamon", "Maple"],
  herbal: ["Sage", "Rosemary", "Thyme", "Basil", "Tea Tree"],
  fruity: ["Apple", "Peach", "Berry", "Coconut", "Mango", "Pear"],
  spicy: ["Clove", "Ginger", "Cardamom", "Black Pepper", "Nutmeg"]
}

# Product templates for each category
puts "Creating products..."

# Soy Candles (30 products)
soy_candles_category = categories.find { |c| c.name == "Soy Candles" }
30.times do |i|
  scent_type = scent_profiles.keys.sample
  scent = scent_profiles[scent_type].sample
  
  # Feature 2.4 - Mark some products as on_sale
  is_on_sale = i % 5 == 0  # Every 5th product is on sale
  
  product = Product.create!(
    name: "#{scent} Soy Candle",
    description: "Hand-poured soy candle with #{scent.downcase} fragrance. Made with 100% natural soy wax and cotton wick. Burns clean for approximately 40-50 hours. Perfect for creating a cozy atmosphere in any room.",
    price: rand(18.99..34.99).round(2),
    stock_quantity: rand(5..50),
    on_sale: is_on_sale
  )
  product.categories << soy_candles_category
  print "."
end
puts "\n  ✓ Created 30 Soy Candles"

# Beeswax Candles (15 products)
beeswax_category = categories.find { |c| c.name == "Beeswax Candles" }
15.times do |i|
  styles = ["Pillar", "Taper", "Votive", "Tea Light", "Rolled"]
  style = styles.sample
  
  product = Product.create!(
    name: "#{style} Beeswax Candle",
    description: "Pure beeswax #{style.downcase} candle with natural honey scent. Naturally purifies air while burning. Long-lasting and eco-friendly. Handcrafted with 100% Canadian beeswax.",
    price: rand(12.99..45.99).round(2),
    stock_quantity: rand(5..40)
  )
  product.categories << beeswax_category
  print "."
end
puts "\n  ✓ Created 15 Beeswax Candles"

# Wax Melts (25 products)
wax_melts_category = categories.find { |c| c.name == "Wax Melts" }
25.times do |i|
  scent_type = scent_profiles.keys.sample
  scent = scent_profiles[scent_type].sample
  
  # Feature 2.4 - Mark some products as on_sale
  is_on_sale = i % 4 == 0  # Every 4th product is on sale
  
  product = Product.create!(
    name: "#{scent} Wax Melts",
    description: "Highly scented wax melts with #{scent.downcase} fragrance. Each pack contains 6 cubes providing 20-30 hours of fragrance. Perfect for flameless home fragrance. Compatible with any wax warmer.",
    price: rand(8.99..15.99).round(2),
    stock_quantity: rand(10..60),
    on_sale: is_on_sale
  )
  product.categories << wax_melts_category
  print "."
end
puts "\n  ✓ Created 25 Wax Melts"

# Essential Oils (20 products)
essential_oils_category = categories.find { |c| c.name == "Essential Oils" }
essential_oil_types = ["Lavender", "Peppermint", "Eucalyptus", "Tea Tree", "Lemon", "Orange", "Frankincense", 
                       "Rosemary", "Chamomile", "Ylang Ylang", "Bergamot", "Cedarwood", "Clary Sage", 
                       "Geranium", "Grapefruit", "Jasmine", "Lemongrass", "Patchouli", "Rose", "Sandalwood"]

essential_oil_types.each do |oil|
  product = Product.create!(
    name: "#{oil} Essential Oil",
    description: "100% pure therapeutic grade #{oil.downcase} essential oil. Perfect for aromatherapy, diffusers, massage, and DIY projects. Steam distilled for maximum purity. 15ml bottle with dropper.",
    price: rand(12.99..29.99).round(2),
    stock_quantity: rand(15..50)
  )
  product.categories << essential_oils_category
  print "."
end
puts "\n  ✓ Created 20 Essential Oils"

# Diffusers (12 products)
diffusers_category = categories.find { |c| c.name == "Diffusers" }
diffuser_types = [
  { name: "Bamboo Reed Diffuser", desc: "Natural bamboo reeds in elegant glass bottle" },
  { name: "Ceramic Ultrasonic Diffuser", desc: "Whisper-quiet ultrasonic technology with LED lights" },
  { name: "Wood Grain Diffuser", desc: "Modern wood grain finish with auto shut-off" },
  { name: "Glass Reed Diffuser Set", desc: "Handblown glass with premium fragrance oil" },
  { name: "Portable USB Diffuser", desc: "Compact and travel-friendly USB powered" },
  { name: "Smart WiFi Diffuser", desc: "App-controlled with scheduling features" },
  { name: "Himalayan Salt Diffuser", desc: "Natural salt lamp with aromatherapy function" },
  { name: "Marble Effect Diffuser", desc: "Elegant marble design for any decor" },
  { name: "Rattan Reed Diffuser", desc: "Bohemian style with natural rattan reeds" },
  { name: "Crystal Diffuser", desc: "Features genuine crystal stones" },
  { name: "Minimalist Ceramic Diffuser", desc: "Sleek Scandinavian design" },
  { name: "Vintage Brass Diffuser", desc: "Antique brass finish reed diffuser" }
]

diffuser_types.each do |diffuser|
  product = Product.create!(
    name: diffuser[:name],
    description: "#{diffuser[:desc]}. Provides continuous fragrance for your home or office. Easy to use and maintain. Includes starter fragrance oil.",
    price: rand(24.99..79.99).round(2),
    stock_quantity: rand(5..30)
  )
  product.categories << diffusers_category
  print "."
end
puts "\n  ✓ Created 12 Diffusers"

# Room Sprays (18 products)
room_sprays_category = categories.find { |c| c.name == "Room Sprays" }
18.times do |i|
  scent_type = scent_profiles.keys.sample
  scent = scent_profiles[scent_type].sample
  
  # Feature 2.4 - Mark some products as on_sale
  is_on_sale = i % 3 == 0  # Every 3rd product is on sale
  
  product = Product.create!(
    name: "#{scent} Room Spray",
    description: "Instant room refresher with #{scent.downcase} fragrance. Made with natural ingredients and essential oils. Quick-drying formula that eliminates odors. 8oz spray bottle provides 200+ sprays.",
    price: rand(14.99..22.99).round(2),
    stock_quantity: rand(10..50),
    on_sale: is_on_sale
  )
  product.categories << room_sprays_category
  print "."
end
puts "\n  ✓ Created 18 Room Sprays"

# Gift Sets (10 products)
gift_sets_category = categories.find { |c| c.name == "Gift Sets" }
gift_set_types = [
  { name: "Relaxation Gift Set", items: "lavender candle, bath salts, and essential oil" },
  { name: "Spa Day Collection", items: "eucalyptus candle, room spray, and wax melts" },
  { name: "Seasonal Sampler", items: "4 mini candles in seasonal scents" },
  { name: "Essential Oils Starter Kit", items: "5 popular essential oils with diffuser" },
  { name: "Candle Lover's Bundle", items: "3 full-size candles in complementary scents" },
  { name: "Home Fragrance Collection", items: "candle, room spray, and wax melts" },
  { name: "Aromatherapy Set", items: "diffuser with 3 essential oil blends" },
  { name: "Luxury Candle Trio", items: "3 premium soy candles in gift box" },
  { name: "Self-Care Package", items: "candle, bath products, and room spray" },
  { name: "Hostess Gift Set", items: "candle, wax melts, and matches in gift bag" }
]

gift_set_types.each do |gift_set|
  product = Product.create!(
    name: gift_set[:name],
    description: "Beautifully curated gift set including #{gift_set[:items]}. Perfectly packaged in our signature gift box with ribbon. Ideal for birthdays, holidays, or any special occasion.",
    price: rand(39.99..89.99).round(2),
    stock_quantity: rand(5..25)
  )
  product.categories << gift_sets_category
  print "."
end
puts "\n  ✓ Created 10 Gift Sets"

# Seasonal Collection (15 products)
seasonal_category = categories.find { |c| c.name == "Seasonal Collection" }
seasonal_products = [
  { name: "Autumn Harvest Candle", desc: "Warm notes of apple, cinnamon, and clove" },
  { name: "Winter Wonderland Candle", desc: "Fresh pine, peppermint, and vanilla" },
  { name: "Spring Blossom Candle", desc: "Delicate cherry blossom and fresh rain" },
  { name: "Summer Citrus Candle", desc: "Bright lemon, orange, and grapefruit" },
  { name: "Pumpkin Spice Wax Melts", desc: "Classic fall favorite with real pumpkin" },
  { name: "Cranberry Woods Room Spray", desc: "Tart cranberry with cedarwood" },
  { name: "Fresh Cut Pine Candle", desc: "Like a walk through a winter forest" },
  { name: "Lavender Fields Candle", desc: "Summer lavender in full bloom" },
  { name: "Apple Cider Candle", desc: "Warm spiced apple cider" },
  { name: "Beach House Room Spray", desc: "Ocean breeze and sun-kissed sand" },
  { name: "Fireside S'mores Candle", desc: "Toasted marshmallow and chocolate" },
  { name: "Garden Herb Candle", desc: "Fresh basil, mint, and rosemary" },
  { name: "Holiday Spice Wax Melts", desc: "Cinnamon, nutmeg, and orange" },
  { name: "Spring Rain Diffuser", desc: "Clean, fresh rainfall scent" },
  { name: "Maple Bourbon Candle", desc: "Rich maple with warm bourbon notes" }
]

seasonal_products.each do |seasonal|
  product = Product.create!(
    name: seasonal[:name],
    description: "Limited edition seasonal fragrance. #{seasonal[:desc]}. Part of our exclusive seasonal collection, available for a limited time only. Hand-poured with premium ingredients.",
    price: rand(19.99..36.99).round(2),
    stock_quantity: rand(5..35)
  )
  product.categories << seasonal_category
  print "."
end
puts "\n  ✓ Created 15 Seasonal Products"

puts ""
puts "✅ Seed completed successfully!"
puts ""
puts "📊 Summary:"
puts "  Categories: #{Category.count}"
puts "  Products: #{Product.count}"
puts "  Product-Category associations: #{ProductCategory.count}"
puts ""
puts "🎉 Scented Studio database is ready!"
