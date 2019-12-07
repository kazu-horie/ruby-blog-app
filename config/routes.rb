config do
  get '/', to: 'home#home'
  get '/users/new', to: 'users#new'
  get '/articles', to: 'articles#index'
  get '/articles/new', to: 'articles#new'
  get '/articles/show', to: 'articles#show'
  put '/articles', to: 'articles#update'
  post '/users', to: 'users#create'
  post '/users/login', to: 'users#login'
  post '/articles', to: 'articles#create'
  delete '/articles', to: 'articles#destroy'
end
