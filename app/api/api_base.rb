class ApiBase < Grape::API
  CURRENT_VERSION = 'v1'.freeze

  format :json

  mount V1::Base

  route :any, '*path' do
    error!("No such route '#{request.path}'", 404)
  end
end
