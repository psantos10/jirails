FactoryGirl.define do
  # Normal user
  factory :user do
    name "Jane Doe"
    email "jane.doe@jirails.com"
    password "secure456"
    is_admin false
  end

  # Admin user
  factory :admin_user, class: User do
    name "John Doe"
    email "john.doe@jirails.com"
    password "secure123"
    is_admin true
  end
end
