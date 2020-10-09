class ProjectSerializer < BaseSerializer
  attributes :name
  belongs_to :client
end
