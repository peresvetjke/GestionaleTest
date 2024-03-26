Rails.application.routes.draw do
  resources :hello

  resources :article_drafts
  resources :articles

  namespace :customer do
    resources :users do
      resource :contact
      resources :addresses
    end
  end

  resolve('Customer::Contact') {
    [:customer, :user, :contact]
  }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
