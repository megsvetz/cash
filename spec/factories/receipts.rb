FactoryGirl.define do
  factory :receipt do
    name "Smiths"
    date "2015-02-14 11:30:00"
    amount 543.21
    description "Groceries for party."
    member
  end
end
