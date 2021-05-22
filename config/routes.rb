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
    get 'events/search'
    resources :customers do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end

      get '/customers/:id/quit' => 'customers#quit', as: 'quit_customer' #退会画面への遷移
      patch '/customers/:id/quit' => 'customers#out', as: 'out_customer' #会員ステータスの切替

    resources :events do
      collection do
      get :search
      end
      resources :comments, only: [:create, :destroy]
  end

    resources :searches
    resources :blogs, only: [:new, :create, :index, :show, :destroy] do
      resources :blog_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :blog_images, only: [:new, :create, :index, :show, :destroy]
    root to: 'homes#top'
  end
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
