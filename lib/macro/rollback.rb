# frozen_string_literal: true

module Macro
  def self.Rollback
    task = lambda do |(ctx, _options), _|
      ctx[:params][:errors] = ctx[:errors][:default] if ctx[:errors].present?
      raise ActiveRecord::Rollback
    end
    { task: task, id: 'macro.rollback' }
  end
end
