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

class CommentSerializer < ActiveModel::Serializer
  attributes :id,:body
end
