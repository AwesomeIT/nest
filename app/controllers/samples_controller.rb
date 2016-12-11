# frozen_string_literal: true
class SamplesController < ApplicationController
  def rate
    @sample = { name: 'sample1' }
  end

  def create; end

  def create_post
  	response = Rest::Sample.create(
  		{
  			'fileName' => params[:sample][:file].original_filename,
  			'sampleName' => params[:sample][:name]
			}, 
			params[:sample][:file].read
  	)

  	
  end
end
