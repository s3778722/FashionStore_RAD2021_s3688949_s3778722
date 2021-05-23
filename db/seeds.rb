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
u2 = User.create(username: "RAD", password: "Rails2021", password_confirmation: "Rails2021", email: "rad2021rmit@gmail.com")
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

p6 = Product.create(title: 'Blue Crush T-Shirt', desc: 
    "Rock Your Kid delivers fun and fresh collections of kidswear your little one's bound to love. Playful prints and whimsical patterns sit alongside urban-inspired basics and outerwear, creating the perfect foundation for stylish kids who aren't afraid to be bold and stand out.

    - Length: 53cm (size 8 years)
    - Soft cotton jersey blend; slight stretch
    - Tie dye print
    - Round neckline", price: 36.00, date_stocked: DateTime.new(2020, 3, 11), popularity: 1)
p6.collections.create(title: "T-Shirt")
p6.collections.create(title: "Summer")
p6.categories << c3
p6.images.create(url: "https://kevymusicapp.s3.amazonaws.com/shirt1.jpg")
p6.images.create(url: "https://kevymusicapp.s3.amazonaws.com/shirt2.jpg")
p6.product_variants.create(size: "M", color: "Blue")
p6.product_variants.create(size: "L", color: "Blue")

p7 = Product.create(title: 'Payton Wide Leg Pant', desc: 
    "Full of nostalgia, and crafted with a sustainable approach. Gelati Jeans is bringing teen girls across the country the latest trends. Apparently skinny legs are cancelled, so we're making sure she's got the comfiest wide leg style's this winter. A high-waisted style with pockets and raw edge hems, Payton has been crafted in Melbourne from premium cotton. Hand dyed to a lovely lilac and made to match the Payton Crop Sweat.
    
    Model is wearing a size L. She is 173.0cm (5'67”) tall with a 81cm (32”) bust, a 61cm (24”) waist and 89cm (35”) hips.
    
    - Length: 98 cm (Size M)
    - High waisted, elastic waistband, full length, wide leg.
    - Light-weight premium unbrushed cotton fleece
    - Lilac purple shade; opaque; hand garment dyed in Melbourne
    - Made in Australia", price: 69.00, date_stocked: DateTime.new(2021, 1, 3), popularity: 1)
p7.collections.create(title: "Pants")
p7.collections.create(title: "Premium")
p7.categories << c3
p7.images.create(url: "https://kevymusicapp.s3.amazonaws.com/trackies.jpg")
p7.images.create(url: "https://kevymusicapp.s3.amazonaws.com/trackies2.jpg")
p7.images.create(url: "https://kevymusicapp.s3.amazonaws.com/trackies3.jpg")
p7.product_variants.create(size: "S", color: "Lavender")
p7.product_variants.create(size: "M", color: "Lavender")
p7.product_variants.create(size: "L", color: "Lavender")

p8 = Product.create(title: 'Disney Comfy Princess Tights', desc: 
    "The perfect fusion of form and function, adidas Performance blends cutting edge designs and technical fabrics with the latest trends to create activewear with a difference. 
    
    Whatever your sport, adidas Performance has the design for you, with an extensive range of tops, tights, shorts and performance shoes, as well as a broad offering of accessories.
    
    - Length: Inside Leg: 56cm. Rise: 15cm. Leg Opening: 20cm (size 7-8 years)
    - Performance-blend double knit; super stretchy; opaque
    - Elasticised waistband
    - All-over Disney print", price: 55.00, date_stocked: DateTime.new(2021, 4, 3), popularity: 1)
p8.collections.create(title: "Pants")
p8.collections.create(title: "Sports")
p8.categories << c3
p8.images.create(url: "https://kevymusicapp.s3.amazonaws.com/adidas.jpg")
p8.images.create(url: "https://kevymusicapp.s3.amazonaws.com/adidas2.jpg")
p8.product_variants.create(size: "S", color: "Multi")
p8.product_variants.create(size: "M", color: "Multi")

p9 = Product.create(title: 'Penelope Long Sleeve Tee', desc: 
    "As part of the great Cotton On kingdom, Cotton On Kids is a one-stop-shop for high value BABY, KIDS and TWEEN collections designed for active, growing bodies to live and play in throughout the year.

    - Length: 55cm (size 8 years)
    - Pure cotton jersey; slight stretch; opaque
    - Graphic illustration print to chest", price: 16.99, date_stocked: DateTime.new(2020, 11, 9), popularity: 1)
p9.collections.create(title: "Long Sleeves")
p9.categories << c3
p9.images.create(url: "https://kevymusicapp.s3.amazonaws.com/kidslong.jpg")
p9.images.create(url: "https://kevymusicapp.s3.amazonaws.com/kidslong2.jpg")
p9.product_variants.create(size: "S", color: "Purple")
p9.product_variants.create(size: "M", color: "Purple")
p9.product_variants.create(size: "L", color: "Purple")
p9.product_variants.create(size: "S", color: "Peach")
p9.product_variants.create(size: "M", color: "Peach")
p9.product_variants.create(size: "L", color: "Peach")
p9.product_variants.create(size: "S", color: "White")
p9.product_variants.create(size: "M", color: "White")
p9.product_variants.create(size: "L", color: "White")

p10 = Product.create(title: 'Youth Martha Long Sleeve T Shirt', desc: 
    "Founded in 1994, US-based brand DC Shoes has catapulted from a performance skateboard footwear label to a globally recognised brand. Deeply rooted in the American skate culture, DC Shoes offers an array of skate apparel with a distinct urban appeal. Regarded highly by countless world-class athletes, DC Shoes is both symbolic and cutting edge.
    
    -100% Cotton
    -Fabric: Thick pure cotton flannel fabric
    -Fit: Comfortable regular fit
    -Closure/Neck: Button down collar
    -Chest pockets with button closure
    -Lightly brushed for softness", price: 47.99, date_stocked: DateTime.new(2020, 10, 14), popularity: 1)
p10.collections.create(title: "Long Sleeves")
p10.collections.create(title: "Premium")
p10.categories << c3
p10.images.create(url: "https://kevymusicapp.s3.amazonaws.com/dc1.jpg")
p10.images.create(url: "https://kevymusicapp.s3.amazonaws.com/dc2.jpg")
p10.images.create(url: "https://kevymusicapp.s3.amazonaws.com/dc3.jpg")
p10.product_variants.create(size: "S", color: "Black")
p10.product_variants.create(size: "M", color: "Black")
p10.product_variants.create(size: "L", color: "Black")

p11 = Product.create(title: 'Youth Martha Long Sleeve T Shirt', desc: 
    "Set to be your weekend go-to, the A Brand A High Skinny Ankle Basher Jeans have a flattering high-rise cut. Distressed patches lend the pair a cool, lived-in aesthetic.

    Length: Inside Leg: 70cm; Front Rise: 26cm; Leg Opening: 24cm (size AU 8). Our model is 174.0cm (5’8.5”) tall with a 81.3cm (32”) bust, a 63.5cm (25”) waist and 94.0cm (37”) hips.

    - Cotton-rich denim with stretch
    - Fitted design; high-waisted
    - Black wash
    - Zip fly; belt loops
    - Classic five pocket design
    - Distressed patches", price: 129.95, date_stocked: DateTime.new(2020, 5, 22), popularity: 1)
p11.collections.create(title: "Pants")
p11.collections.create(title: "Jeans")
p11.categories << c2
p11.images.create(url: "https://kevymusicapp.s3.amazonaws.com/jeans.jpg")
p11.images.create(url: "https://kevymusicapp.s3.amazonaws.com/jeans2.jpg")
p11.images.create(url: "https://kevymusicapp.s3.amazonaws.com/jeans3.jpg")
p11.product_variants.create(size: "S", color: "Black")
p11.product_variants.create(size: "M", color: "Black")
p11.product_variants.create(size: "L", color: "Black")
p11.product_variants.create(size: "S", color: "Blue")
p11.product_variants.create(size: "M", color: "Blue")
p11.product_variants.create(size: "L", color: "Blue")
