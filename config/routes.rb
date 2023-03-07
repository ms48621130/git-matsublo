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
    get "search" => "homes#search"
    get 'about' => 'homes#about', as: 'about'
    resources :users,only: [:show, :edit, :update]
    post 'guest/login' => 'guest_sessions#create'
    resources :posts,only: [:show]
    resources :reviews,only: [:index, :new, :create]
    resources :comments,only: [:new, :create]
  end

  get 'admin' => 'admin/homes#top', as: 'admin'

  namespace :admin do
    patch 'posts/:id/update_tag' => 'posts#update_tag', as: 'update_tag'
    delete 'posts/:post_id/delete_tag/:tag_id' => 'posts#delete_tag', as: 'delete_tag'
    resources :posts,only: [:new, :index, :show, :edit, :create, :update, :destroy]
    resources :users,only: [:index, :show, :edit, :update]
    resources :reviews,only: [:index, :show, :edit, :update, :destroy]
  end




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
