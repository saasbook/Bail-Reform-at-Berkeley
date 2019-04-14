Rails.application.routes.draw do
  root 'home#index'

  # routes for donating
  get 'donate/new' => 'donate#new', :as => 'new_donation'
  get 'donate/success' => 'donate#success', :as => 'successful_donation'
  get 'donate/error' => 'donate#fail', :as => 'failed_donation'
  get 'donate/:stripeToken/:amount' => 'donate#create', :as => 'create_donation'

  # routes for applicants
  get 'apply/new' => 'apply#new', :as => 'new_apply'

  # routes for logistics
  get 'home' => 'home#index',   :as => 'home'
  get 'about' => 'home#about', :as => 'about'
  get 'team' => 'home#team', :as => 'team'
  get 'volunteer' => 'home#volunteer', :as => 'volunteer'
  get 'faq' => 'home#faq', :as => 'faq'
  get 'blog' => 'home#blog', :as => 'blog'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
