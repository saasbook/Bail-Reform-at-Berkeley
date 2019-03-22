Rails.application.routes.draw do
  get 'donate/new' => 'donate#new', :as => 'new_donation'
  get 'home' => 'home#index',   :as => 'home'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
