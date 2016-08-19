Rails.application.routes.draw do
  root 'static_pages#home'

  namespace :admin do
    resources :speakers, except: [:show]
  end
end
