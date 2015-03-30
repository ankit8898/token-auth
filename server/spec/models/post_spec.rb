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

require 'rails_helper'

RSpec.describe Post, :type => :model do
  it { should have_many(:comments)}
  it { should have_many(:likes)}
  it { should belong_to(:author)}
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:title) }
end
