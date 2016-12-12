# frozen_string_literal: true
class SamplesController < ApplicationController
  def rate
    @sample = { name: 'sample1' }
  end

  def create; end

  def create_post
  	response = Rest::Sample.create(
  		session[:user_credentials],
  		{
  			'fileName' => params[:sample][:file].original_filename,
  			'sampleName' => params[:sample][:name]
			}, 
			params[:sample][:file].read
  	)
    
  	case response.code
  	when 201
  		redirect_to '/experiments/view'
  	else
  		redirect_to '/samples/create', flash: { error: 'An error occured. Please try again later.'}
  	end
  end
end
