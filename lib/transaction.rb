class Transaction
  extend Uber::Callable

  def self.call(_options, **)
    ActiveRecord::Base.transaction { yield }
  end
end
