Rails.application.routes.draw do
  namespace :api do
      resources :news, only: [:index, :show, :create, :update, :destroy]
  end
    namespace :admin do
      resources :news
  end
end
