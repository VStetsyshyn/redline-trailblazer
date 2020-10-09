require 'auth.rb'
require './lib/macro/generate_token.rb'
require './lib/macro/rollback.rb'

class User::Operation::Create < OperationBase
  step Model(User, :new)

  step Rescue(ActiveRecord::RecordNotUnique) {
    step Wrap(::Transaction) {
      step Contract::Build(constant: User::Contract::Create)
      step Contract::Validate()
      step Contract::Persist()
      step Macro::GenerateToken()
      fail Macro::Rollback()
    }
  }
end
