Rails.application.routes.draw do
  # resources :stories, only: [:index]
  resources :stories, only: [:index] do
    get 'page/:page', action: :index, on: :collection
  end
  root "stories#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
