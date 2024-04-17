if Rails.env === 'production' 
  Rails.application.config.session_store :cookie_store, key: '_search-cep', domain: 'searches'
else
  Rails.application.config.session_store :cookie_store, key: '_search-cep'
end