FactoryGirl.define do
  factory :member do
    name "Sarah"
    family
  end

  factory :member_with_receipts, :parent => :member do |member|
    receipts {build_list(:receipt, 3)}
  end
end
