Rails.application.routes.draw do
  resources :keywords do 
  
  end
  resources :attachments do

  end
  resources :professor_publications do
  end
  resources :professor_application_requests do

  end
  resources :approved_publications do

  end  
  resources :publications do

  end
  resources :application_requests do

  end
  resources :states do

  end
  resources :languages do

  end
  resources :evaluations, except: :delete do
    match 'evaluacion', to: 'evaluations#edit', via: [:put,:post]
    match 'edit', to: 'evaluations#show', via: [:get]
    resources :application_requests, except: :destroy 
  end
  resources :judges do 
  end
  resources :professors, except: :delete do
    match 'edit', to: 'professors#show', via: [:get]
    resources :application_requests, except: :delete do
      match 'new', to: 'application_requests#show', via: [:get]
      match 'edit', to: 'application_requests#show', via: [:get]
      match 'corregir_manuscrito', to: 'application_requests#show', via: [:get]
      match 'subir_documentos', to: 'application_requests#show', via: [:get]
    end
    resources :publications, only: :get
  end
  resources :administrators, except: :delete do 
    resources :judges, except: :delete do
      match 'new', to: 'judges#show', via: [:get]
      match 'edit', to: 'judges#show', via: [:get]
    end
    resources :application_requests, except: :delete do
      match 'edit', to: 'application_requests#show', via: [:get]
      match 'asignar_evaluadores', to: 'application_requests#show', via: [:get]
    end 
    resources :publications, except: :delete do
      match 'new', to: 'publications#show', via: [:get]
      match 'edit', to: 'publications#show', via: [:get]
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  # Rutas para el sidebar
  get 'start', to: "home#index"
  get 'info', to: "home#index"
  get 'catalog', to: "home#index"
  get 'instructions', to: "home#index"
  get 'contact', to: "contact#contact"
end
