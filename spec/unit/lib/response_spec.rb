RSpec.describe Response do
  describe '#rack_response' do
    it 'Rackインターフェースに従ったレスポンスを返すこと' do
      response = Response.new(200, { 'Content-Type' => 'text/html' }, 'Hello')

      expect(response.rack_response)
        .to eq [200, { 'Content-Type' => 'text/html' }, ['Hello']]
    end
  end
end
