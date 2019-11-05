class Router
  attr_accessor :routes

  # Constructor
  #
  # @param [Hash] routes
  def initialize
    @routes = Hash.new { |hash, key| hash[key] = [] }
    File.open(File.join('./config', 'routes.rb')) { |f| instance_eval(f.read) }
  end

  def config
    yield
  end

  def get(path, options = {})
    routes[:get] << Route.new(path: path, to: parse_to(options[:to]))
  end

  def route(path, http_method)
    routes[http_method].find do |route|
      case route.path
      when String
        path == route.path
      when Regexp
        path =~ route.path
      end
    end
  end

  private

  def parse_to(to_str)
    controller_name, action_name = to_str.split('#')
    { controller_name: controller_name.capitalize, action_name: action_name }
  end
end
