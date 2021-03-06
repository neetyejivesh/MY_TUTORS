Rails.application.routes.draw do
  devise_for :users

 root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/search' => 'pages#search', :as => 'search_page'
  resources :courses do 
  resources :bookings, only: [:create, :show, :destroy]
  end
  resources :bookings, only: :index 
end
