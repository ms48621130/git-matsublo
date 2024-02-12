FactoryBot.define do
  factory :review do
    association :user
    association :post
    title { Faker::Name.name }
    text { Faker::Books::Dune.quote }
    star { [*(1..5)].sample }
  end
end