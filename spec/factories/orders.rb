FactoryGirl.define do
  factory :order do
    user
  end

  factory :order_with_items, parent: :order do |_order|
    order_items { build_list :order_item, 3 }
  end
end
