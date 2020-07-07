Rails.application.routes.draw do

  resources :articles do
    resources :comments, only: [:create, :update, :destory]
  end

  devise_for :users  
  get '/', to: 'articles#index'


  root to: 'articles#index'
  # For details on the DSL available within this file,
  #see https://guides.rubyonrails.org/routing.html

end
