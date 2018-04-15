Rails.application.routes.draw do

  root to: "cocktails#index"
  resources :cocktails do
    resources :doses, only: [:new, :create, :destroy, :show]
end
  # get 'doses/new'

  # get 'doses/create'

  # get 'doses/delete'

  # get 'cocktails/index'

  # get 'cocktails/show'

  # get 'cocktails/new'

  # get 'cocktails/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
