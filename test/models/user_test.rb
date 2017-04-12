# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  phone_number :string
#  pin          :string
#  verified     :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  uuid         :string
#  expires_at   :datetime
#  f_name       :string
#  l_name       :string
#  email        :
#  distance     :float            default("20.0")
#  notification :boolean          default("t")
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
