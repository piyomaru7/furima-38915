FactoryBot.define do
  factory :order_address do
    zip_code         { '123-4567' }
    area_id          { 2 }
    municipality     { '金沢市' }
    street_number    { '田中' }
    building_name    { '金沢ハイツ' }
    telephone_number { '08022002200' }
    token            { 'tok_abcdefghijk00000000000000000' }
  end
end
