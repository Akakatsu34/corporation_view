Rails.application.routes.draw do
  root to: 'corporations#index'
  resources :corporations, only: [:index, :show]
end