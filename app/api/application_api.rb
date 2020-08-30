class ApplicationAPI < Grape::API
  helpers V1::Helpers::Methods, V1::Helpers::Authentication

  prefix 'api'
  format :json
  content_type :jsonapi, 'application/vnd.api+json'
  formatter :json, Grape::Formatter::FastJsonapi
  formatter :jsonapi, Grape::Formatter::FastJsonapi

  version :v1 do
    mount V1::Users
    mount V1::Microservices
  end
end
