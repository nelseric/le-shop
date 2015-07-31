json.array!(@orders) do |order|
  json.extract! order, :id, :user_id, :stripe_token, :status
  json.url order_url(order, format: :json)
end
