FactoryGirl.define do

  sequence :email do |n|
    Forgery(:internet).email_address
  end

  sequence :name do |n|
    Forgery(:name).full_name
  end

  sequence :first_name do |n|
    Forgery(:name).first_name
  end

  sequence :last_name do |n|
    Forgery(:name).last_name
  end
end
