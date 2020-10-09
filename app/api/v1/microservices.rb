class V1::Microservices < Grape::API
  namespace :microservice do
    namespace :authorization do
      get do
        run!(Permission::Operation::Check, params: params.except(:nested_model, :resource_id),
             nested_model: params[:nested_model], resource_id: params[:resource_id]
             )
      end
    end
  end
end
