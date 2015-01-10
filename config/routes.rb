Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  root 'homes#index'

  resources :manufacturers, only: [:index, :create, :new]
  resources :vehicles, only: [:index, :create, :new]

end
