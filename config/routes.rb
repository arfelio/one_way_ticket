Rails.application.routes.draw do
  resources :tickets do
    get :accepted, on: :collection
  end
end
