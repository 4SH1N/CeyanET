Rails.application.routes.draw do
  devise_for :clients
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  root "static_pages#home"
  get  "service", to: "static_pages#service"
  get  "about",   to: "static_pages#about"
  get  "contact", to: "static_pages#contact"
  get  "faq",     to: "static_pages#faq"
  resources :clients, only: [ :show, :edit, :update ] do
    resources :tickets, shallow: true do
      resources :activities, only: [ :index, :create ]
    end
    resources :devices, shallow: true
  end
end
