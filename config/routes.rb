# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'

  use_doorkeeper do
    controllers applications: 'oauth_applications'
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions', registrations: 'users/registrations'
  }

  namespace :api do
    get '/me' => 'credentials#me'
  end
end
