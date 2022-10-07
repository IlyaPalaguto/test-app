Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'tests#index'

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'

  resources :users, only: %i[create]
  resource :session, only: %i[create destroy]
  
  resources :tests do
    resources :questions, except: [:index], shallow: true do
      resources :answers, except: [:index], shallow: true
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
      
end
