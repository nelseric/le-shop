Rails.application.routes.draw do
  resources :orders, only: [:index, :show] do
    collection do
      post :place
      get :user_orders
    end
    member do
      post :pay
      post :ship
    end
  end

  resources :basket, controller: "basket_items", as: "basket_items", only: [:index, :update, :destroy] do
    collection do
      delete :empty
    end
  end

  resources :products do
    member do
      post :add_to_basket
    end
  end

  devise_for :users, :controllers => { :sessions => 'sessions' }, skip: [:registrations]
  devise_for :admins, skip: [:sessions, :registrations]
  devise_for :customers, skip: :sessions

  root "products#index"
end
