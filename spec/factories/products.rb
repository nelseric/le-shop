FactoryGirl.define do
  factory :product do
    sequence(:name) { |n| "Product #{n}" }
    price 30.00
  end
end
