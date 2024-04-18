module LoginHelpers
  def login(user)
    old_controller = @controller

    @controller = Api::V1::SessionsController.new
    
    post :create, params: { email: user.email, password: user.password }

    assert_equal session[:user], User.find_by(api_token: user.api_token)

    @controller = old_controller
  end
end