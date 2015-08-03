Feature: Buying a product

Background:
  Given I am a registered customer
  And I am logged in
  And there are 100 Products
  

Scenario: I want to view a product
  When I am on the products index
  And I click on a product
  Then I see more information about the product

Scenario: Adding an item to my basket from the products index
  When I am on the products index
  And I click "Add to Basket" for a product
  And I click "Basket"
  Then I should see the product in my basket

Scenario: Adding a product to the custoer's basket
  When I am viewing a product
  And I click "Add to Basket"
  And I click "Basket"
  Then I should see the product in my basket

Scenario: Starting the checkout process
  Given I have an item in my basket
  When I am viewing the basket page
  And I click "Check Out"
  Then I will be shown information about my order

Scenario: I want to pay for my order
  Given I have started checking out
  And I am viewing the order information page
  When I click "Pay with Card"
  Then Stripe should collect payment