# frozen_string_literal: true

Rails.application.routes.draw do
  resources :people do
    resources :person_car_ownerships_history, only: :index
  end

  resources :cars do
    resources :car_ownerships_history, only: :index
    resource :sell, only: [:show, :create]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
