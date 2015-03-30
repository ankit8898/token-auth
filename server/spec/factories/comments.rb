# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  body       :text(65535)
#

FactoryGirl.define do
  factory :comment do
    body {Faker::Lorem.sentence}
    author {FactoryGirl.create(:author)}
  end

end
