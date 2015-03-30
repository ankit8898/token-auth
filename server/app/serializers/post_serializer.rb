# == Schema Information
#
# Table name: courses
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PostSerializer < ActiveModel::Serializer
  attributes :id,:title,:body,:likes_count

  has_many  :comments

  def likes_count
    object.likes.count
  end
end
