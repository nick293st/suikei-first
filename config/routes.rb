Rails.application.routes.draw do
    root to: 'waterscapes#index'
    resources :waterscapes
    
    get 'signup' , to: 'users#new'
    resources :users
end
