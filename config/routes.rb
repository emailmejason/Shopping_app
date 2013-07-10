AmazonApp::Application.routes.draw do

  resources :sessions, :only => [:new, :create]

  match "signup" => "users#new", :as => "signup"
  match "logout" => "sessions#destroy", :as => "logout"
  match "login" => "sessions#new", :as => "login"

  resources :users, :only => [:new, :create, :show]

  post 'user/add_to_shopping_cart' => 'users#add_to_shopping_cart', :as => 'user_shopping_cart'

  resources :items

  post 'reviews/new/:item_id' =>  'reviews#create', :as => 'new_review'
  resources :reviews





  root :to => "items#index"
end
