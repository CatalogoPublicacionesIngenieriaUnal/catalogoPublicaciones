Rails.application.routes.draw do

  resources :criteria
  devise_scope :professor do
    get "/logout" => "devise/sessions#destroy", as: :destroy_proffesor_session
  end
  root to: "home#index"

  get 'application_requests/:id/new_evaluator/', to: 'application_requests#create_evaluator', as:  :add_evaluator
  get 'evaluate/:id', to: 'evaluators#authenticate_evaluator', as: :authenticate_evaluator
  post 'evaluations/evaluate', to: 'evaluations#evaluate', as: :evaluate_publication
  get 'professors/home', to: 'professors#home', :as => :professor_home
  get 'administrators/home', to: 'administrators#home', :as => :administrator_home
  get 'professors/profile', to: 'professors#show', :as => :show_current_professor
  get 'professors/edit', to: 'professors#edit', :as => :edit_current_professor
  get 'administrators/profile', to: 'administrators#show', :as => :show_current_administrator
  get 'administrators/edit', to: 'administrators#edit', :as => :edit_current_administrator
  get 'application_requests/:id/authorize', to: 'application_requests#authorize', :as => :authorize_application
  get 'publications/statistics', to: 'publications#statistics', :as => :statistics
  get 'publications/dataTest', :defaults => { :format => 'json' }
  get 'publications/dataTheme', :defaults => { :format => 'json' }

  devise_for :professors, path: '', path_names: { sign_in: '', sign_out: 'logout'}
  devise_for :administrators
  resources :publications
  resources :evaluations do
    resources :evaluators, shallow: true
  end
  resources :application_requests, except: [:edit, :update] do
    resources :attatchments, shallow: true
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
