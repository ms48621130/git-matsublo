# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'shimizu@masaki',
  password: 'ms4862'
)


user = User.new(email: "guest@example.com", name: "ゲストユーザー", password: SecureRandom.urlsafe_base64)
user.image.attach(io: File.open(Rails.root.join("app/assets/images/no_image.jpg")), filename: 'no_image.jpg')
user.save!