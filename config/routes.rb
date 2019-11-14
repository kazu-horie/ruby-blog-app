config do
  get '/',     to: 'articles#index'
  get '/articles', to: 'articles#index'
  delete /articles\/delete/, to: 'articles#delete'
end
