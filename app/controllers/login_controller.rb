# frozen_string_literal: true
class LoginController < ApplicationController
  def index; end

  def create; end

  def authorize
    response = Rest::User.authenticate(
      'email' => params[:user], 'password' => params[:password]
    )
    binding.pry
    message = case response.code
              when 200
                'Logged In'
              when 401
                'Invalid Credentials'
              else
                'API Error. Please try again later.'
     end

    redirect_to '/login', flash: { alert: message }
  end
end
