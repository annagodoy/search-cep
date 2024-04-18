FactoryBot.define do
  factory :user_search, class: UserSearch do
    association :user
    address { 'Av. Paulista - Bela Vista - 01310-300 - São Paulo - SP' }
    street { 'Av. Paulista' }
    neighborhood { 'Bela Vista' }
    zip_code { '01310-300' }
    city { 'São Paulo' }
    state { 'SP' }
  end
end