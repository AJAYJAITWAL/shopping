
Rails.application.routes.draw do
  resources :products
  devise_for :users
  get '/payment' => 'orders#payment', :as => 'payment_option'
  post 'orders/place_order'
  get '/total_revenue' => 'orders#total_revenue', :as => 'total_revenue_option'
  get 'store/index'
  get '/search' => 'products#search', :as => 'search_page'
  root 'products#index'
  resources :orders do
    resources :line_items
  end
  resource :carts, only: [:show]
  
end

