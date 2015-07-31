require 'rails_helper'

RSpec.describe BasketItem, type: :model do
  
  it "has a valid factory" do
    expect(build :basket_item).to be_valid
  end

end
