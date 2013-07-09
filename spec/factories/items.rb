# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    name "Wolverine Costume"
    price "$10.00"

    factory :sold_item do
      user
    end
  end
end
