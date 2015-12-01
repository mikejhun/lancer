Rails.application.routes.draw do  
  
  devise_for :users
  resources :gigs
  root 'gigs#index'
end
