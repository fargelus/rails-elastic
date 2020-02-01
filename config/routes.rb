# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'
  resources :users, only: %i[new create]
  resources :orders, only: %i[new create]

  get '/search' => 'home#search'
  get '/search-user' => 'users#search'
end
