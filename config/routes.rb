# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'

  use_doorkeeper do
    controllers applications: 'oauth_applications'
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  namespace :api do
    namespace :v1 do
      get '/me' => 'credentials#me'
    end
  end
end
