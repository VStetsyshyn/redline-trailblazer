class Project::Output::ClientCreate
  def self.call(scoped_ctx, options:, params:, **)
    options[:params][:client] = scoped_ctx[:model]
    { errors: scoped_ctx[:errors] }
  end
end
