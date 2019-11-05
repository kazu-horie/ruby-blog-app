class Route
  attr_accessor :path, :controller_name, :action_name

  def initialize(path:, to:)
    @path            = path
    @controller_name = to[:controller_name]
    @action_name     = to[:action_name]
    handle_requires
  end

  def controller
    Controller.const_get(controller_name)
  end

  def execute(env)
    controller.new(env).send(action_name.to_sym)
  end

  def handle_requires
    require File.join('./app', 'controllers', controller_name.downcase + '.rb')
  end
end
