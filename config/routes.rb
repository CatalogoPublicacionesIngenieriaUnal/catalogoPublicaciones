Rails.application.routes.draw do
  devise_for :judges
  devise_for :administrators
  devise_for :professors
  resources :keywords
  resources :attachments
  resources :professor_publications
  resources :professor_application_requests
  resources :approved_publications
  resources :publications
  resources :application_requests
  resources :states
  resources :languages
  resources :evaluations
  resources :judges
  resources :professors
  resources :administrators
  resources :models

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  # Rutas para el sidebar
  get 'start', to: "home#index"
  get 'info', to: "home#index"
  get 'catalog', to: "home#index"
  get 'instructions', to: "home#index"
  get 'contact', to: "contact#contact"
end
