Rails.application.routes.draw do

  resources :editorial_concept_criteria
  resources :criteria
  devise_scope :professor do
    get "/logout" => "devise/sessions#destroy", as: :destroy_proffesor_session
  end
  root to: "home#index"

  get 'administrators/profile', to: 'administrators#show', :as => :show_current_administrator
  get 'administrators/edit', to: 'administrators#edit', :as => :edit_current_administrator
  get 'administrators/home', to: 'administrators#home', :as => :administrator_home


  get 'evaluate/:id', to: 'evaluators#authenticate_evaluator', as: :authenticate_evaluator
  post 'evaluations/evaluate', to: 'evaluations#evaluate', as: :evaluate_publication


  get 'professors/home', to: 'professors#home', :as => :professor_home
  get 'professors/profile', to: 'professors#show', :as => :show_current_professor
  get 'professors/edit', to: 'professors#edit', :as => :edit_current_professor

  get 'publications/delete_pdf', to: 'publications#delete_pdf', :as => :delete_pdf
  get 'publications/statistics', to: 'publications#statistics', :as => :statistics
  get 'publications/dataCateg', :defaults => { :format => 'json' }
  get 'publications/dataTheme', :defaults => { :format => 'json' }
  get 'publications/dataCategPie', :defaults => { :format => 'json' }
  get 'publications/dataThemePie', :defaults => { :format => 'json' }
  get 'publications/dataStatusPie', :defaults => { :format => 'json' }
  get 'application_requests/index_others', to: 'application_requests#index_others', :as => :index_others

  get 'application_requests/:id/new_evaluator/', to: 'application_requests#create_evaluator', as:  :add_evaluator
  get 'application_requests/:id/form_b', to: 'application_requests#form_b', as: :form_b
  get 'application_requests/:id/show_b/', to: 'application_requests#show_b', as: :show_b
  patch 'application_requests/:id/form_b_create', to: 'application_requests#form_b_create', as: :form_b_create
  patch 'application_request/:id/authorize', to: 'application_requests#authorize', as: :application_request_authorize
  patch 'application_request/:id/reject_create', to: 'application_requests#reject_create', as: :application_request_reject
  get 'application_request/:id/reject', to: 'application_requests#reject', as: :application_request_reject_form

  devise_for :professors, path: '', path_names: { sign_in: '', sign_out: 'logout'}
  devise_for :administrators
  resources :publications
  resources :evaluations do
    resources :evaluators, shallow: true
  end

  resources :application_requests, except: [:edit, :update] do
    resources :attatchments, shallow: true, except: :new
  end

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

  get 'not_authorized', to: 'professors#not_authorized', as:  :not_authorized
  get 'under_construction', to: 'home#under_construction', as:  :under_construction
  get 'publications/:id/create_pdf', to: 'publications#create_pdf', as:  :create_pdf

  # Rutas para el sidebar
  get 'info', to: "home#index"
  get 'catalog', to: "home#index"
  get 'instructions', to: "home#index"
  get 'contact', to: "contact#contact"

end
