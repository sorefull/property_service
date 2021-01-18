# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/', to: 'properties#index'

  namespace :api do
    resources :properties, only: :index
  end
end
