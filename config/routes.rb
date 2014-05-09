AdventureStore::Application.routes.draw do
 root :to => 'adventures#index'
  devise_for :users
  resources :adventures do
    member do
      get 'purchase'
    end
  resources :reviews, only: [:new, :create]
  end

end
