if Rails.env === 'production' 
  Rails.application.config.session_store :cookie_store, key: '__search-cep', domain: 'searches'
else
  Rails.application.config.session_store :cookie_store, key: '__search-cep'
end