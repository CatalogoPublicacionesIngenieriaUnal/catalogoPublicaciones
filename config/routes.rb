Rails.application.routes.draw do

  devise_scope :professor do
    get "/logout" => "devise/sessions#destroy", :as => :destroy_proffesor_session
  end
  root to: "home#index"

  devise_for :professors, path: '', path_names: { sign_in: '', sign_out: 'logout'}
  devise_for :administrators
  resources :publications
  resources :evaluations
  resources :application_requests
  resources :evaluators
  resources :professors do
    collection do
      put :autorize
    end
  end
  resources :administrators
  resources :languages
  resources :themes
  resources :categories
  resources :keywords
  resources :attatchments
  get 'professor/home', to: 'professors#home', :as => :professor_home
  get 'administrator/home', to: 'administrators#home', :as => :administrator_home
  get 'professor/not_authorized', to: 'professors#not_authorized', :as => :not_authorized
  get 'under_construction', to: 'home#under_construction', :as => :under_construction
  get 'professor/profile', to: 'professors#show', :as => :show_current_professor
  get 'professor/edit', to: 'professors#edit', :as => :edit_current_professor
  get 'publications/:id/create_pdf', to: 'publications#create_pdf', :as => :create_pdf


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
