Rails.application.routes.draw do
  root to: 'application#index'
  devise_for :authors, :controllers => { :registrations => "registrations" }
  resources :authors

  resources :short_stories

  resources :poems

  get 'text/new', to: 'application#new_text', as: 'new_text'
  get 'text/:type/show/:id', to: 'application#show_text', as: 'show_text'
end
