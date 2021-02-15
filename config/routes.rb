Rails.application.routes.draw do
    root to: 'waterscapes#index'
    resources :waterscapes
end
