class Response
  attr_accessor :status_code, :headers, :body

  def initialize(
    status_code = 200,
    headers = { 'Content-Type' => 'text/html' },
    body = ''
  )
    @status_code = status_code
    @headers = headers
    @body = body
  end

  def rack_response
    [status_code, headers, Array(body)]
  end
end
