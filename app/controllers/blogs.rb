module Controller
  class Blogs < BaseController
    def index
      articles = DAO::Article.new.articles_all
      view('blogs/index', articles: articles)
      response.status_code = 200
    end
  end
end
