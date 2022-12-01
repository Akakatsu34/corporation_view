Rails.application.routes.draw do
  root to: 'corporations#index'
  resources :corporations, only: [:index, :show] do
    collection do
      get 'search'
    end
  end
end