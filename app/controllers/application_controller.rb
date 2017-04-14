class ApplicationController < ActionController::API
  before_action :check_params

  def check_params
    params.permit!
  end
end
