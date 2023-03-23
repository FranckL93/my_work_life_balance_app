Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  devise_for :users

  # Goal routes nested under user
  resources :users do
    resources :goals
  end

  # Activity routes nested under goal
  resources :goals do
    resources :activities
  end

  # Reminder routes nested under goal
  resources :goals do
    resources :reminders
  end

  # Community routes
  resources :communities
end
