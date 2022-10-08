Rails.application.routes.draw do
  root 'tests#index'

  namespace :admin do
    root to: 'tests#index'
  end

  devise_for :users, path_names: {sign_in: :login, sign_out: :logout, sign_up: :signup}
  
  resources :tests, only: :index do

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  namespace :admin do
    resources :tests do
      resources :questions, except: [:index], shallow: true do
        resources :answers, except: [:index], shallow: true
      end
    end
  end
      
end
