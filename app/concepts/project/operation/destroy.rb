require './lib/macro/destroy.rb'

class Project::Operation::Destroy < OperationBase
  step Macro::Permission::ServiceCall(action: 'delete', model: Project, nested_model: Client)
  fail :forbidden!
  step Model(Project, :find_by, :id)
  fail :project_not_found!

  step Wrap(::Transaction) {
    step Macro::Destroy()
    fail Macro::Rollback()
  }

  def forbidden!(options, **)
    permission_error(options, 'Permission Forbidden')
  end

  def project_not_found!(options, **)
    not_found_error(options, 'Project Not Found') unless options[:errors].present?
  end
end
