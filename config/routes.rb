config do
  get '/', to: 'articles#index'
  get '/articles', to: 'articles#index'
  get '/articles/new', to: 'articles#new'
  get '/articles/show', to: 'articles#show'
  put '/articles', to: 'articles#update'
  post '/articles', to: 'articles#create'
  delete '/articles', to: 'articles#destroy'
end
