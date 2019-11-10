class App
  attr_reader :router

  def initialize(router)
    @router = router
  end

  # Entry point
  #
  # @return [Array]
  def call(env)
    route = router.route(
      env['PATH_INFO'],
      env['REQUEST_METHOD'].downcase.to_sym
    )
    if route
      route.execute(env)
    else
      [404, {}, []]
    end
  end
end
