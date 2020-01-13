Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
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
