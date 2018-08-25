Rails.application.routes.draw do
  devise_for :users
  require 'sidekiq/web'

  mount Sidekiq::Web => '/admin/sidekiq'

  root to: "tickets#new"

  resources :tickets, only: [:create, :new] do
    get :accepted, on: :collection
  end

  namespace :admin do
    resources :tickets, only: [:index, :show]
    resources :replies, only: :create
  end
end
