class Project::Input::ClientCreate
  def self.call(options, params:, **)
    client = Client.find_by(id: params[:client][:id])
    { params: { name: params[:client][:name] },
      client: client, options: options }
  end
end
