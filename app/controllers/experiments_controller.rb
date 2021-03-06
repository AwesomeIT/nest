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
  	@experiment = JSON.parse(Rest::Experiment.retrieve(params[:id], session[:user_credentials]))
  	@all_samples = JSON.parse(Rest::Sample.list(session[:user_credentials]))
    @samples = @experiment['samples'].map do |sample|
      JSON.parse(Rest::Sample.by_id(session[:user_credentials], sample['id']))
    end
  end

  def samples
  	Rest::Experiment.samples(
  		session[:user_credentials],
  		params[:id],
  		{"samples" => params[:sample_ids] ? params[:sample_ids].map(&:to_i) : []}
  	)
  end

  def delete
    Rest::Experiment.destroy(
      params[:id],
      session[:user_credentials]
    )
  end
end