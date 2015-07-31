FactoryGirl.define do
  factory :order do
    user nil
stripe_token "MyString"
status 1
  end

end
