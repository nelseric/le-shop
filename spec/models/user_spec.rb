require 'rails_helper'

RSpec.describe User, type: :model do
  it "can't be initialized" do
    expect{User.new}.to raise_error RuntimeError, "Cannot directly instantiate the abstract User class"
  end
end
