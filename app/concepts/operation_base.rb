class OperationBase < Trailblazer::Operation
  def error(options, message)
    options[:errors] = { default_error: message.to_s }
    false
  end

  def auth_error(options, message)
    options[:errors] = { auth_error: message.to_s }
    false
  end

  def permission_error(options, message)
    options[:errors] = { permission_error: message.to_s }
    false
  end

  def not_found_error(options, message)
    options[:errors] = { not_found_error: message.to_s }
    false
  end
end
