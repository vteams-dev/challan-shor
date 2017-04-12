class MarkDangersController < ApplicationController
  def create
    # phone_number = params[:phone_number].sub(/^./, '+92')
    # user = User.find_by_user_id(params[:user_id])
    # @mark_danger = MarkDanger.new(latitude: params[:latitude], longitude: params[:longitude], user_id: user.try(:id), mark_type: params[:mark_type])
    @mark_danger = MarkDanger.new(latitude: params[:latitude], longitude: params[:longitude], user_id: params[:user_id], mark_type: params[:mark_type])
  end
end
