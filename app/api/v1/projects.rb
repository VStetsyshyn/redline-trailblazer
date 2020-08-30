class V1::Projects < Grape::API
  namespace :projects do
    desc 'List all projects'
    get do
      authenticate!
      run!(Project::Operation::Index, params: params, current_user: current_user)
    end

    desc 'Return specific project'
    get ':id' do
      authenticate!
      run!(Project::Operation::Show, params: params, current_user: current_user)
    end

    desc 'Create Project'
    post do
      status 200
      authenticate!
      run!(Project::Operation::Create, params: params, current_user: current_user)
    end

    desc 'Update project'
    put ':id' do
      authenticate!
      run!(Project::Operation::Update, params: params, current_user: current_user)
    end

    desc 'Destroy project'
    delete ':id' do
      authenticate!
      run!(Project::Operation::Destroy, params: params, current_user: current_user)
    end
  end
end
