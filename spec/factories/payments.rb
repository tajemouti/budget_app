FactoryBot.define do
  factory :payment do
    sequence(:name) { |n| "Payment #{n}" }
    amount { 100 }
    association :author, factory: :user
  end
end
