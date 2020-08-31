class Permission::Operation::Check < OperationBase
  step :model_check
  step :nested_model_check
  fail :forbidden

  def model_check(options, params:, **)
    Permission.where(params).exists?
  end

  def nested_model_check(options, params:, **)
    if options[:nested_model] && options[:resource_id]
      params[:resource_class] = options[:nested_model]
      params[:action] = 'show'
      Permission.where(params).exists?
    else
      true
    end
  end

  def forbidden(options, **)
    permission_error(options, 'Permission Forbidden')
  end
end
