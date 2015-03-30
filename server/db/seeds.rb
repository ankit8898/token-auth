# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


[User,Product,Course,Author,Post,Like].each do |klass|
  klass.delete_all
end


ap "*** Creating Authors ***"
[{id: 'ankit',name: 'Ankit Gupta'},{id: 'dan',name: 'Dan Widing'}].each do |hsh|
  usr = Author.create!(email: "#{hsh[:id]}@a.com",
                       password: 'P@ssw0rd',
                       uid: "#{hsh[:id]}@a.com",
                       name: hsh[:name],
                       provider: 'email',
                       confirmed_at: Time.now)
  ap "Created Student: #{usr.name}"
end


ap "*** Creating Post ***"

10.times do |i|
  author = Author.first
  post = Post.create!(title: Faker::Company.catch_phrase,body: Faker::Lorem.paragraph)
  post.author = author
  post.comments << [Comment.new(body: Faker::Lorem.sentence,author_id: author.id),Comment.new(body: Faker::Lorem.sentence,author_id: Author.last.id) ]
  post.likes << [Like.new(author_id: author.id),Like.new(author_id: Author.last.id)]
  post.save!
  ap "Created post: #{post.body} with #{post.comments.count} comments and #{post.likes.count} likes"
end

ap "*** Creating Student ***"
['a','b'].each do |user|
  usr = Student.create!(email: "#{user}@a.com",
                        password: 'P@ssw0rd',
                        uid: "#{user}@a.com",
                        name: Faker::Name.name,
                        provider: 'email',
                        confirmed_at: Time.now)
  ap "Created Student: #{usr.name}"
end

ap "*** Creating Professor ***"
['c','d'].each do |user|
  usr = Professor.create!(email: "#{user}@a.com",
                          password: 'P@ssw0rd',
                          uid: "#{user}@a.com",
                          name: Faker::Name.name,
                          provider: 'email',
                          confirmed_at: Time.now)
  ap "Created Professor: #{usr.name}"
end


ap "*** Creating Products ***"
5.times do |i|
  p = Product.create(name: "Product #{i}")
  ap "Created product: #{p.name}"
end

ap "*** Creating Courses ***"
5.times do |i|
  p = Course.create(name: "Course #{i}")
  ap "Created Course: #{p.name}"
end
