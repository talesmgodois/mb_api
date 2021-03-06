class V1::AuthController < ApplicationController

  api :POST, '/v1/auth'
  JWT_SECRET = 'AIOOOOO Silver'
  param :email, String, desc: 'User Email'
  param :password, String, desc: 'User Password'
  def authenticate_user

    begin
      user = User.find_for_database_authentication(email: params[:email])
      if user.valid_password?(params[:password])
        render json: payload(user)
      else
        render json: {errors: ['Invalid Username/Password']}, status: :unauthorized
      end
    rescue => exception
      render json: exception, status: :unprocessable_entity
    end

  end

  private
  def payload(user)
    return nil unless user and user.id
    {
      auth_token: JsonWebToken.encode({user_id: user.id, resources: [], name: user.name}),
      user: {id: user.id, email: user.email}
    }
  end
end
