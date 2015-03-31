# == Schema Information
#
# Table name: likes
#
#  id            :integer          not null, primary key
#  likeable_id   :integer
#  likeable_type :string(255)
#  author_id     :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class LikeSerializer < ActiveModel::Serializer
  attributes :id,:likeable_type

  has_one :author
end
