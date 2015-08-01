Rails.application.routes.draw do
  resources :orders, only: [:index, :show] do
    collection do
      get :place
      get :user_orders
    end
    member do
      post :pay
      post :ship
    end
  end

  resources :basket, controller: "basket_items", as: "basket_items" do
    collection do
      get :empty
    end
  end

  resources :products do
    member do
      get :add_to_basket
    end
  end

  devise_for :users, :controllers => { :sessions => 'sessions' }, skip: [:registrations]
  devise_for :admins, skip: [:sessions, :registrations]
  devise_for :customers, skip: :sessions

  root "products#index"
end
