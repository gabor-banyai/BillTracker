Rails.application.routes.draw do
  devise_for :users

  root 'bills#index'

  resources :bills do
    post :approve, on: :collection, as: :approve
  end
end
