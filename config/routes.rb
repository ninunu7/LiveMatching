Rails.application.routes.draw do
  devise_for :customers
  root to: 'homes#top'
  namespace :customer do
    get 'blogs/new'
    get 'blogs/index'
    get 'blogs/show'
  end
  namespace :customer do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/quit'
  end
  namespace :customer do
    get 'events/new'
    get 'events/edit'
  end
  namespace :customer do
    get 'searches/top'
    get 'searches/index'
  end
  namespace :customer do
    get 'homes/top'
    get 'homes/about'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
