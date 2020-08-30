require './lib/macro/permission/service_call.rb'

class Project::Operation::Create < OperationBase
  step Macro::Permission::ServiceCall(action: 'create', model: Project, nested_model: Client)
  fail :forbidden!
  step Model(Project, :new)
  step :assign_current_user!

  step Wrap(::Transaction) {
    step Contract::Build(constant: Project::Contract::Create)
    step Contract::Validate()
    step Contract::Persist()
    fail Macro::Rollback()
  }

  def assign_current_user!(options, **)
    options[:model].user = options[:current_user]
  end

  def forbidden!(options, **)
    permission_error(options, 'Permission Forbidden')
  end
end
