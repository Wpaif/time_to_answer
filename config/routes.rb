Rails.application.routes.draw do
  namespace :site do
    get 'welcome/index'
    get 'search', to: 'search#question'
    get 'subject/:subject_id/:subject', to: 'search#subject', as: 'search_subject'
    post 'answer', to: 'answer#question'
  end

  namespace :users_backoffice do
    get 'welcome/index'
  end
  devise_for :users

  namespace :admins_backoffice do
    get 'welcome/index'
    resources :admins
    resources :subjects
    resources :questions
  end
  devise_for :admins, skip: %i[registration]

  root to: 'site/welcome#index'
end
