Product.delete_all
Category.delete_all
ShoppingCart.delete_all
ShoppingCartItem.delete_all
Order.delete_all
OrderItem.delete_all

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

## Product Taxonomies
glass = Category.create!(name: "Glass", description: "Glass products", menu_image: "site/glass.png", image_url: "category/glass_category.png", image_source: "https://www.flickr.com/photos/15609463@N03/12489622214")
canvas = Category.create!(name: "Canvas", description: "Canvas products", menu_image: "site/canvas.png", image_url: "category/glass_category.png", image_source: "https://www.flickr.com/photos/15609463@N03/12489622214")
jute = Category.create!(name: "Jute", description: "Jute products", menu_image: "site/jute.png", image_url: "category/glass_category.png", image_source: "https://www.flickr.com/photos/15609463@N03/12489622214")
ceramic = Category.create!(name: "Ceramic", description: "Ceramic products", menu_image: "site/ceramic.png", image_url: "category/glass_category.png", image_source: "https://www.flickr.com/photos/15609463@N03/12489622214")
paper = Category.create!(name: "Paper", description: "Paper products",menu_image: "site/paper.png", image_url: "category/paper_category.png", image_source: "https://www.flickr.com/photos/sheila_sund/8371975708")

#glass subtaxonomy
glass_bottles = Category.create!(name: "Bottles n Flasks", description: "Glass bottles and flasks", parent: glass)
glass_paintings = Category.create!(name: "Paintings", description: "Glass paintings", parent: glass)

#paper subtaxonomy
paper_quilling = Category.create!(name: "Quilled", description: "Quilled products", parent: paper)
paper_crafts = Category.create!(name: "Crafted", description: "Crafted products", parent: paper)

#canvas subtaxonomy
canvas_accessories = Category.create!(name: "Accessories", description: "Canvas accessories", parent: canvas)
canvas_paintings = Category.create!(name: "Paintings", description: "Canvas paintings", parent: canvas)

#jute subtaxonomy
jute_bags = Category.create!(name: "Bags", description: "Jute bags", parent: jute)
jute_accessories = Category.create!(name: "Accessories", description: "Jute accessories", parent: jute)

#ceramic subtaxonomy
ceramic_diya = Category.create!(name: "Diya", description: "Ceramic diyas", parent: ceramic)
ceramic_pots = Category.create!(name: "Pots", description: "Ceramic pots", parent: ceramic)

## Canvas Products
brushless_painting_price = Price.new
brushless_painting_price.amount = 900
brushless_painting = Product.new(name: "Brushless painting", description: "Green nature on a canvas without the brush.", code: "canvaspainting01", price: brushless_painting_price, category: canvas_paintings)
brushless_painting.images << Image.new(url: "http://res.cloudinary.com/kalakrati/image/upload/v1424184579/brushless_painting_nature_y2pgyy.jpg", primary: true, public_id: "brushless_painting_nature_y2pgyy")
brushless_painting.save!

rangoli_painting_price = Price.new
rangoli_painting_price.amount = 900
rangoli_painting = Product.new(name: "Rangoli painting", description: "Readymade rangoli painting", code: "canvaspainting02", price: rangoli_painting_price, category: canvas_paintings)
rangoli_painting.images << Image.new(url: "http://res.cloudinary.com/kalakrati/image/upload/v1424286923/rangoli_painting_gyovuw.jpg", primary: true, public_id: "rangoli_painting_gyovuw")
rangoli_painting.save!

glass_look_painting_price = Price.new
glass_look_painting_price.amount = 900
glass_look_painting = Product.new(name: "Glass look painting", description: "A painting made on canvas that looks like glass.", code: "canvaspainting03", price: glass_look_painting_price, category: canvas_paintings)
glass_look_painting.images << Image.new(url: "http://res.cloudinary.com/kalakrati/image/upload/v1424184596/glass_painting_gguyv8.jpg", primary: true, public_id: "glass_painting_gguyv8")
glass_look_painting.save!

canvas_photo_frame_painting_price = Price.new
canvas_photo_frame_painting_price.amount = 1000
canvas_photo_frame_painting = Product.new(name: "Canvas photo frame", description: "A photo frame on canvas.", code: "canvaspainting04", price: canvas_photo_frame_painting_price, category: canvas_paintings)
canvas_photo_frame_painting.images << Image.new(url: "http://res.cloudinary.com/kalakrati/image/upload/v1424184518/canvas_photo_frame_cycotn.jpg", primary: true, public_id: "canvas_photo_frame_cycotn")
canvas_photo_frame_painting.save!

## Glass Products
rose_bottle_price = Price.new
rose_bottle_price.amount = 1200
rose_bottle = Product.new(name: "Rose bottle with white flowers", description: "Rose bottle with white flowers", code: "Bottle13", price: rose_bottle_price, category: glass_bottles)
rose_bottle.images << Image.new(url: "http://res.cloudinary.com/kalakrati/image/upload/v1424184537/rose_bottle_with_white_flowers_ouguln.jpg", primary: true, public_id: "rose_bottle_with_white_flowers_ouguln")
rose_bottle.save!

