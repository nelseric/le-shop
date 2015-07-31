require 'rails_helper'

RSpec.describe Product, type: :model do
  it "has a valid factory" do
    expect(build :product).to be_valid
  end

  it "requires a name" do
    expect(build :product, name: nil).to be_invalid
  end
end
