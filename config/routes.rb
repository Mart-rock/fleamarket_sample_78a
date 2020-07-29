Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'profiles', to: 'users/registrations#new_profile'
    post 'profiles', to: 'users/registrations#create_profile'
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    get 'confirm', to: 'users/registrations#confirm'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html 
    root to: 'items#index'
    resources :users, only: :show
    
    resources :items
    resources :item_images

    resources :items do
      get :search,on: :collection
    end

  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
        post 'pay', to: 'card#pay'
          post 'delete', to: 'card#delete'
    end
  end

 # resources :item_purchase, only: [:pay_index] do
  #  collection do
      get "pay_index", to: 'item_purchases#pay_index'
  #    post 'pay', to: 'item_purchases#pay'
  #    get 'done', to: 'item_purchases#done'
  #  end
  #end

end
  