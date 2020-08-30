class Permission < ApplicationRecord
  belongs_to :user

  RESOURCE_CLASSES = %w[Project Client].freeze
  enum resource_class: RESOURCE_CLASSES
end
