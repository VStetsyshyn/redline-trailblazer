# frozen_string_literal: true

module Macro
  def self.Rollback
    task = lambda do |*|
      raise ActiveRecord::Rollback
    end

    { task: task, id: 'macro.rollback' }
  end
end
