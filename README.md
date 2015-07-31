Create a new rails app that allows a customer to purchase a product.

- use mysql as your data store.
- You don't have to talk to a third party api for the purchase, but you do need to create a form that takes a fake credit card number as a form of payment
- You just need to have a view of all products (no need for product images, just titles)
- You need a view of all purchases (customer name and product, again no images)
- Just use basic styling for the app, no images, but keep things tidy.
- Add anything you feel is necessary to have a fast and safe product store.



There are Products in the store

Products have (name)

Customer can add Products to Basket.

Customer has_many BasketItems

BasketItems belongs_to Product
BasketItems have quantity

Customer has_many Orders

Order has timestamps, payment info
Order has_many LineItems
LineItems belong_to Product, quantity

Order has enum status (Placed, Paid, Shipped)

When a User places an order,
  He adds a product to his basket
  He clicks Check out
  He enters his payment and shipping information
  He clicks Place Order
  A payment transaction is created and the Customer is charged
  The Admin packages and ships the order
  The Admin marks the order as shipped and provides tracking information.



The Admin can view all orders
The Admin can cancel orders that have not been shipped
The Admin can mark an order as shipped
