Rails.application.routes.draw do
  
  devise_for :users, :controllers => { :sessions => 'sessions' }, skip: [:registrations]
  devise_for :admins, skip: [:sessions, :registrations]
  devise_for :customers, skip: :sessions

end
