module Macro
  module Permission
    def self.ServiceCall(model:, action:, nested_model: nil)
      task = lambda do |(ctx, options), _|
        options.merge!({ action: action, resource_class: model, nested_model: nested_model })

        nested_model_id = ctx[:params].values.find { |el| el.is_a? Hash } &.dig(:id)
        resource_id = ctx[:params][:id] || nested_model_id

        options[:resource_id] = resource_id if resource_id.present?
        options[:user_id] = ctx[:current_user].id

        ctx[:uri] = URI("#{ENV['AUTHORIZE_API_PATH']}?#{options.to_query}")

        response = Net::HTTP.get_response(ctx[:uri])

        if response.code == '200'
          return Trailblazer::Activity::Right, [ctx, options]
        else
          return Trailblazer::Activity::Left, [ctx, options]
        end
      end

      { task: task, id: 'macro.permission' }
    end
  end
end
