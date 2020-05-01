# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Review.delete_all
Product.delete_all
User.delete_all

NUM_PRODUCT = 99
PASSWORD = "1234"

super_user = User.create(
  first_name: "Selim",
  last_name: "Ozdogan",
  email: "selimozdogan@hotmail.com",
  password: PASSWORD,
)

NUM_PRODUCT.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: PASSWORD,
  )
end

users = User.all # array of user records

NUM_PRODUCT = 1000

NUM_PRODUCT.times do
  created_at = Faker::Date.backward(days: 365 * 5)
  product = Product.create(
    title: Faker::Commerce.product_name,
    description: Faker::Commerce.department,
    price: Faker::Commerce.price,
    user: users.sample,
    created_at: created_at,
    updated_at: created_at,
  )
  if product.valid?
    rand(0..15).times.map do
      review = Review.new(body: [Faker::Hacker.say_something_smart, ""][rand(0..1)], rating: rand(1..5), user: users.sample, product: product)
      review.save
    end
  end
end

product = Product
review = Review
user = User

puts Cowsay.say("Generated #{product.count} products", :frogs)
puts Cowsay.say("Generated #{review.count} review", :frogs)
puts Cowsay.say("Generated #{user.count} users", :frogs)
