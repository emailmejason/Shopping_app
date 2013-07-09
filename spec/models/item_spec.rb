require 'spec_helper'

describe Item do

  it { should belong_to(:user)}
  it { should have_many(:reviews)}

  it "has items available" do
    item = FactoryGirl.create(:item)

    expect(Item.available_items?).to be_true
  end

  it "is sold out" do
    user = FactoryGirl.create(:user)
    item = FactoryGirl.create(:item, {:user_id => user.id})

    expect(Item.available_items?).to be_false
  end

  it "can be purchased" do
    item = FactoryGirl.create(:item)
    expect(item.available?).to be_true
  end

  it "cannot be purchased (if sold out)" do
    item = FactoryGirl.create(:sold_item)

    expect(item.available?).to be_false
  end
end
