Rails.application.routes.draw do
  root to: 'tasks#index'
  resources :tags
  resources :tasks do
    post :update_row_order, on: :collection
    patch :update_status, :on => :member
  end
end
