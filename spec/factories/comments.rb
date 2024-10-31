FactoryBot.define do
  factory :comment do
    body { Faker::Lorem.sentence }
    user
    project
  end
end
