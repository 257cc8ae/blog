# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
35.times do |n|
  Post.create!(
    title: "Title#{n + 1}",
    name: "google#{n + 1}",
    thumbnail: "https://github.blog/wp-content/uploads/2020/09/92024165-6b966480-ed7b-11ea-8dc3-78c46942d218.png?w=1200",
    content: "this post is #{n + 1}",
    tags: "#tags #content"
  )
end
