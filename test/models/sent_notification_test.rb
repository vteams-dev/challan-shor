# == Schema Information
#
# Table name: sent_notifications
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  marker_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class SentNotificationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
