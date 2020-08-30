module V1
  class Users < Grape::API
    namespace :users do
      desc 'Register new User'
      post do
        status 200
        run!(User::Operation::Create, params: params)
      end

      desc 'Sign in User'
      post :sign_in do
        status 200
        run!(Session::Operation::Create, params: params)
      end
    end
  end
end
