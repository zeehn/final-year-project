Rails.application.routes.draw do
  root 'pages#home'
  get 'choose', to: 'pages#account_type'
  resources :admins
  resources :maids do
    member do 
      get :dashboard
      get :block
      get :approve
    
    resources :complaints, only: [:new, :create]
    end
    
    resources :reviews
  end  
  get "complaints", to: "complaints#index", as: "all_complaints"

  resources :clients
    
  resources :orders do 
    member do
      post :accept
      post :withdraw
      post :complete
    end
  end
  resource :session, only: [:new, :create, :destroy]  
# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
