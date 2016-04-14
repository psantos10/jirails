# spec/factories.rb
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

  # Public Project
  factory :project do
    name "My Super Project"
    description "This is my Super Public Project"
    is_private false
  end

  # Private Project
  factory :private_project, class: Project do
    name "My Private Project"
    description "My Secret Project"
    is_private true
  end

end
