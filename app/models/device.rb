# == Schema Information
#
# Table name: devices
#
#  id           :integer          not null, primary key
#  device_token :string
#  device_type  :string
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Device < ApplicationRecord
  belongs_to :user
end
