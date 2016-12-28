# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create(name: "Honda")
Category.create(name: "Zuzuki")
Category.create(name: "Yamaha")
Category.create(name: "BMW")
Category.create(name: "Piaggio")

(1..5).each do |i|
  Product.create(name: "Product ##{i}", description: "A product.", price: "
    10000000", image: "bikes#{i}" , category_id: "#{i}")
end

User.create(name: "Bin",email:"admin@gmail.com",
  password_digest: "$2a$10$TvDXz9ZEbKX9rwlrSkrNMOAw6GQCX550XmvJjZWHxV5IXPEjQbCae",
  is_admin: "true")

(1..20).each do |i|
  User.create(name: "User #{i}", email:"#{i}@gmail.com",
   password_digest: "$2a$10$TvDXz9ZEbKX9rwlrSkrNMOAw6GQCX550XmvJjZWHxV5IXPEjQbCae",
   is_admin: "false")
end

(1..20).each do |i|
  Cart.create(status: "false", totalprice:
    "#{i}0000000", user_id: "#{i}")
end

(1..11).each do |i|
  (1..20).each do |j|
  Cartdetail.create(quantity: "#{i}", cart_id: "#{j}", product_id: "1")
  end
end
