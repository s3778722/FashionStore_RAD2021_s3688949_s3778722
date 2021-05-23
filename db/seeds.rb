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

c1 = Category.create(title: "Men")
c2 = Category.create(title: "Women")
c3 = Category.create(title: "Kids")

u1 = User.create(username: "admin1", password: "adminadmin", password_confirmation: "adminadmin", email: "admin1@gmail.com")
p1 = Product.create(title: 'Short Sleeve Knit Polo', desc: 
    "Crafted from light and breathable cotton pique and finished with a classic flat knit collar and two-button placket, the Short Sleeve Knit Polo Shirt by Polo Ralph Lauren is a US patriot's dream. We love the unmistakable pony logo embroidered to the chest for a nod to the brand's sporting heritage.

    Length: 68cm (size medium). Our model is 186.7cm (6’1.5”) tall with a 96.5cm (38”) chest and a 81.3cm (32”) waist.
    
    - Cotton pique; natural stretch 
    - Flat knit polo collar; two-button
    - Printed, sewn and embroidered designs to front", price: 199.00, date_stocked: DateTime.new(2020, 5, 8), popularity: 3)
p1.collections.create(title: "Premium")
p1.collections.create(title: "Polo")
p1.categories << c1
p1.images.create(url: "https://rad-product-img.s3.us-east-2.amazonaws.com/polo1.jpg")
p1.images.create(url: "https://rad-product-img.s3.us-east-2.amazonaws.com/polo2.jpg")
p1.product_variants.create(size: "S", color: "Navy")
p1.product_variants.create(size: "M", color: "Navy")
p1.product_variants.create(size: "L", color: "Navy")

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
    - Rear waist darts", price: 149.00, date_stocked: DateTime.new(2020, 5, 8), popularity: 5)
p2.collections.create(title: "Premium")
p2.collections.create(title: "Long Sleeves")
p2.collections.create(title: "Tommy Hilfiger")
p2.categories << c1
p2.images.create(url: "https://rad-product-img.s3.us-east-2.amazonaws.com/tommy1.jpg")
p2.images.create(url: "https://rad-product-img.s3.us-east-2.amazonaws.com/tommy2.jpg")
p2.product_variants.create(size: "S", color: "Flag Black")

p3 = Product.create(title: 'White Stretch Travel Shirt', desc: 
    "Black shirts like the Oxford WhiteStretch Travel Shirt go really well with dark suits for evening events, making this style a good choice. Cut in a slim fit, the garment is cotton-blended with a touch of stretch so it doesn't feel restrictive.


    Our model is wearing size medium shirt, and usually takes a size medium. He is 6'2\" (188cm) tall with a 37\" (94cm) chest and a 31.5\" (80cm) waist.
    
    
    - Length: 79cm (Size M)
    - Slim fit
    - White stretch fabric
    - Small collar
    - Oxford engraved buttons
    - Single button cuffs
    - 82% Cotton 16% Nylon 2% Spandex", price: 69.00, date_stocked: DateTime.new(2020, 5, 15), popularity: 1)
p3.collections.create(title: "Office Wear")
p3.collections.create(title: "Long Sleeves")
p3.collections.create(title: "Slim Fit")
p3.categories << c1
p3.images.create(url: "https://rad-product-img.s3.us-east-2.amazonaws.com/oxford1.jpg")
p3.images.create(url: "https://rad-product-img.s3.us-east-2.amazonaws.com/oxford2.jpg")
p3.product_variants.create(size: "S", color: "White")

p4 = Product.create(title: 'SAS Active Super-Soft Hoodie', desc: 
    "SAS ACTIVE Super-Soft Hoodies are oversized and longline. Perfect contemporary style to wear over leggings in the cooler months. Australian owned and designed, by School Active Sports, to be so comfortable kids will never want to take them off.


    Our model is wearing a size Kids AU 12 hoodie. She is 13 yrs old, 166cm tall with a 74cm bust, 63cm waist and 86cm hips.
    
    
    - Length: 67cm (Kids AU 12) Our model is wearing a size Kids AU 12 hoodie. She is 13 yrs old, 166cm tall with a 74cm bust, 63cm waist and 86cm hips.
    - Cotton rich super-soft fabric
    - Oversized hoods
    - Front pocket
    - Sleeves with a thumb hole in the cuff
    - 60% Cotton, 40% Polyeste", price: 49.95, date_stocked: DateTime.new(2021, 3, 15), popularity: 1)
p4.collections.create(title: "Hoodies")
p4.collections.create(title: "Long Sleeves")
p4.collections.create(title: "Sports")
p4.categories << c3
p4.images.create(url: "https://kevymusicapp.s3.amazonaws.com/SASActiveSuper-SoftHoodie.jpg")
p4.images.create(url: "https://kevymusicapp.s3.amazonaws.com/SASActiveSuper-SoftHoodie2.jpg")
p4.product_variants.create(size: "S", color: "White")
p4.product_variants.create(size: "M", color: "White")
p4.product_variants.create(size: "L", color: "White")
p4.product_variants.create(size: "S", color: "Black")
p4.product_variants.create(size: "M", color: "Black")
p4.product_variants.create(size: "L", color: "Black")

p5 = Product.create(title: 'Smock Mini Dress', desc: 
    "Epitomising endless summer, Sydney label AERE offers more sustainable wardrobe staples in neutral hues and time-honoured fits. From women’s sun dresses and cropped blouses to button-ups and relaxed trousers for the boys, an AERE piece is an investment in the effortlessness of minimalist style.

    Our model is 177.8cm (5’10”) tall with a 81.3cm (32”) bust, a 68.6cm (27”) waist and 92.7cm (36.5”) hips.
    
    - Pure woven linen; lightweight with minimal stretch
    - Buttoned V-neck collar with ruffle detail
    - Tiered ruffles
    - Relaxed sleeves
    - Lined", price: 129.00, date_stocked: DateTime.new(2021, 1, 30), popularity: 1)
p5.collections.create(title: "Dresses")
p5.collections.create(title: "Premium")
p5.collections.create(title: "Summer")
p5.categories << c2
p5.images.create(url: "https://kevymusicapp.s3.amazonaws.com/SmockMiniDress.jpg")
p5.images.create(url: "https://kevymusicapp.s3.amazonaws.com/SmockMiniDress2.jpg")
p5.images.create(url: "https://kevymusicapp.s3.amazonaws.com/SmockMiniDress3.jpg")
p5.product_variants.create(size: "S", color: "Pink")
p5.product_variants.create(size: "M", color: "Pink")


