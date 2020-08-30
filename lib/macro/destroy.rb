module Macro
  def self.Destroy
    task = lambda do |(ctx, options), _|
      ctx[:model].destroy
      return Trailblazer::Activity::Right, [ctx, options]
    end

    { task: task, id: 'macro.destroy' }
  end
end
