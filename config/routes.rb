Rails.application.routes.draw do

  namespace :admin do
    get 'searches/index'
  end
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    registrations: 'customers/registrations' #パスワード無しで編集可能にする・編集後の遷移先指定の為
  }

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end

  scope module: :customer do
    get 'homes/top'
    get 'homes/about'
    resources :customers
    get 'customers/quit'
    resources :events
    resources :searches
    get 'search' => 'events#search'
    get 'search' => 'customers#search'
    resources :blogs, only:[:new, :create, :index, :show, :destroy] do
      resources :blog_comments
    end
    resources :blog_images, only: [:new, :create, :index, :show, :destroy]
    root to: 'homes#top'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
