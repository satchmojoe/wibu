# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group_message do
    message "MyString"
    group_id 1
  end
end
