Rails.application.routes.draw do
  get 'members/dashboard'
  resources :categories
  authenticated :user,  ->(user) { user.admin? } do
    get 'admin', to: 'admin#index'
    get 'admin/posts'
    get 'admin/comments'
    get 'admin/users'
    get 'admin/show_post/:id', to: 'admin#show_post', as: 'admin_post'
  end

  get 'checkout', to: 'checkouts#show'
  get 'checkout/success', to: 'checkouts#success'
  get 'billing', to: 'billing#show'

  get 'search', to: 'search#index'
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  get '/u/:id', to: 'users#profile', as: 'user'
  resources :after_signup

  resources :posts do
    resources :comments
  end
  root "pages#home"
  get "about", to: "pages#about"
  get "index", to: "pages#index"
end
