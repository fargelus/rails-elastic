# frozen_string_literal: true

Rails.application.routes.draw do
  get 'orders/search'
  root to: 'home#index'
  resources :users, only: %i[new create]
  resources :orders, only: %i[new create]

  get '/search-user' => 'users#search'
  get 'order/search' => 'order#search'
end
