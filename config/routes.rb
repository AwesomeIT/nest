# frozen_string_literal: true
Rails.application.routes.draw do
  get 'experiments/index'
  get 'experiments/view'

  get 'samples/create'

  get 'login', to: 'login#index'
  post 'login', to: 'login#authorize'
end
