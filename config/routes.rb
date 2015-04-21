Rails.application.routes.draw do

	root 'products#index'

 	resources :products

 	resources :users, only: [:new, :create]

 	resources :sessions, only: [:new, :create, :destroy]

 	resources :products do
 		resources :reviews, only: [:show, :create, :destroy]
 	end
end
