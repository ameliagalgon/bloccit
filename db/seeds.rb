# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'random_data'

50.times do
=begin
    Post.create!(
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph
    )

    Advertisement.create!(
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph,
        price: rand(50)
   )
=end

    Question.create!(
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph,
        resolved: [true, false].sample
    )
end
post = Post.all
=begin
100.times do
    Comment.create!(
        post: post.sample,
        body: RandomData.random_paragraph
    )
end
=end
puts "Seed finished"
puts "#{Post.count} post created"
puts "#{Comment.count} comments created"

puts "#{Advertisement.count} ads created"
puts "#{Question.count} questions created"
