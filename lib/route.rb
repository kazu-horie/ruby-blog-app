class Route
  attr_accessor :path, :controller_name, :action_name

  def initialize(path:, to:)
    @path            = path
    @controller_name = to[:controller_name]
    @action_name     = to[:action_name]
  end

  def controller_class
    Controller.const_get(controller_name)
  end

  def execute(env)
    controller = controller_class.new(env)
    controller.send(action_name.to_sym)
    controller.rack_response
  end
end
