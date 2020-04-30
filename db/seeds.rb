# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Review.delete_all
Product.delete_all

NUM_PRODUCT = 1000

NUM_PRODUCT.times do
  created_at = Faker::Date.backward(days: 365 * 5)
  product = Product.create(
    title: Faker::Commerce.product_name,
    description: Faker::Commerce.department,
    price: Faker::Commerce.price,
    created_at: created_at,
    updated_at: created_at
  )
  if product.valid?
      product.reviews = rand(0..15).times.map do
      Review.new(body: [Faker::Hacker.say_something_smart, ""][rand(0..1)], rating: rand(1..5))
    end
  end
end

product = Product
review = Review

puts Cowsay.say("Generated #{product.count} products", :frogs)
puts Cowsay.say("Generated #{review.count} review", :frogs)
