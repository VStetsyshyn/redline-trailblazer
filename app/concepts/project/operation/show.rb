class Project::Operation::Show < OperationBase
  step Macro::Permission::ServiceCall(action: 'show', model: Project)
  fail :forbidden!
  step Model(Project, :find_by, :id)
  fail :project_not_found!

  def forbidden!(options, **)
    permission_error(options, 'Permission Forbidden')
  end

  def project_not_found!(options, **)
    not_found_error(options, 'Project Not Found') unless options[:errors].present?
  end
end
