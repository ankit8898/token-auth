# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  provider               :string(255)      not null
#  uid                    :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  name                   :string(255)
#  nickname               :string(255)
#  image                  :string(255)
#  email                  :string(255)
#  tokens                 :text(65535)
#  type                   :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#

FactoryGirl.define do
  factory :user do
    uid {Faker::Internet.email}
    email {uid}
    name {Faker::Name.name}
    provider {"email"}
    password {"P@ssw0rd"}
    password_confirmation {"P@ssw0rd"}
    confirmed_at {Time.now}
  end

  factory :student, parent: :user, class: 'Student' do

  end

  factory :professor, parent: :user, class: 'Professor' do

  end

  factory :author, parent: :user, class: 'Author' do

  end

end
