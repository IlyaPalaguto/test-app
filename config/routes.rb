Rails.application.routes.draw do
  root 'tests#index'
  
  devise_for :users, controllers: { sessions: 'users/sessions' }, path_names: {sign_in: :login, sign_out: :logout, sign_up: :signup}
  
  resources :tests, only: :index do
    
    member do
      post :start
    end
  end
  
  namespace :admin do
    root to: 'tests#index'
    get 'gists', to: "gists#index" 
    resources :tests do
      patch 'update_inline', to: "tests#update_inline", on: :member
      resources :questions, except: [:index], shallow: true do
        resources :answers, except: [:index], shallow: true
      end
    end
  end
  
  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post 'gists', to: "gists#create"
    end
  end
      
end
