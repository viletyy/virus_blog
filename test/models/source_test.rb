# == Schema Information
#
# Table name: sources
#
#  id          :bigint(8)        not null, primary key
#  name        :string(255)
#  address_url :string(255)
#  news_count  :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class SourceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
