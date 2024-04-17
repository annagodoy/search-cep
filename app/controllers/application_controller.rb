class ApplicationController < ActionController::API
  def authenticate_user!
    head :unauthorized unless validate_user_token?
  end

end
