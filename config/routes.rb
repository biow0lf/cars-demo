# frozen_string_literal: true

Rails.application.routes.draw do
  resources :people

  resources :cars

  resources :car_history, only: :show

  resources :person_car_history, only: :show

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
