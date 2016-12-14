# frozen_string_literal: true
Rails.application.routes.draw do
  get 'experiments', to: 'experiments#view'
  post 'experiments', to: 'experiments#create'
  get 'experiments/:id', to: 'experiments#update'
  post 'experiments/samples/:id', to: 'experiments#samples'

  get 'samples/create'
  post 'samples/create', to: 'samples#create_post'

  get 'login', to: 'login#index'
  post 'login', to: 'login#authorize'

  get 'home', to: 'home#index'

  post 'score', to: 'scores#create'
end
