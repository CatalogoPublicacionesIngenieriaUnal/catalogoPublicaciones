Rails.application.routes.draw do
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
  get 'home/index'
  get 'home/contact'
end
