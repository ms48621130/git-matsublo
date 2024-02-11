FactoryBot.define do
  factory :review do
    title { Faker::Name.name }
    text { Faker::Books::Dune.quote }
    star { Faker::Name.name }
  end
end