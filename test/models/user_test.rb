# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  provider      :string(255)
#  uid           :string(255)
#  name          :string(255)
#  email         :string(255)
#  nick_name     :string(255)
#  oauth_token   :string(255)
#  refresh_token :string(255)
#  instance_url  :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
