class BaseController
  attr_reader :request
  attr_accessor :response

  def initialize(env)
    @request  = Rack::Request.new(env)
    @response = Response.new
  end

  def params
    request.params
  end

  def view(template_name, params = {})
    params.each do |key, value|
      instance_variable_set("@#{key}", value)
    end

    erb_script = File.open(
      File.join('./app', 'views', template_name + '.html.erb'), &:read
    )

    response.body = ERB.new(erb_script).result(binding)
    response.headers.merge!('Content-Type' => 'text/html')
    response.status_code = 200
  end

  def redirect_to(path:)
    response.status_code = 302
    response.headers.merge!(
      'Location' => "http://#{request.env['HTTP_HOST']}/#{path}"
    )
  end

  def rack_response
    [response.status_code, response.headers, Array(response.body)]
  end
end
