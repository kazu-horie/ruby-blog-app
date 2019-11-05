class BaseController
  attr_reader :request
  attr_accessor :response
  def initialize(env)
    @request  = Rack::Request.new(env)
    @response = Response.new
  end
end
