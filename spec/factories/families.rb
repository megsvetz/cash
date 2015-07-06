FactoryGirl.define do
  factory :family do
    username "Thompson"
    password_digest "password"
  end
  
  factory :family_with_members, :parent => :family do |family|
    members {build_list(:member, 3)}
  end
end
