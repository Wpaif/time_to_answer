Rails.application.routes.draw do
  devise_for :profiles
  devise_for :admins
  root to: 'welcome#index'
  get 'welcome/index', to: 'welcome#index'
end
