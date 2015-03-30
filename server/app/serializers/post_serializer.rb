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

class PostSerializer < ActiveModel::Serializer
  attributes :id,:title,:body,:likes_count,:comments_count

  has_many  :comments
  has_many  :likes
  has_one  :author

  def likes_count
    object.likes.count
  end

  def comments_count
    object.comments.count
  end
end
