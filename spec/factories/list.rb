

FactoryBot.define do
  factory :list do
    title {Faker::Lorem.chracters(number:10)}
    body{Faker::Lorem.characters(number:30)}
  end
end