class Project::Contract::Create < BaseForm
  property :name
  property :client 

  validation do
    schema do
      required(:name).filled(min_size?: 3, max_size?: 80)
    end
  end
end
