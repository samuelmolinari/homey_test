FactoryBot.define do
  factory :project do
    name { Faker::Name.name }
    status { Project::STATUS.sample }
  end
end
