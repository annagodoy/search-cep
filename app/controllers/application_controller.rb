class ApplicationController < ActionController::API
  include CurrentUserConcern
  
  def authenticate_user!
    head :unauthorized unless validate_user_token?
  end

  def validate_user_token?
    head :unauthorized if params[:token].blank?

    @user = User.find_by(api_token: params[:token])
    
    if @user
      @user&.expire_api_token_at < Time.now 
    end
  end
end
