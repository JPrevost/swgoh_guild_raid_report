Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'player#index'
  get 'player', to: 'player#index'
  get 'player/:player', to: 'player#show'
  get 'guild', to: 'guild#index'
end
