# frozen_string_literal: true
# 
class LoginController < ApplicationController
  skip_before_action :require_login, only: [:authorize, :index, :create] 

  def index; end

  def create; end

  def authorize
    response = Rest::User.authenticate(
      'email' => params[:email], 'password' => params[:password]
    )

    case response.code
      when 200
        session[:user_credentials] = JSON.parse(response)
        redirect_to '/home'
      when 401
        session.delete(:user_credentials)
        redirect_to '/login', flash: { error: 'Invalid Credentials' }
      else
        redirect_to '/login', flash: { error: 'API Error. Please try again later.'}
     end
  end
end
