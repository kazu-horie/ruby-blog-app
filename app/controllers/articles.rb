module Controller
  class Articles < BaseController
    def index
      articles = DAO::Article.new.articles_all

      view('articles/index', articles: articles)
    end

    def destroy
      DAO::Article.new.destroy(params['id'])

      redirect_to(path: :articles)
    end

    def new
      view('articles/new')
    end

    def create
      DAO::Article.new.create(
        params['title'], params['description']
      )

      redirect_to(path: :articles)
    end

    def show
      article = DAO::Article.new.article_by_id(params['id'])

      view('articles/show', article: article)
    end

    def update
      DAO::Article.new.update(
        params['id'], params['title'], params['description']
      )

      redirect_to(path: :articles)
    end
  end
end
