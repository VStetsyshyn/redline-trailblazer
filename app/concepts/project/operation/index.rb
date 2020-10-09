require './lib/macro/paginate.rb'

class Project::Operation::Index < OperationBase
  step :model!
  step Macro::Paginate()
  fail :projects_not_found!

  def model!(options, params:, **)
    options['model'] = Project
  end

  def projects_not_found!(options, **)
    not_found_error(options, 'Project Not Found')
  end
end
