# frozen_string_literal: true
class ExperimentsController < ApplicationController

  def view
  	@experiments = Rest::Experiment.list(session[:user_credentials])
  end

  def create 
  	newExperiment = Rest::Experiment.create(
  		session[:user_credentials],
  		{
  			"name" => params[:experiment]['name'],
  			"userId" => session[:user_credentials]["userId"]
  		}
  	)
		case newExperiment.code
		when 201 
			redirect_to :back
		else
			flash.now[:error] = 'An error occured. Please try again later.'
  	end
  end

  def update

  end
end
