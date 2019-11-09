RSpec.describe Router do
  let(:routes_file_string) do
    <<-ROUTES
      config do
        get '/', to: 'hello#index'
      end
    ROUTES
  end

  let(:router) { Router.new(routes_file_string) }

  describe '#routes' do
    context '@routes が未定義の場合' do
      it 'instance_eval を実行していること' do
        allow(router).to receive(:instance_eval)
        router.routes

        expect(router).to have_received(:instance_eval).once
      end

      it '@routes が取得できること' do
        expect(router.routes).to be_truthy
        expect(router.routes.class).to eq Hash
      end
    end

    context '@routes が定義済の場合' do
      before do
        router.instance_variable_set('@routes', {})
      end

      it 'instance_eval を実行していないこと' do
        allow(router).to receive(:instance_eval)
        router.routes

        expect(router).to have_received(:instance_eval).exactly(0).times
      end

      it '@routes が取得できること' do
        expect(router.routes).to be_truthy
        expect(router.routes.class).to eq Hash
      end
    end
  end

  describe '#route' do
    let(:route_with_string_path) do
      Route.new(
        path: '/', to: { controller_name: 'String', action_name: 'index' }
      )
    end

    let(:route_with_regex_path) do
      Route.new(
        path: /.*/, to: { controller_name: 'Regex', action_name: 'index' }
      )
    end

    it 'path が String の route が取得できていること' do
      router.instance_variable_set('@routes', get: [route_with_string_path])

      expect(router.route('/', :get))
        .to eq route_with_string_path
    end

    it 'path が Regex の route が取得できていること' do
      router.instance_variable_set('@routes', get: [route_with_regex_path])

      expect(router.route('/regex', :get))
        .to eq route_with_regex_path
    end
  end

  describe '#parse_to' do
    it 'ルートの To 情報が取得できること' do
      expect(router.send(:parse_to, 'hello#index'))
        .to match(controller_name: 'Hello', action_name: 'index')
    end
  end

  describe '#config' do
    it 'block を実行していること' do
      allow(router).to receive(:get)
      block = proc { router.send(:get, '/', to: 'hello#index') }
      router.send(:config, &block)

      expect(router).to have_received(:get).once
    end
  end

  describe '#get' do
    it '@routes に HTTP GETルートを格納していること' do
      route = Route.new(
        path: '/', to: { controller_name: 'Hello', action_name: 'index' }
      )
      allow(router).to receive(:routes).and_return(
        Hash.new { |hash, key| hash[key] = [] }
      )
      allow(Route).to receive(:new).and_return(route)
      router.send(:get, '/', to: 'hello#index')

      expect(router.routes).to match(get: [route])
    end
  end
end
