Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'products#index'

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create] do 
    delete :destroy, on: :collection
  end
  
  resources :products
  resources :line_items
  resources :carts do
    resources :payments
  end
end
