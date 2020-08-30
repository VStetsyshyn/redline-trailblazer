class Session::Operation::Current < OperationBase
  step :get_header_token
  step :decode_token
  step :check_token_payload
  step :find_user
  fail :invalid_token

  def get_header_token(options, **)
    options[:token].present?
  end

  def decode_token(options, **)
    options[:payload] = Auth.decode(options[:token])
    options[:payload].present?
  end

  def check_token_payload(options, **)
    options[:payload].key?(ENV['PAYLOAD_USER_KEY'])
  end

  def find_user(options, **)
    options[:user] = User.find(options[:payload][ENV['PAYLOAD_USER_KEY']])
  end

  def invalid_token(options, **)
    auth_error(options, 'Invalid auth token')
  end
end
