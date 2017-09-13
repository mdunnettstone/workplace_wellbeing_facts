Rails.application.routes.draw do
  devise_for :users
  get 'tags/:tag', to: 'stats#index', as: :tag
  resources :stats do
    get :random, :on => :collection
  end
  root 'static_pages#index'
end
