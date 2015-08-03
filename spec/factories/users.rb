FactoryGirl.define do
  factory :user, class: "Customer" do
    sequence(:email) { |n| "customer#{n}@example.com" }
    password "123happycustomer"
    password_confirmation "123happycustomer"
  end

  factory :user_with_basket, parent: :user do
    basket_items { build_list :basket_item, 3 }
  end

  factory :customer do
    sequence(:email) { |n| "customer#{n}@example.com" }
    password "123happycustomer"
    password_confirmation "123happycustomer"
  end

  factory :admin do
    sequence(:email) { |n| "admin#{n}@example.com" }
    password "123happyadin"
    password_confirmation "123happyadin"
  end
end
