# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  body       :text(65535)
#  author_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :post do
    title {Faker::Name.title}
    body {Faker::Lorem.sentence}
    #author {FactoryGirl.create(:author)}
    author do
      uid = Faker::Internet.email
      Author.create!()
    end
  end

end
