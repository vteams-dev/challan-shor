module Api
  module V1
    class UsersController < ApplicationController

      api :POST, '/v1/users', 'Register User'
      param :phone_number, String, desc: 'User phone number to register with', required: true

      def create
        if params[:phone_number].present?
          phone_number = params[:phone_number].sub(/^./, '+92')
          @user = User.find_or_create_by(phone_number: phone_number)
          @user.generate_pin
          @user.send_pin
        end
      end

      api :POST, '/v1/users/verify', 'Verify user through pin code'
      param :uuid, String, desc: 'User uuid sent in response to success registration', required: true
      param :pin, String, desc: 'User pin sent to user mobile while registration', required: true

      def verify
        @user = User.find_by(uuid: params[:uuid])
        # @user.notification = if (params[:notification].present? ? params[:notification] : true)
        if @user
          @user.verify(params[:pin])
          if @user.device.nil?
            Device.create(:device_token => params[:device_token], :device_type => params[:device_type], :user_id => @user.id)
          elsif (params[:device_token].present? and params[:device_type].present?)
            @user.device.update(:device_token => params[:device_token], :device_type => params[:device_type])
          end
        end
      end

      api :POST, '/v1/users/update', 'Update user settings'
      param :f_name, String, desc: 'User first name'
      param :l_name, String, desc: 'User last name'
      param :email, String, desc: 'User email'
      param :notification, :bool, desc: 'User will either receive notification or not (Boolean Value)'
      param :user_id, Integer, desc: 'User id whose settings are going to change', required: true
      param :distance, Float, desc: 'Distance in miles, how far specific user will receive notification of challan point. By default set to 20 when user register'

      def update_user
        @user = User.find(params[:user_id])
        if @user.update(user_params)
          @update = true
        else
          @update = false
        end
      end

      private
      def user_params
        params.permit(:f_name, :l_name, :email, :distance, :notification)
      end
      def device_params
        params.permit(:device_token, :device_type, :user_id)
      end
    end
  end
end
