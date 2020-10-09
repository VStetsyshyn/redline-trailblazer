require './lib/macro/permission/service_call.rb'

class Project::Operation::Create < OperationBase
  step Macro::Permission::ServiceCall(action: 'create', model: Project, nested_model: Client)
  fail :forbidden!
  step Model(Project, :new)
  step :assign_current_user!

  step Wrap(::Transaction) {
    step Subprocess(Client::Operation::Create), input: Project::Input::ClientCreate, output: Project::Output::ClientCreate
    step Contract::Build(constant: Project::Contract::Create)
    step Contract::Validate()
    step Contract::Persist()
    fail Macro::Rollback()
  }

  fail :nested_model_invalid!

  def assign_current_user!(options, **)
    options[:model].user = options[:current_user]
  end

  def forbidden!(options, **)
    permission_error(options, 'Permission Forbidden')
  end

  def nested_model_invalid!(options, params:, **)
    error(options, params[:errors] || options[:errors][:permission_error])
  end
end
