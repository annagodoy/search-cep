module Api
  module V1
    class SessionsController < ApplicationController
      include CurrentUserConcern

      def create
        response = Users::UserLogin.call(session_params)

        if response.user
          session[:user_id] = response.user.id 
          render json: { status: :logged, logged_in: true, token:  response.user.api_token}
        else
          render json: { message: response.error, status: 401 }
        end
      end

      def logged_in
        if @current_user
          render json: { logged_in: true, user: @current_user.email }
        else
          render json: { logged_in: false }
        end
      end

      def logout
        reset_session
        
        render json: { status: 200,  logged_out: true }
      end

      private

      def session_params
        params.permit(:email, :password)
      end
    end
  end
end