Rails.application.routes.draw do

  root to:"public/homes#top"

  devise_for :admin,skip: [:passwords, :registrations], controllers: {
  sessions: 'admin/sessions'
}
  devise_for :users,skip: [:passwords], controllers: {
  registrations: 'public/registrations',
  sessions: 'public/sessions'
}

  scope module: :public do
    get "post_search" => "homes#post_search"
    get "tag_search" => "homes#tag_search"
    get 'about' => 'homes#about', as: 'about'
    get 'users/:user_id/reviews' => 'reviews#show', as: 'user_reviews'
    get 'users/:user_id/reviews/:id/edit' => 'reviews#edit', as: 'edit_user_review'
    resources :users,only: [:show, :edit, :update]
    post 'guest/login' => 'guest_sessions#guest_login'
    resources :posts,only: [:show] do
      resources :reviews,only: [:index, :create]
    end
    resources :comments,only: [:new, :create]
  end

  get 'admin' => 'admin/homes#top', as: 'admin'

  namespace :admin do
    patch 'posts/:id/update_tag' => 'posts#update_tag', as: 'update_tag'
    delete 'posts/:post_id/delete_tag/:tag_id' => 'posts#delete_tag', as: 'delete_tag'
    resources :posts,only: [:new, :index, :show, :edit, :create, :update, :destroy]
    resources :users,only: [:index, :show, :edit, :update] do
      resources :reviews,only: [:index, :show, :edit, :update, :destroy]
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
