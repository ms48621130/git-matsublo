Rails.application.routes.draw do


  root to:"public/homes#top"

  scope module: :public do
    get 'about' => 'homes#about', as: 'about'
    get 'users/my_page' => 'users#show'
    get 'users/information/edit' => 'users#edit'
    patch 'users/information' => 'users#update'
    post 'guest/login' => 'guest_sessions#create'
    resources :posts,only: [:show]
    resources :reviews,only: [:index, :new, :create]
    resources :comments,only: [:new, :create]
  end



  get 'admin' => 'admin/homes#top', as: 'admin'

  namespace :admin do
    resources :posts,only: [:index, :show, :edit, :create, :update, :destroy]
    resources :users,only: [:index, :show, :edit, :update]
    resources :reviews,only: [:index, :show, :edit, :update, :destroy]
  end


  devise_for :admin,skip: [:passwords, :registrations], controllers: {
  sessions: 'admin/sessions'
}
  devise_for :users,skip: [:passwords], controllers: {
  registrations: 'public/registrations',
  sessions: 'public/sessions'
}


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
