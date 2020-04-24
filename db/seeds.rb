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
    q = Product.create(
        title: Faker::Device.model_name,
        description: Faker::Commerce.department,
        price: Faker::Number.decimal(l_digits: 2)
    )
    if q.valid?
        q.reviews = rand(0..15).times.map do 
            Review.new(
                body: Faker::GreekPhilosophers.quote)
                rating: Faker::Number.decimal(l_digits: 1)
            )
        end
    end
end

review = Review.all
product = Product.all 

puts Cowsay.say("Generated #{product.count} products", :frogs)
puts Cowsay.say("Generated #{review.count} reviews", :tux)