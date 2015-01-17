# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :membership_role do
    membership_id 1
    role "member"
  end
end
