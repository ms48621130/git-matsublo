FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 8) }
    after(:build) do |user|
      user.image.attach(io: File.open('app/assets/images/no_image.jpg'), filename: 'test_image.jpg' )
    end
  end
end