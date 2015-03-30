# == Schema Information
#
# Table name: likes
#
#  id            :integer          not null, primary key
#  likeable_id   :integer
#  likeable_type :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe Like, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
