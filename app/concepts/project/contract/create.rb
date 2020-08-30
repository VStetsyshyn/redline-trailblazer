class Project::Contract::Create < BaseForm
  property :name

  validation do
    schema do
      required(:name).filled(min_size?: 3, max_size?: 80)
    end
  end

  property :client, populator: lambda { |fragment:, **|
    self.client = Client.find_by(id: fragment[:id])
    client || self.client = Client.new(name: fragment[:name])
  }
end
