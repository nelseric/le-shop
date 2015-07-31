# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do
  admin = Admin.first_or_create({
    email: "admin@lestore.local",
    password: "12345678",
    password_confirmation: "12345678"
  })

  # Products
  product_names = [
    "Small Rock",
    "Medium Rock",
    "Large Rock",
    "Small Boulder",
    "Medium Boulder",
    "Large Boulder",
    "Small Monolith",
    "Medium Monolith",
    "Large Monolith",
    "Playing Cards",
    "Tee-Shirt",
    "Tea Kettle",
    "Phone Charger",
    "Coffee Cup",
    "Gum",
    "Lighter",
    "Lampshade",
    "Amplifier",
    "Guitar",
    "Dictionary",
    "Encyclopedia"
  ]
  (1..100).each {|n| product_names << "Random Product #{n}"}
  products = product_names.map {|p| Product.where(name: p, price_cents: 2000).first_or_create }

end