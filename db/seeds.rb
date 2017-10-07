# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'random_data'

50.times do
    Post.create!(
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph
    )
end
post = Post.all

100.times do
    Comment.create!(
        post: post.sample,
        body: RandomData.random_paragraph
    )
end

puts "Seed finished"
puts "#{Post.count} post created"
puts "#{Comment.count} comments created"

my_post = Post.find_or_create_by!(
    title: "My Unique Post",
    body: "I hope you are having a good day!"
)
Comment.find_or_create_by!(
    post: my_post,
    body: "It's been okay. How are you?"
)
