
# frozen_string_literal: true
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
	before_action :require_login

	private

	def require_login
		unless cookies[:token]
			redirect_to '/login', flash: { alert: 'Please log in.' }
		end
	end
end
