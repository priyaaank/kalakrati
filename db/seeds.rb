# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

## Product Taxonomies
glass = Category.create!(name: "Glass", description: "Glass products", image_url: "category/glass_category.png", image_source: "https://www.flickr.com/photos/15609463@N03/12489622214")
canvas = Category.create!(name: "Canvas", description: "Canvas products", image_url: "category/glass_category.png", image_source: "https://www.flickr.com/photos/15609463@N03/12489622214")
jute = Category.create!(name: "Jute", description: "Jute products", image_url: "category/glass_category.png", image_source: "https://www.flickr.com/photos/15609463@N03/12489622214")
pottery = Category.create!(name: "Pottery", description: "Pottery products", image_url: "category/glass_category.png", image_source: "https://www.flickr.com/photos/15609463@N03/12489622214")
paper = Category.create!(name: "Paper", description: "Paper products", image_url: "category/paper_category.png", image_source: "https://www.flickr.com/photos/sheila_sund/8371975708")

#glass subtaxonomy
glass_bottles = Category.create!(name: "Bottles n Flasks", description: "Glass bottles and flasks", parent: glass)
glass_paintings = Category.create!(name: "Paintings", description: "Glass paintings", parent: glass)

#glass subtaxonomy
paper_quilling = Category.create!(name: "Quilling", description: "Paper quilling products", parent: paper)
paper_crafts = Category.create!(name: "Crafts", description: "Paper craft products", parent: paper)

#canvas subtaxonomy
canvas_accessories = Category.create!(name: "Accessories", description: "Canvas accessories", parent: canvas)
canvas_paintings = Category.create!(name: "Paintings", description: "Canvas paintings", parent: canvas)

#jute subtaxonomy
jute_bags = Category.create!(name: "Bags", description: "Jute bags", parent: jute)
jute_accessories = Category.create!(name: "Accessories", description: "Jute accessories", parent: jute)

#pottery subtaxonomy
pottery_diya = Category.create!(name: "Diya", description: "Pottery diyas", parent: pottery)
pottery_pots = Category.create!(name: "Pots", description: "Pottery pots", parent: pottery)



## Glass Products
rose_bottle_price = Price.new
rose_bottle_price.amount = 1200
rose_bottle = Product.new(name: "Rose bottle with white flowers", description: "Rose bottle with white flowers", code: "Bottle13", price: rose_bottle_price, category: glass_bottles)
rose_bottle.images << Image.new(url: "product/glass/rose_bottle_with_white_flowers.jpg", primary: true)
rose_bottle.save!

brown_bottle_price = Price.new
brown_bottle_price.amount = 1000
brown_bottle = Product.new(name: "Brown bottle with flowers", description: "Brown bottle with flowers", code: "Bottle12", price: brown_bottle_price, category: glass_bottles)
brown_bottle.images <<  Image.new(url: "product/glass/brown_bottle_with_rope_1.jpg", primary: true)
brown_bottle.images <<  Image.new(url: "product/glass/brown_bottle_with_rope_2.jpg", primary: false)
brown_bottle.save!

blue_bottle_price = Price.new
blue_bottle_price.amount = 900
blue_bottle = Product.new(name: "Blue bottles with gems", description: "Blue bottle with gems", code: "Bottle02", price: blue_bottle_price, category: glass_bottles)
blue_bottle.images <<  Image.new(url: "product/glass/blue_bottle_with_gems_1.jpg", primary: true)
blue_bottle.images <<  Image.new(url: "product/glass/blue_bottle_with_gems_2.jpg", primary: false)
blue_bottle.save!

green_bottle_price = Price.new
green_bottle_price.amount = 500
green_bottle = Product.new(name: "Green bottle with rope", description: "Green bottle with rope", code: "Bottle22", price: green_bottle_price, category: glass_bottles)
green_bottle.images <<  Image.new(url: "product/glass/green_bottle_with_rope_1.jpg", primary: true)
green_bottle.images <<  Image.new(url: "product/glass/green_bottle_with_rope_2.jpg", primary: false)
green_bottle.save!

## Paper Products
blue_basket_price = Price.new
blue_basket_price.amount = 500
blue_basket = Product.new(name: "Blue basket", description: "Blue basket for dry contents", code: "Basket12", price: blue_basket_price, category: paper_crafts)
blue_basket.images << Image.new(url: "product/paper/blue_basket.jpg", primary: true)
blue_basket.save!


pen_stand_chilly_price = Price.new
pen_stand_chilly_price.amount = 800
pen_stand_chilly = Product.new(name: "Pen stand with chilly", description: "A pen stand with chilly. Perfect desk companion.", code: "PenStand11", price: pen_stand_chilly_price)
pen_stand_chilly.images << Image.new(url: "product/paper/pen_stand_chilly.jpg", primary: true)
pen_stand_chilly.category = paper_crafts
pen_stand_chilly.save!

pen_stand_butterfly_price = Price.new
pen_stand_butterfly_price.amount = 800
pen_stand_butterfly = Product.new(name: "Pen stand with butterfly", description: "A pen stand with butterfly. Perfect desk companion.", code: "PenStand12", price: pen_stand_butterfly_price)
pen_stand_butterfly.images << Image.new(url: "product/paper/pen_stand_butterfly.jpg", primary: true)
pen_stand_butterfly.category = paper_crafts
pen_stand_butterfly.save!

paper_bag_fish_price = Price.new
paper_bag_fish_price.amount = 150
paper_bag_fish = Product.new(name: "Paper bag with fish", description: "A paper bag with fish art work. Perfect accessory to gift our personalized handicrafts.", code: "PaperBag12", price: paper_bag_fish_price)
paper_bag_fish.images << Image.new(url: "product/paper/paper_bag_fish.jpg", primary: true)
paper_bag_fish.category = paper_crafts
paper_bag_fish.save!
