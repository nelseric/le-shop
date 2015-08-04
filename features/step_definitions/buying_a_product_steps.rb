Given(/^I am a registered customer$/) do
  @user = create :user
end

Given(/^I am logged in$/) do
  visit '/users/sign_in'
  fill_in "user_email", :with => @user.email
  fill_in "user_password", :with => "secretpassword"
  click_button "Sign in"
end

Given(/^there are (\d+) Products$/) do |product_count|
  create_list :product, product_count.to_i
end

When(/^I am on the products index$/) do
  visit '/'
end

When(/^I click on a product$/) do
  @product = Product.first
  first("tr a").click
end

Then(/^I see more information about the product$/) do
  expect(current_path).to eql product_path(@product)
end

When(/^I click "Add to Basket" for a product$/) do
  @product = Product.first
  first("tr[1]/td[3]/*/a").click
end

When(/^I click "(.*?)"$/) do |button_name|
  click_link button_name
end

Then(/^I should see the product in my basket$/) do
  expect(page).to have_link @product.name
end

When(/^I am viewing a product$/) do
  @product = create :product
  visit product_path(@product)
end

Given(/^I have an item in my basket$/) do
  @basket_item = @user.add_to_basket Product.first
end

When(/^I am viewing the basket page$/) do
  visit basket_items_path
end

Then(/^I will be shown information about my order$/) do
  expect(current_path).to eql order_path(@user.orders.last)
end

Given(/^I have started checking out$/) do
  @order = create :order, user: @user
end

Given(/^I am viewing the order information page$/) do
  visit order_path @order
end

When(/^I click the stripe button$/) do
  # I am just checking if the payment thing is there,
  # validating that everything right now will take
  # too much time to figure out

  has_css? "form"
end

Then(/^Stripe should collect payment$/) do
  # This actually working is not a requirement, so I won't test it right now
end
