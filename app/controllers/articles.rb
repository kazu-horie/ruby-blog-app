module Controller
  class Articles < BaseController
    def index
      articles = DAO::Article.new.articles_all
      view('articles/index', articles: articles)
      response.status_code = 200
    end

    def delete
      DAO::Article.new.delete(params['article_id'])

      redirect_to(path: :articles)
    end
  end
end
