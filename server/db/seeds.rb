# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


[User,Product,Course].each do |klass|
  klass.delete_all
end

['a','b'].each do |user|
  usr = Student.create!(email: "#{user}@a.com",
                        password: 'P@ssw0rd',
                        uid: "#{user}@a.com",
                        provider: 'email',
                        confirmed_at: Time.now)
  ap "Created Student: #{user}"
end


['c','d'].each do |user|
  usr = Professor.create!(email: "#{user}@a.com",
                          password: 'P@ssw0rd',
                          uid: "#{user}@a.com",
                          provider: 'email',
                          confirmed_at: Time.now)
  ap "Created Professor: #{user}"
end

5.times do |i|
  p = Product.create(name: "Product #{i}")
  ap "Created product: #{p.name}"
end

5.times do |i|
  p = Course.create(name: "Course #{i}")
  ap "Created Course: #{p.name}"
end