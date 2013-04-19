# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    name "MyString"
    description "MyString"
    project_id 1
    deadline "2013-04-19"
    status "MyString"
    user_id 1
  end
end
