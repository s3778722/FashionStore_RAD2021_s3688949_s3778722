# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


=begin 
create_table "products", force: :cascade do |t|
    t.string "title"
    t.text "desc"
    t.decimal "price"
    t.date "date_stocked"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "popularity"
end
=end
User.destroy_all
Product.destroy_all
Category.destroy_all
Image.destroy_all
Collection.destroy_all
ProductVariant.destroy_all

u1 = User.create(username: "admin", password: "admin", email: "admin@gmail.com")

p1 = Product.create(title: 'Short Sleeve Knit Polo', desc: 
    "Crafted from light and breathable cotton pique and finished with a classic flat knit collar and two-button placket, the Short Sleeve Knit Polo Shirt by Polo Ralph Lauren is a US patriot's dream. We love the unmistakable pony logo embroidered to the chest for a nod to the brand's sporting heritage.

    Length: 68cm (size medium). Our model is 186.7cm (6’1.5”) tall with a 96.5cm (38”) chest and a 81.3cm (32”) waist.
    
    - Cotton pique; natural stretch 
    - Flat knit polo collar; two-button
    - Printed, sewn and embroidered designs to front", price: 199.00, date_stocked: DateTime.new(2020, 5, 8))
p1.collections.create(title: "Premium")
p1.collections.create(title: "Polo")
p1.categories.create(title: "Men")
p1.images.create(url: "https://rad-product-img.s3.us-east-2.amazonaws.com/polo1.jpg")
p1.images.create(url: "https://rad-product-img.s3.us-east-2.amazonaws.com/polo2.jpg")
p1.product_variants.create(size: "S", color: "Navy")

p2 = Product.create(title: 'Core Stretch Slim Poplin Shirt', desc: 
    "One of the world’s leading designer lifestyle brands, Tommy Hilfiger is the essence of classic American style. Hilfiger’s signature collection was introduced in the mid-‘80s, showcasing long-lasting accessories and time-honoured staples including button-up shirts, chinos and knits expertly modernised with updated fits and details. Recognised internationally for its iconic red, white and blue flag logo, the brand’s relaxed and youthful attitude has remained a distinctive hallmark throughout their collections.

    Our model is wearing a size medium shirt. He is 182.9cm (6’0”) tall with a 91.4cm (36”) chest and a 76.2cm (30”) waist.
    
    - Length: 78cm (size medium) 
    - Slim fit 
    - Cotton-rich poplin; some stretch 
    - Black 
    - Button-down collar 
    - Button-through front 
    - Long sleeves; barrel cuffs 
    - Navy, red and white flag embroidery to the left chest 
    - Rear waist darts", price: 149.00, date_stocked: DateTime.new(2020, 5, 8))
p2.collections.create(title: "Premium")
p2.collections.create(title: "Long Sleeves")
p2.collections.create(title: "Tommy Hilfiger")
p2.categories.create(title: "Men")
p2.images.create(url: "https://rad-product-img.s3.us-east-2.amazonaws.com/tommy1.jpg")
p2.images.create(url: "https://rad-product-img.s3.us-east-2.amazonaws.com/tommy2.jpg")
p2.product_variants.create(size: "S", color: "Flag Black")