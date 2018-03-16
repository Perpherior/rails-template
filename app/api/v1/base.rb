class V1::Base < Grape::API
  version ['v1'], using: :accept_version_header

  mount GiftCards::Endpoints
end
