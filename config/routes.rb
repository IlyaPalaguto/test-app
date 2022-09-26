Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'static_pages#author'

  resources :tests do
    resources :questions, shallow: true
  end
  
  get '/author', to: 'static_pages#author'
  get '/about', to: 'static_pages#about'
end
