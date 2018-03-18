if apply_grape_api?
  copy_file "app/api/api_base.rb"
  copy_file "app/api/v1/base.rb"
  copy_file "app/api/v1/entities/gift_card_entity.rb"
  copy_file "app/api/v1/gift_cards/endpoints.rb"
  route "mount ApiBase, at: '/api'"
end