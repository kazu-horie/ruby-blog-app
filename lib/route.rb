class Route
  attr_accessor :path, :controller_name, :action_name

  def initialize(path:, to:)
    @path            = path
    @controller_name = to[:controller_name]
    @action_name     = to[:action_name]
  end

  def controller
    Controller.const_get(controller_name)
  end

  def execute(env)
    controller.new(env).send(action_name.to_sym)
  end
end
