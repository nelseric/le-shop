FactoryGirl.define do
  factory :user, class: "Customer" do
    sequence(:email) { |n| "customer#{n}@example.com" }
    password "secretpassword"
    password_confirmation "secretpassword"
  end

  factory :user_with_basket, parent: :user do
    basket_items { build_list :basket_item, 3 }
  end

  factory :customer do
    sequence(:email) { |n| "customer#{n}@example.com" }
    password "secretpassword"
    password_confirmation "secretpassword"
  end

  factory :admin do
    sequence(:email) { |n| "admin#{n}@example.com" }
    password "secretpassword"
    password_confirmation "secretpassword"
  end
end
