require 'rails_helper'

RSpec.describe Admin, type: :model do
  subject {build(:admin)}

  it "has a valid factory" do
    expect(subject).to be_valid
  end

  it "is passes the admin check" do
    expect(subject).to be_admin
  end
end
