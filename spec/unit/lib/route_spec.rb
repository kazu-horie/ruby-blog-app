RSpec.describe Route do
  before do
    dec = <<-DECS
      module Controller
        class Test < ::BaseController
          def test
          end
        end
      end
    DECS

    eval(
      dec,
      binding,
      __FILE__,
      __LINE__ - 3
    )
  end

  let(:route) do
    Route.new(
      path: '/test',
      to: { controller_name: 'Test', action_name: 'test' }
    )
  end

  describe '#controller' do
    it 'コントローラ名が取得できること' do
      expect(route.controller_class).to eq(Controller::Test)
    end
  end

  describe '#execute' do
    it 'コントローラのアクションメソッドが実行されること' do
      expect(route.execute({}))
        .to eq([200, { 'Content-Type' => 'text/html' }, ['']])
    end
  end
end
