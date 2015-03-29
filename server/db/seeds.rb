# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.delete_all

['ankit','dan'].each do |user|
  usr = User.create!(email: "#{user}@abc.com",
                     password: 'P@ssw0rd',
                     uid: "#{user}@abc.com",
                     provider: 'email',
                     confirmed_at: Time.now)
  ap "Created: #{user}"
end
