Rails.application.routes.draw do
  
  root 'leagues#index'
 
  resources :leagues do
    resources :fixtures
    resources :results, only: [:index, :edit]
    resources :logs, only: [:index]
    resources :tournaments, only: [:index]
    resources :teams do
      resources :managers 
      resources :players
    end
  end
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
