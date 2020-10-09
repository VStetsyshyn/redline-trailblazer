class Project::Operation::Update < OperationBase
  step Macro::Permission::ServiceCall(action: 'update', model: Project, nested_model: Client)
  step Model(Project, :find_by)
  fail :project_not_found!

  step Wrap(::Transaction) {
    step Contract::Build(constant: Project::Contract::Create)
    step Contract::Validate()
    step Contract::Persist()
    fail Macro::Rollback()
  }

  def project_not_found!(options, **)
    not_found_error(options, 'Project Not Found')
  end
end
