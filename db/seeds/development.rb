# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts 'Seeding development database...'
sinhyun = User.first_or_create!(email: 'sinhyun@sinhyun.com',
                             password: 'password',
                             password_confirmation: 'password',
                             first_name: 'sinhyun',
                             last_name: 'Kim',
                             role: User.roles[:admin])

gabhyun = User.first_or_create!(email: 'gabhyun@gabhyun.com',
                             password: 'password',
                             password_confirmation: 'password',
                             first_name: 'gabhyun',
                             last_name: 'Kim')
Address.first_or_create!(street: '123 Main St',
                         city: 'Anytown',
                         state: 'CA',
                         zip: '12345',
                         country: 'USA',
                         user: sinhyun)
Address.first_or_create(street: '123 Main St',
                        city: 'Anytown',
                        state: 'CA',
                        zip: '12345',
                        country: 'USA',
                        user: gabhyun)

cate1 = Category.first_or_create!(name: 'Uncategorized', display_in_nav: true)
Category.first_or_create!(name: 'Cars', display_in_nav: false)
Category.first_or_create!(name: 'Bikes', display_in_nav: true)
Category.first_or_create!(name: 'Boats', display_in_nav: true)


elapsed = Benchmark.measure do
  posts = []
  10.times do |x|
    puts "Creating post #{x}"
    post = Post.new(title: "Title #{x}",
                    body: "Body #{x} Words go here Idk",
                    user: sinhyun,
                    category_id: cate1.id)

    5.times do |y|
      puts "Creating comment #{y} for post #{x}"
      post.comments.build(body: "Comment #{y}",
                          user: gabhyun)
    end
    posts.push(post)
  end
  Post.import(posts, recursive: true)
end

puts "Seeded development DB in #{elapsed.real} seconds"