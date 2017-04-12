# == Schema Information
#
# Table name: user_locations
#
#  id         :integer          not null, primary key
#  latitude   :float
#  longitude  :float
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserLocation < ApplicationRecord
  belongs_to :user
end
