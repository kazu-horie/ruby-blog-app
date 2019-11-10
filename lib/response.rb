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
end
