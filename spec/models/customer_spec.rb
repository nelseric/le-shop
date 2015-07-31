require 'rails_helper'

RSpec.describe Customer, type: :model do
  subject {build(:customer)}

  it "has a valid factory" do
    expect(subject).to be_valid
  end

  it "is does pass the admin check" do
    expect(subject).to_not be_admin
  end
end
