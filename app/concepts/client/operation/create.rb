class Client::Operation::Create < OperationBase
  step Model(Client, :new)
end
