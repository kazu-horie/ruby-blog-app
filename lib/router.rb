class Router
  # Constructor
  #
  # @param [String] routes_file_string
  def initialize(routes_file_string)
    @routes_file_string = routes_file_string
  end

  def routes
    unless @routes
      @routes = Hash.new { |hash, key| hash[key] = [] }
      instance_eval(@routes_file_string)
    end

    @routes
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

  def config(&block)
    block.call
  end

  def get(path, options = {})
    routes[:get] << Route.new(path: path, to: parse_to(options[:to]))
  end

  def post(path, options = {})
    routes[:post] << Route.new(path: path, to: parse_to(options[:to]))
  end

  def put(path, options = {})
    routes[:put] << Route.new(path: path, to: parse_to(options[:to]))
  end

  def delete(path, options = {})
    routes[:delete] << Route.new(path: path, to: parse_to(options[:to]))
  end
end
