# frozen_string_literal: true
class ScoresController < ApplicationController

	def create
		response = Rest::Score.create(
			session[:user_credentials],
			{
				"score" => params[:score].to_f,
				"experiment_id" => params[:experiment_id].to_i,
				"sample_id" => params[:sample_id].to_i
			}
		)
	end

end