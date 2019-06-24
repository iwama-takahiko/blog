Rails.application.routes.draw do
  devise_for :users, :controllers => {
    registrations:  'users/registrations',
    sessions:  'users/sessions'
  }
  resources :users, only:[:index,:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "posts#index"
  resources :posts do
  end
end
