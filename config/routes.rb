Rails.application.routes.draw do  
  
  devise_for :users
  resources :gigs do
  	resource :proposals, except: :index
  	collection do
  		get :search
  	end
  end
  root 'gigs#index'
end
