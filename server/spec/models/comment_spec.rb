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

require 'rails_helper'

RSpec.describe Comment, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
