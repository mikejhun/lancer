Rails.application.routes.draw do  
  
  resources :gigs
  root 'gigs#index'
end
