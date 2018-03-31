Rails.application.routes.draw do
  resources :stories, only: [:index]
  root "stories#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