brown_bottle_price = Price.new
brown_bottle_price.amount = 1000
brown_bottle = Product.new(name: "Brown bottle with flowers", description: "Brown bottle with flowers", code: "Bottle12", price: brown_bottle_price, category: glass_bottles)
brown_bottle.images <<  Image.new(url: "http://res.cloudinary.com/kalakrati/image/upload/v1424184498/brown_bottle_with_flowers_3_dvcl2f.jpg", primary: true, public_id: "brown_bottle_with_flowers_3_dvcl2f")
brown_bottle.images <<  Image.new(url: "http://res.cloudinary.com/kalakrati/image/upload/v1424184523/brown_bottle_with_rope_2_fn1khk.jpg", primary: false, public_id: "brown_bottle_with_rope_2_fn1khk")
brown_bottle.save!

blue_bottle_price = Price.new
blue_bottle_price.amount = 900
blue_bottle = Product.new(name: "Blue bottles with gems", description: "Blue bottle with gems", code: "Bottle02", price: blue_bottle_price, category: glass_bottles)
blue_bottle.images <<  Image.new(url: "http://res.cloudinary.com/kalakrati/image/upload/v1424184474/blue_bottle_with_gems_2_ri90cv.jpg", primary: true, public_id: "blue_bottle_with_gems_2_ri90cv")
blue_bottle.images <<  Image.new(url: "http://res.cloudinary.com/kalakrati/image/upload/v1424184462/blue_bottle_with_gems_1_cwufbt.jpg", primary: false, public_id: "blue_bottle_with_gems_1_cwufbt")
blue_bottle.save!

green_bottle_price = Price.new
green_bottle_price.amount = 500
green_bottle = Product.new(name: "Green bottle with rope", description: "Green bottle with rope", code: "Bottle22", price: green_bottle_price, category: glass_bottles)
green_bottle.images <<  Image.new(url: "http://res.cloudinary.com/kalakrati/image/upload/v1424184532/green_bottle_with_rope_2_tivr8i.jpg", primary: true, public_id: "green_bottle_with_rope_2_tivr8i")
green_bottle.images <<  Image.new(url: "http://res.cloudinary.com/kalakrati/image/upload/v1424184522/green_bottle_with_rope_1_izafaa.jpg", primary: false, public_id: "green_bottle_with_rope_1_izafaa")
green_bottle.save!

## Paper Products
blue_basket_price = Price.new
blue_basket_price.amount = 500
blue_basket = Product.new(name: "Blue basket", description: "Blue basket for dry contents", code: "Basket12", price: blue_basket_price, category: paper_crafts)
blue_basket.images << Image.new(url: "http://res.cloudinary.com/kalakrati/image/upload/v1424184603/blue_basket_tp3k0u.jpg", primary: true, public_id: "blue_basket_tp3k0u")
blue_basket.save!

pen_stand_chilly_price = Price.new
pen_stand_chilly_price.amount = 800
pen_stand_chilly = Product.new(name: "Pen stand with chilly", description: "A pen stand with chilly. Perfect desk companion.", code: "PenStand11", price: pen_stand_chilly_price)
pen_stand_chilly.images << Image.new(url: "http://res.cloudinary.com/kalakrati/image/upload/v1424184611/pen_stand_chilly_aicvin.jpg", primary: true, public_id: "pen_stand_chilly_aicvin")
pen_stand_chilly.category = paper_crafts
pen_stand_chilly.save!

pen_stand_butterfly_price = Price.new
pen_stand_butterfly_price.amount = 800
pen_stand_butterfly = Product.new(name: "Pen stand with butterfly", description: "A pen stand with butterfly. Perfect desk companion.", code: "PenStand12", price: pen_stand_butterfly_price)
pen_stand_butterfly.images << Image.new(url: "http://res.cloudinary.com/kalakrati/image/upload/v1424184610/pen_stand_butterfly_rn5spm.jpg", primary: true, public_id: "pen_stand_butterfly_rn5spm")
pen_stand_butterfly.category = paper_crafts
pen_stand_butterfly.save!

paper_bag_fish_price = Price.new
paper_bag_fish_price.amount = 150
paper_bag_fish = Product.new(name: "Paper bag with fish", description: "A paper bag with fish art work. Perfect accessory to gift our personalized handicrafts.", code: "PaperBag12", price: paper_bag_fish_price)
paper_bag_fish.images << Image.new(url: "http://res.cloudinary.com/kalakrati/image/upload/v1424184568/paper_bag_fish_t0ixrh.jpg", primary: true, public_id: "paper_bag_fish_t0ixrh")
paper_bag_fish.category = paper_crafts
paper_bag_fish.save!
