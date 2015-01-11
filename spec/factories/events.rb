# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    group_id 1
    name "MyString"
    description "MyText"
    location "MyString"
    starts_at "2015-01-11 11:21:51"
    ends_at "2015-01-11 11:21:51"
  end
end
