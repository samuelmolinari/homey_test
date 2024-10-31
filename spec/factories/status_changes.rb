FactoryBot.define do
  factory :status_change do
    user { nil }
    project { nil }
    from_status { "MyString" }
    to_status { "MyString" }
  end
end
