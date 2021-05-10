Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    registrations: 'customers/registrations' #パスワード無しで編集可能にする・編集後の遷移先指定の為
  }

  namespace :admin do
    resources :customers
  end

  scope module: :customer do
    get 'homes/top'
    get 'homes/about'
    resources :blogs
    resources :customers
    get 'customers/quit'
    resources :events
    resources :searches
    root to: 'homes#top'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
