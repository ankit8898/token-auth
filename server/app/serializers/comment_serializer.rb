# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  post_id    :integer
#  author_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  body       :text(65535)
#

class CommentSerializer < ActiveModel::Serializer
  attributes :id,:body,:post_id,:likes_count

  def likes_count
    object.likes.count
  end
  has_one :author
end
