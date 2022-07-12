# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts 'Seeding development database...'
tyler = User.first_or_create!(email: 'tyler@example.com',
                              password: 'password',
                              password_confirmation: 'password',
                              first_name: 'Tyler',
                              last_name: 'Stanish',
                              role: User.roles[:admin])
bibi = User.first_or_create!(email: 'bibi@example.com',
                             password: 'password',
                             password_confirmation: 'password',
                             first_name: 'Bibi',
                             last_name: 'Buzzsaw')
Address.first_or_create!(street: '123 Main St',
                         city: 'New York',
                         state: 'NY',
                         zip: 10001,
                         country: 'USA',
                         user: tyler)
Address.first_or_create!(street: '123 Main St',
                         city: 'New York',
                         state: 'NY',
                         zip: 10001,
                         country: 'USA',
                         user: bibi)
category = Category.first_or_create!(name: "Uncategorized", display_in_nav: true)
Category.first_or_create!(name: "Cars", display_in_nav: false)
Category.first_or_create!(name: "Bikes", display_in_nav: true)
Category.first_or_create!(name: "Boats", display_in_nav: true)

elapsed = Benchmark.measure do
  posts = []
  10.times do |x|
    puts "Creating post #{x}"
    post = Post.new(title: "Title #{x}",
                    body: "Body #{x} we got some words over here",
                    user: tyler,
                    category: category)
  5.times do |y|
    puts "Creating comment #{y} for post #{x}"
    post.comments.build(body: "Comment #{y}",
                        user: bibi)
    end
    posts.push(post)
  end
  Post.import(posts, recursive: true)
end
puts "Seeded development DB in #{elapsed.real} seconds"
