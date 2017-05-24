Rails.application.routes.draw do


  devise_scope :professor do
    get "/logout" => "devise/sessions#destroy", as: :destroy_proffesor_session
  end
  root to: "home#index"

  get 'administrators/profile', to: 'administrators#show', as: :show_current_administrator
  get 'administrators/edit', to: 'administrators#edit', as: :edit_current_administrator
  get 'administrators/home', to: 'administrators#home', as: :administrator_home
  get 'administrators/edit_password', to: 'administrators#edit_password', as: :administrator_edit_password
  patch 'administrators/update_password', to: 'administrators#update_password', as: :administrator_update_password

  get 'evaluators/profile', to: 'evaluators#show', as: :show_current_evaluator
  get 'evaluators/home', to: 'evaluators#home', as: :evaluator_home
  get 'evaluators/evaluate', to: 'evaluations#evaluate', as: :evaluate
  get 'evaluators/show', to: 'evaluators#show', as: :evaluator_show
  get 'evaluators/edit', to: 'evaluators#edit', as: :edit_current_evaluator
  get 'evaluators/edit_password', to: 'evaluators#edit_password', as: :evaluator_edit_password
  patch 'evaluators/update_password', to: 'evaluators#update_password', as: :evaluator_update_password

  patch 'evaluations/:id/finish', to: 'evaluations#finish', as: :evaluation_finish
  post 'evaluations/:id/upload_pdf', to: 'evaluations#upload_pdf', as: :evaluations_upload_pdf
  delete 'evaluations/:id/destroy_pdf', to: 'evaluations#destroy_pdf', as: :evaluations_destroy_pdf

  get 'professors/home', to: 'professors#home', as: :professor_home
  get 'professors/profile', to: 'professors#show', as: :show_current_professor
  get 'professors/edit', to: 'professors#edit', as: :edit_current_professor

  patch 'publications/:id/evaluate', to: 'publications#evaluate', as: :publication_to_evaluation
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
  get 'application_requests/:id/reject', to: 'application_requests#reject', as: :application_request_reject_form
  get 'application_requests/:id/final_concept_form', to: 'application_requests#final_concept', as: :final_concept_form
  get 'application_requests/:id/third_evaluator', to: 'application_requests#third_evaluator', as: :create_third_evaluator
  patch 'application_requests/:id/form_b_create', to: 'application_requests#form_b_create', as: :form_b_create
  patch 'application_request/:id/authorize', to: 'application_requests#authorize', as: :application_request_authorize
  patch 'application_request/:id/reject_create', to: 'application_requests#reject_create', as: :application_request_reject
  patch 'application_request/:id/final_concept', to:'application_requests#final_concept_create', as: :application_final_concept

  devise_for :professors, path: '', path_names: { sign_in: '', sign_out: 'logout'}
  devise_for :administrators
  devise_for :evaluators
  resources :publications
  resources :evaluations, except: :edit do
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
  resources :editorial_concept_criteria
  resources :criteria

  get 'not_authorized', to: 'professors#not_authorized', as:  :not_authorized
  get 'under_construction', to: 'home#under_construction', as:  :under_construction
  get 'publications/:id/create_carta_de_presentacion', to: 'publications#create_carta_de_presentacion', as:  :create_carta_de_presentacion
  get 'publications/:id/create_concepto_editorial', to: 'publications#create_concepto_editorial', as:  :create_concepto_editorial

  # Rutas para el sidebar
  get 'info', to: "home#index"
  get 'catalog', to: "home#index"
  get 'instructions', to: "home#index"
  get 'contact', to: "contact#contact"

end
