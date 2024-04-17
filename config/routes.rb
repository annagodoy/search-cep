Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do 
  # root "articles#index"
      resources :sessions, only: [:create]
        delete 'logout', to: 'sessions#logout'
        get 'logged_in', to: 'sessions#logged_in'
    end
  end
end
