# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(email: 'tyler@example.com', 
    password:'password', 
    password_confirmation: 'password',
    name: 'Tyler',
    role: User.roles[:admin])

User.create(email: 'bibi@example.com', 
    password:'password', 
    password_confirmation: 'password',
    name: 'Bibi')    


10.times do |x|
    post = Post.create(title: "Title #{x}",
                       body: "Body #{x} we got some words over here",
                       user_id: User.second.id)

5.times do |y|
    Comment.create(body: "Comment #{y}",
                   user_id: User.first.id,
                   post_id: post.id)
    end
end