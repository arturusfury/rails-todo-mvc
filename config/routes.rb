Rails.application.routes.draw do
  resources :lists
  get 'site/index'

  root 'lists#index'
end
