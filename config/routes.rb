Rails.application.routes.draw do

  resources :wikis
  
  get 'public_wikis' => 'wikis#public_wikis', :as => 'public_wikis'

  devise_for :users

  resources :charges, only: [:new, :create]

  root 'welcome#index'

  post 'charges/downgrade' => 'charges#downgrade', :as => 'downgrade'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
