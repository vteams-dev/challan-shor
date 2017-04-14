module Api
  module V1
    class UserLocationsController < ApplicationController

      api :POST, '/user_locations', 'Update user location'
      param :latitude, Float, desc: 'User current location latitude', required: true
      param :longitude, Float, desc: 'User current location longitude', required: true
      param :user_id, Integer, desc: 'User id, whose current location is marked', required: true

      def create
        @location = UserLocation.new(latitude: params[:latitude], longitude: params[:longitude], user_id: params[:user_id])
        if @location.save
          if @location.user.distance.nil?
            distance = 20
          else
            distance = @location.user.distance
          end
          @markups = MarkDanger.near([@location.latitude,@location.longitude],distance)
          unless @markups.empty?
            marker = @markups.first
            distance = marker.distance.round(3)
            mark_type = MarkDanger::MARK_TYPE[marker.mark_type]
            device_token = @location.user.device.device_token
            registration_ids = []
            registration_ids << device_token
            if (distance < 0.009)
              alert = "You are on #{mark_type} place."
            else
              alert = "There is #{mark_type} about #{distance} miles away."
            end
            if @location.user.allow_notifications?
              if @location.user.device.device_type.eql?("android")
                fcm = FCM.new(ENV['FCM_API_KEY'])
                options={:notification => {:body => {:data=>"#{alert}"},:title => "#{mark_type} alert"}}
                response = fcm.send(registration_ids, options)
              elsif @location.user.device.device_type.eql?("iOS")
                APNS.send_notification(device_token, :alert => "#{alert}", :badge => 1, :sound => 'default')
              end
            end
          end
        end
      end
    end
  end
end