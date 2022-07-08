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




elapsed = Benchmark.measure do
  posts = []
  tyler = User.first
  bibi = User.second
  1000.times do |x|
    puts "Creating post #{x}"
    post = Post.new(title: "Title #{x}",
                       body: "Body #{x} we got some words over here",
                       user: bibi)

    
10.times do |y|
    puts "Creating comment #{y} for post #{x}"
    post.comments.build(body: "Comment #{y}",
                                user: tyler)
    
    end
    posts.push(post)
  end
  Post.import(posts, recursive: true)
end 




puts "Ellapsed time is #{elapsed.real} seconds"
