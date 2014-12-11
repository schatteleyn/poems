Rails.application.routes.draw do
  devise_for :authors, :controllers => { :registrations => "registrations" }
  resources :authors

  resources :short_stories

  resources :poems

end
