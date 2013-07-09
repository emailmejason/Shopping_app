require 'spec_helper'

describe User do

  it { should have_many(:reviews)}
  it { should have_many(:items)}

  it "authenticates with a valid email and password" do
    user = FactoryGirl.create(:user)
    expect(user.authenticate("tombombadil")).to eq(user)
  end

  it "will not authenticate an incorrect password" do
    user = FactoryGirl.create(:user)
    expect(user.authenticate("incorrect")).to be_false
  end
end
