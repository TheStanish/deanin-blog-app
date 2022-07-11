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
                             password:'password',
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
elapsed = Benchmark.measure do
  posts = []
  10.times do |x|
    puts "Creating post #{x}"
    post = Post.new(title: "Title #{x}",
                    body: "Body #{x} we got some words over here",
                    user: bibi)
  5.times do |y|
    puts "Creating comment #{y} for post #{x}"
    post.comments.build(body: "Comment #{y}",
                        user: tyler)
    end
    posts.push(post)
  end
  Post.import(posts, recursive: true)
end
puts "Seeded development DB in #{elapsed.real} seconds"
