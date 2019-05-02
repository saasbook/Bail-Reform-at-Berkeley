Rails.application.routes.draw do
  root to: 'info#index'

  # routes for signing in, using 'devise'
  devise_for :users, path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      sign_up: 'register'
    }

  # routes for donating
  get 'donate/new' => 'donate#new', :as => 'new_donation'
  get 'donate/success' => 'donate#success', :as => 'successful_donation'
  get 'donate/error' => 'donate#fail', :as => 'failed_donation'
  get 'donate/:stripeToken/:amount' => 'donate#create', :as => 'create_donation'

  # routes for filling out an application form
  ## suggestion: new model "forms", and user has_many forms
  get 'apply' => 'apply#index', :as => 'application'
  post 'apply_form_submit' => 'apply#apply_bail', :as => 'apply_form_submit'
  get 'apply/new' => 'apply#new', :as => 'new_application'

  # routes for logistics
  get 'home' => 'info#index',   :as => 'home'
  get 'about' => 'info#about', :as => 'about'
  get 'team' => 'info#team', :as => 'team'
  get 'participate' => 'info#participate', :as => 'participate'
  get 'faq' => 'info#faq', :as => 'faq'
  get 'blog' => 'info#blog', :as => 'blog'
  get 'contact' => 'info#contact', :as => 'contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
