require 'bcrypt'

module Users
  class UserLogin
    include Interactor

    def call
      raise 'email não pode ser vazio!' if context.email.blank?
      raise 'senha não pode ser vazia!' if context.password.blank?

      user = User.where(email: context.email).limit(1)[0]
      raise 'usuário não encontrado!' if user.blank?

      authenticate = user.try(:authenticate, context.password)
      raise 'senha incorreta!' if authenticate == false

      generate_user_api_token(user)
      
    rescue => e
      context.fail!(error: e.message)
    end

    private

    def generate_user_api_token(user)
      expiration_time = Time.now.to_i + (3600 * 3)

      payload = { 
        user_id: user.id,
        expiration_time: expiration_time 
      }

      token = JWT.encode(payload, ENV['APP_SECRET_KEY'], 'HS256')

      user.update_columns(
        api_token: token,
        expire_api_token_at: Time.at(expiration_time).to_s
      )

      context.user = user
    end
  end
end