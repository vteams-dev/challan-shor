class UsersController < ApplicationController
  def create
    if params[:phone_number].present?
      phone_number = params[:phone_number].sub(/^./, '+92')
      @user = User.find_or_create_by(phone_number: phone_number)
      @user.generate_pin
      @user.send_pin
    end
  end
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
