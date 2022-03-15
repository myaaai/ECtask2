Rails.application.routes.draw do
 
 root to: "public/homes#top"


devise_for :admin,skip:[:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}



namespace :admin do
resources :customers, only: [:show, :edit, :index, :update]
resources :genres,only: [:index, :create, :edit, :update]
resources :items
resources :orders, only: [:index, :show, :update]
resources :order_statuses
end

scope module: :public do
resource :customers, only: [:show, :edit, :update]
get "/customers/:id/index" => "customers#withdraw", as: "withdraw"
patch "/customers/:id" => "customers#destroy", as: "destroy"
resources :items, only: [:index, :show]
delete "/cart_items/destroy_all", as: "destroy_all"
resources :cart_items, only: [:index, :update, :destroy, :create]
resources :shipping_addresses, only: [:index, :edit, :create, :destroy]
get "/orders/complete" => "orders#complete", as: "complete"
resources :orders, only: [:new, :index, :show, :create]
post "/orders/confirm" => "orders#confirm", as: "confirm"
end

devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

 get "/about" => "public/homes#about", as: "about"
end