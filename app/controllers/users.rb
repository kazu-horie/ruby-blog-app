module Controller
  class Users < BaseController
    def new
      view('users/new')
    end

    def create
      DAO::User.new.create(
        params['username'], params['password']
      )

      redirect_to(path: :articles)
    end

    def login
      user = DAO::User.new.user_by_name(params['username'])

      if user.nil? || user.password != params['password']
        redirect_to(path: nil)
        return
      end

      redirect_to(path: :articles)
    end
  end
end
