# frozen_string_literal: true

module Macro
  def self.Paginate
    task = lambda do |(ctx, options), _|
      page = ctx[:params][:page].to_i
      page = 1 if page < 1
      per_page = ctx[:params][:per_page].to_i
      offset = (page - 1) * per_page

      if ctx[:model].has_attribute?(:user_id)
        ctx[:model] = ctx[:model].where(user_id: ctx[:current_user].id).limit(per_page).offset(offset)
      else
        ctx[:model] = ctx[:model].limit(per_page).offset(offset)
      end

      return Trailblazer::Activity::Right, [ctx, options]
    end

    { task: task, id: 'macro.paginate' }
  end
end
