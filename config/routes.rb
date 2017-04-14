Rails.application.routes.draw do



  devise_scope :professor do
    get "/logout" => "devise/sessions#destroy", :as => :destroy_user_session
  end
  root to: "home#index"

  devise_for :professors, path: '', path_names: { sign_in: '', sign_out: 'logout'}
  devise_for :administrators
  resources :publications
  resources :evaluations
  resources :application_requests
  resources :evaluators
  resources :professors
  resources :administrators
  resources :languages
  resources :themes
  resources :categories
  resources :keywords
  resources :attatchments


  # resources :evaluations, except: :delete do
  #   match 'evaluacion', to: 'evaluations#edit', via: [:put,:post]
  #   match 'edit', to: 'evaluations#show', via: [:get]
  #   resources :application_requests, except: :destroy
  # end
  # resources :judges do
  # end
  # resources :professors, except: :delete do
  #   match 'edit', to: 'professors#show', via: [:get]
  #   resources :application_requests, except: :delete do
  #     match 'new', to: 'application_requests#show', via: [:get]
  #     match 'edit', to: 'application_requests#show', via: [:get]
  #     match 'corregir_manuscrito', to: 'application_requests#show', via: [:get]
  #     match 'subir_documentos', to: 'application_requests#show', via: [:get]
  #   end
  #   resources :publications, only: :get
  # end
  # resources :administrators, except: :delete do
  #   resources :judges, except: :delete do
  #     match 'new', to: 'judges#show', via: [:get]
  #     match 'edit', to: 'judges#show', via: [:get]
  #   end
  #   resources :application_requests, except: :delete do
  #     match 'edit', to: 'application_requests#show', via: [:get]
  #     match 'asignar_evaluadores', to: 'application_requests#show', via: [:get]
  #   end
  #   resources :publications, except: :delete do
  #     match 'new', to: 'publications#show', via: [:get]
  #     match 'edit', to: 'publications#show', via: [:get]
  #   end
  # end

  # Rutas para el sidebar
  get 'info', to: "home#index"
  get 'catalog', to: "home#index"
  get 'instructions', to: "home#index"
  get 'contact', to: "contact#contact"
end
