class Client::Operation::Show < OperationBase
  step Model(Client, :find_by)
  fail :client_not_found!

  def client_not_found!(options, **)
    not_found_error(options, 'Client Not Found')
  end
end
