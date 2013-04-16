# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    user_name "MyString"
    email "MyString"
    bio "MyString"
    city "MyString"
    state "MyString"
    password_hash "MyString"
    password_salt "MyString"
    tmp_password_hash "MyString"
    interests "MyText"
    expertises "MyText"
    institutions "MyText"
  end
end
