Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'products#index'

  concern :commentable do
    resources :comments
  end

  resources :products do
    concerns :commentable
  end
  resources :orders do
    concerns :commentable
  end
end
