# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :rsvp do
    user_id 1
    event_id 1
    guest_count 0
    is_attending "invited"
  end
end
