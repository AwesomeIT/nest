# frozen_string_literal: true
class SamplesController < ApplicationController
  def rate
    @sample = { name: 'sample1' }
  end

  def create; end
end
