module Macro
  def self.GenerateToken
    task = lambda do |(ctx, options), _|
      options['model.payload'] = {
        user: ctx[:model].id,
        iss: ENV['ISSUER'],
        exp: Time.now.to_i + 4 * 3600
      }

      ctx[:token] = Auth.encode options['model.payload']

      return Trailblazer::Activity::Right, [ctx, options]
    end
    { task: task, id: 'macro.generate_token' }
  end
end
