# frozen_string_literal: true
# 
class LoginController < ApplicationController
  skip_before_action :require_login, only: [:authorize, :index, :create] 

  def index; end

  def create; end

  def authorize
    creds = sessionize(:user_credentials, ::Rest::User.authenticate(
      'email' => params[:email], 'password' => params[:password]
    ))
    return redirect_to '/login', flash: creds if creds.is_a?(Hash)

    user = sessionize(:user, ::Rest::User.by_credentials(session[:user_credentials]))
    return redirect_to '/login', flash: user if user.is_a?(Hash)
    
    redirect_to '/experiments'
  end

  def logout
    reset_session
    redirect_to '/login'
  end

  private 

  def sessionize(key, request)
    case request.try(:code)
    when 200
      session[key] = JSON.parse(request)
    when 401
      session.delete(key)
      { error: 'Invalid Credentials' }
    else
      { error: 'API Error. Please try again later.'}
    end
  end
end
