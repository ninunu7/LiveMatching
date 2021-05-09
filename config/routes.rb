Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  devise_for :customers, controllers: {
    sessions: 'customers/sessions'
  }

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
