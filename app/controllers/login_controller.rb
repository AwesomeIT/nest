# frozen_string_literal: true
require 'json'

class LoginController < ApplicationController
  skip_before_action :require_login, only: [:authorize, :index, :create] 

  def index; end

  def create; end

  def authorize
    response = Rest::User.authenticate(
      'email' => params[:user], 'password' => params[:password]
    )

    case response.code
      when 200
        response = JSON.parse(response)
        cookies[:token] = response['token']
        redirect_to '/home'
      when 401
        redirect_to '/login', flash: { alert: 'Invalid Credentials' }
      else
        redirect_to '/login', flash: { alert: 'API Error. Please try again later.'}
     end
  end
end
