Rails.application.routes.draw do
  namespace :site do
    get 'welcome/index'
  end

  namespace :users_backoffice do
    get 'welcome/index'
  end
  devise_for :users

  namespace :admins_backoffice do
    get 'welcome/index'
    resources :admins
    resources :subjects
  end
  devise_for :admins

  root to: 'site/welcome#index'
end
