FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.last_name }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { '山田' }
    last_name             { '次郎' }
    first_name_kana       { 'ヤマダ' }
    last_name_kana        { 'ジロウ' }
    birthday              { '1998-06-19' }
  end
end
