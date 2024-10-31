FactoryBot.define do
  factory :event do
    project

    trait :status_change do
      trackable { build(:status_change) }
    end

    trait :comment do
      trackable { build(:comment) }
    end
  end
end
