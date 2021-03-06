# frozen_string_literal: true

# == Route Map
#

Rails.application.routes.draw do
  match '/404', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
  resources :surveys do
    post '/', to: 'surveys#feedback'
  end
end
