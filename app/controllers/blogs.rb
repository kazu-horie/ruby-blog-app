module Controller
  class Blogs < BaseController
    def index
      view('blogs/index', name: 'horie', age: '23')
      response.status_code = 200
    end
  end
end
