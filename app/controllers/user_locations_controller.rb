class UserLocationsController < ApplicationController
  def create
    # phone_number = params[:phone_number].sub(/^./, '+92')
    # user = User.find_by_user_id(params[:user_id])
    # @location = UserLocation.new(latitude: params[:latitude], longitude: params[:longitude], user_id: user.try(:id))
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
        if (distance == 0.0)
          alert = "You are on #{mark_type} place."
        else
          alert = "There is #{mark_type} about #{distance} miles away."
        end
        if @location.user.allow_notifications?
          if @location.user.device.device_type.eql?("android")
            fcm = FCM.new(ENV['FCM_API_KEY'])
            options={:notification => {:body => {:data=>"#{alert}"},:title => "#{mark_type} alert"}}
            response = fcm.send(registration_ids, options)
            # options = {:data => {:notification=>{:body=>"#{alert}",:title=>""}}}
            # response = fcm.send(device_token, options)
          elsif @location.user.device.device_type.eql?("iOS")
            APNS.send_notification(device_token, :alert => "#{alert}", :badge => 1, :sound => 'default')
          end
        end
      end
    end
  end
end