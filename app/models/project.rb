class Project < ApplicationRecord
  belongs_to :client
  belongs_to :user

  STATUSES = %w[start end].freeze
  enum status: STATUSES
end
