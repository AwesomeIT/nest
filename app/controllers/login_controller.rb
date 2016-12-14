# frozen_string_literal: true
# 
class LoginController < ApplicationController
  skip_before_action :require_login, only: [:authorize, :index, :create] 

  def index; end

  def create; end

  def authorize
    sessionize(:user_credentials, Rest::User.authenticate(
      'email' => params[:email], 'password' => params[:password]
    ))

    sessionize(:user, Rest::User.by_credentials(session[:user_credentials]))
    redirect_to '/experiments'
  end

  def logout
    reset_session
    redirect_to '/login'
  end

  private 

  def sessionize(key, request)
    case request.code
    when 200
      session[key] = JSON.parse(request)
    when 401
      session.delete(key)
      redirect_to '/login', flash: { error: 'Invalid Credentials' }
    else
      redirect_to '/login', flash: { error: 'API Error. Please try again later.'}
    end
  end
end
