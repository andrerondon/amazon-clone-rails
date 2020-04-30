# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Review.destroy_all
Product.destroy_all
User.destroy_all


PASSWORD = 'supersecret'

super_user = User.create(
    first_name: 'jon',
    last_name: 'snow',
    email: 'js@winterfell.gov',
    password: PASSWORD
)

10.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    User.create(
        first_name: first_name,
        last_name: last_name,
        email: Faker::Internet.email,
        password: PASSWORD
    )
end

users = User.all # array of user records

1000.times do 
    p = Product.create({
        title: Faker::Hacker.noun,
        description: Faker::Hacker.say_something_smart,
        price: Faker::Commerce.price, 
        user_id: users.sample.id
    })
    # byebug
    if p.valid? 
        rand(0..10).times.each do
            Review.create(
                rating: Faker::Number.between(from:1, to:5),
                body: Faker::Hipster.paragraph,
                product: p,
                user_id: users.sample.id
            )
        end
    end
end

products = Product.all
reviews = Review.all
puts Cowsay.say("Generated #{products.count} products", :frogs)
puts Cowsay.say("Generated #{reviews.count} reviews", :tux)
# puts Cowsay.say("Generated #{users.count} users", :sheep)



# class Change < ActiveRecord::Migration[6.0]

#   def up 
#     change_column :products, :price, :float
#   end

#   def down 
#     change_column :products, :price, :float
#   end
# end