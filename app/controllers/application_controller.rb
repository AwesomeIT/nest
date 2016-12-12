
# frozen_string_literal: true
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
	before_action :require_login

	private

	def require_login
		unless session[:user_credentials]
			redirect_to '/login', flash: { error: 'Please log in.' }
		end
	end
end
