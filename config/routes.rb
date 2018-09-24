Rails.application.routes.draw do
  resources :callback_requests, only: [:new, :create]
  
  get 'callback_requests', to: 'callback_requests#new'
  
  root to: 'callback_requests#new'
end
