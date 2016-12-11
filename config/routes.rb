# frozen_string_literal: true
Rails.application.routes.draw do
  get 'experiments/index'
  get 'experiments/view'
  get 'samples/create'
  post 'samples/create', to: 'samples#create_post'

  get 'login', to: 'login#index'
  post 'login', to: 'login#authorize'

  get 'home', to: 'home#index'
end
