class Client::Operation::Create < OperationBase
  step Model(Client, :new)
  step :setup_model!
  step :setup_params
  step Contract::Build(constant: Client::Contract::Create)
  step Contract::Validate()
  step Contract::Persist()
  fail :contract_error!

  def setup_model!(options, model:, client:, **)
    client.nil? ? true : options[:model] = client
  end

  def setup_params(options, params:, model:, **)
    params[:name] ||= model.name
  end

  def contract_error!(options, **)
    error(options, options['contract.default'].errors.messages)
  end
end
