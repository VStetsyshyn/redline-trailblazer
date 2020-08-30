class Permission::Contract::Create < BaseForm
  property :action
  property :resource_class
  property :resource_id
  property :user

  validation do
    schema do
      key(:action).required(inclusion?: %w[create show update delete])
    end
  end
end
