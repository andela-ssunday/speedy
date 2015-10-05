Rails.application.routes.draw do
  get 'stats/index'

  get 'comments/new'
  post 'comments/create', as: "comments"
  resources :author, as: "auth"
  root to: 'author#index'
  get 'articles/show/:id' => "articles#show", as: "articles_show"
end
