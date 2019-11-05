module Controller
  class Hello < BaseController
    def index
      response.body = 'Hello World'
      response.status_code = 200
      response
    end
  end
end
