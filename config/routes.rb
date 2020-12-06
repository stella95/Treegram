Rails.application.routes.draw do
  get '/' => 'home#index'
  resources :users do
    resources :photos
  end

  resources :tags, only: [:create, :destroy]
  get '/log-in' => "sessions#new"
  post '/log-in' => "sessions#create"
  get '/log-out' => "sessions#destroy", as: :log_out

  resources :users do
    resources :follows, only: [:index, :create] 
  end

  resources :photos do 
    resources :comments, only: [:new, :show, :create]
  end

end
