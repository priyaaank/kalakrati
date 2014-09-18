# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

rose_bottle = Product.new(name: "Rose bottle with white flowers", description: "Rose bottle with white flowers", code: "Bottle13", price: 1200)
rose_bottle.images << Image.new(url: "product/paper/rose_bottle_with_white_flowers.jpg", primary: true)
rose_bottle.save!

brown_bottle = Product.new(name: "Brown bottle with flowers", description: "Brown bottle with flowers", code: "Bottle12", price: 1000)
brown_bottle.images <<  Image.new(url: "product/paper/brown_bottle_with_rope_1.jpg", primary: true)
brown_bottle.images <<  Image.new(url: "product/paper/brown_bottle_with_rope_2.jpg", primary: false)
brown_bottle.save!

blue_bottle = Product.new(name: "Blue bottles with gems", description: "Blue bottle with gems", code: "Bottle02", price: 900)
blue_bottle.images <<  Image.new(url: "product/paper/blue_bottle_with_gems_1.jpg", primary: true)
blue_bottle.images <<  Image.new(url: "product/paper/blue_bottle_with_gems_2.jpg", primary: false)
blue_bottle.save!

green_bottle = Product.new(name: "Green bottle with rope", description: "Green bottle with rope", code: "Bottle22", price: 500)
green_bottle.images <<  Image.new(url: "product/paper/green_bottle_with_rope_1.jpg", primary: true)
green_bottle.images <<  Image.new(url: "product/paper/green_bottle_with_rope_2.jpg", primary: false)
green_bottle.save!
