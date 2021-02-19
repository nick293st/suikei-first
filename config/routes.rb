Rails.application.routes.draw do
    root to: 'waterscapes#index'
    resources :waterscapes
    
    get 'signup' , to: 'users#new'
    resources :users
    
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
end
