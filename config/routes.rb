Rails.application.routes.draw do  
  get 'home/index'

  # resources :posts
  
  resources :accounts, :except => [:show, :edit] # 계정키 CRUD 라우팅
  get '/accounts/:cate' => 'accounts#index'
  get '/accounts/:id/editform' => 'accounts#editform'
  devise_for :users, controllers: { registrations: 'users/registrations' } # 사용자 관리 라우팅
  
  root "home#index" # 계정 생성
end
