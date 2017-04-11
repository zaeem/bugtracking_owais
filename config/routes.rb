Rails.application.routes.draw do

   root to: 'bugs#index'
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :bugs
  resources :projects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
