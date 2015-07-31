Rails.application.routes.draw do
  
  resources :products

  devise_for :users, :controllers => { :sessions => 'sessions' }, skip: [:registrations]
  devise_for :admins, skip: [:sessions, :registrations]
  devise_for :customers, skip: :sessions

  root "products#index"
end
