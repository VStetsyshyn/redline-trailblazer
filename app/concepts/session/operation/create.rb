class Session::Operation::Create < OperationBase
  step Model(User, :find_by, :email)
  step :user_authenticate
  step Macro::GenerateToken()
  fail :invalid_credentials

  def user_authenticate(options, params:, **)
    options[:model].authenticate(params[:password])
  end

  def invalid_credentials(options, **)
    auth_error(options, 'Invalid Credentials')
  end
end
