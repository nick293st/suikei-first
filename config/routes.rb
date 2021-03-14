Rails.application.routes.draw do
    root to: 'waterscapes#index'
    resources :waterscapes
    
    get 'signup' , to: 'users#new'
    resources :users do
        member do
            get :liker
            get :liked
        end
        collection do
            get :search
        end
    end
    
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
    
    resources :likes, only: [:create, :destroy]
end
