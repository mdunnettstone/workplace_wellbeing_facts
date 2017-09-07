Rails.application.routes.draw do
  devise_for :users
  resources :stats do
    get :random, :on => :collection
  end
  root 'static_pages#index'
end
