# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
AdminUser.create!(email: 'admin1@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

User.create!(email: '3@3.com',
             password: 'password',
             password_confirmation: 'password')


User.create!(email: '4@4.com',
             password: 'password',
             password_confirmation: 'password')

posts = []
comments = []

10.times do |x|
  post = Post.new(title: "title#{x}", body: "content#{x}", user: User.first)
  posts.push post
  5.times do |y|
    post.comments.new(body: "comment#{y}", user: User.last)
    comments.push comment
  end
end

# activerecord-import gem 활용법
Post.import posts
Comment.import comments