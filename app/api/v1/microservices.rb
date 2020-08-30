class V1::Microservices < Grape::API
  namespace :microservice do
    namespace :authorization do
      get do
        run!(Permission::Operation::Check, params: params.except(:nested_model), nested_model: params[:nested_model])
      end
    end
  end
end
