FactoryBot.define do
  factory :post do
    matsuri_name { Faker::Name.name }
    season { [*(1..12)].sample }
    area { JpPrefecture::Prefecture.all.sample.id }
    article { Faker::Books::Dune.quote }
    after(:build) do |post|
      post.image.attach(io: File.open('app/assets/images/no_image.jpg'), filename: 'test_image.jpg' )
    end
  end
end