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

class User < ApplicationRecord
  require 'securerandom'

  has_many :mark_dangers
  has_many :user_locations
  has_one :device

  def generate_pin
    self.pin = rand(0000..9999).to_s.rjust(4, "0")
    self.uuid ||= SecureRandom.uuid
    self.verified = nil
    self.expires_at = (Time.zone.now + 30.minute)
    self.save
  end
  def twilio_client
    Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
  end
  def send_pin
    twilio_client.messages.create(
      to: phone_number,
      from: ENV['TWILIO_PHONE_NUMBER'],
      body: "Your PIN is #{pin}"
    )
  end
  def verify(entered_pin)
    self.verified = nil
    self.save
    if (self.pin == entered_pin) and !self.expired?
      update(verified: true)
    end
  end
  def allow_notifications?
    self.notification
  end
  def expired?
    Time.zone.now > self.expires_at
  end
end
