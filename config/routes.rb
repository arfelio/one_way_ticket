Rails.application.routes.draw do
  require 'sidekiq/web'

  mount Sidekiq::Web => '/admin/sidekiq'

  resources :tickets, only: [:create, :new] do
    get :accepted, on: :collection
  end
end
