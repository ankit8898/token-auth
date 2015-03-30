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

class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :author
  has_many :likes, as: :likeable

  validates :body, presence: true
end
