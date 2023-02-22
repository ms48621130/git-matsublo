Rails.application.routes.draw do
 # devise_for :admins
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  devise_for :admins,skip: [:passwords, :registrations], controllers: {
  sessions: 'admins/sessions'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
