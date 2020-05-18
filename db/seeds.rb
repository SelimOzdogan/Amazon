# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Like.delete_all
Review.delete_all
Product.delete_all
User.delete_all

NUM_PRODUCT = 4
PASSWORD = "1234"

super_user = User.create(
  first_name: "Selim",
  last_name: "Ozdogan",
  email: "selimozdogan@hotmail.com",
  password: PASSWORD,
  isadmin: true,
)

NUM_PRODUCT.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: PASSWORD,
    isadmin: false,
  )
end

users = User.all # array of user records

NUM_PRODUCT = 10

NUM_PRODUCT.times do
  created_at = Faker::Date.backward(days: 365 * 5)
  product = Product.create(
    title: Faker::Commerce.product_name,
    description: Faker::Hacker.say_something_smart,
    price: Faker::Commerce.price,
    user: users.sample,
    created_at: created_at,
    updated_at: created_at,
  )
  if product.valid?
    rand(0..3).times.map do
      review = Review.new(
        body: [Faker::Hacker.say_something_smart, ""][rand(0..1)],
        rating: rand(1..5),
        user: users.sample,
        product: product,
        hidden: [true, false][rand(0..1)],
      )
      review.save
    end
  end
end
reviews = Review.all # array of user records

reviews.count.times.map do
  like = Like.new(
    review: reviews.sample,
    user: users.sample,
  )
  like.save
end

puts Cowsay.say("Generated #{Product.count} products", :frogs)
puts Cowsay.say("Generated #{Review.count} review", :frogs)
puts Cowsay.say("Generated #{User.count} users", :frogs)
puts Cowsay.say("Generated #{Like.count} likes", :frogs)
