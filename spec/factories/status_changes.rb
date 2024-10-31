FactoryBot.define do
  factory :status_change do
    user
    project
    from_status { "draft" }
    to_status { "active" }
  end
end
