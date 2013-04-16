require 'spec_helper'

describe "users/edit" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :user_name => "MyString",
      :email => "MyString",
      :bio => "MyString",
      :city => "MyString",
      :state => "MyString",
      :password_hash => "MyString",
      :password_salt => "MyString",
      :tmp_password_hash => "MyString",
      :interests => "MyText",
      :expertises => "MyText",
      :institutions => "MyText"
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path(@user), :method => "post" do
      assert_select "input#user_user_name", :name => "user[user_name]"
      assert_select "input#user_email", :name => "user[email]"
      assert_select "input#user_bio", :name => "user[bio]"
      assert_select "input#user_city", :name => "user[city]"
      assert_select "input#user_state", :name => "user[state]"
      assert_select "input#user_password_hash", :name => "user[password_hash]"
      assert_select "input#user_password_salt", :name => "user[password_salt]"
      assert_select "input#user_tmp_password_hash", :name => "user[tmp_password_hash]"
      assert_select "textarea#user_interests", :name => "user[interests]"
      assert_select "textarea#user_expertises", :name => "user[expertises]"
      assert_select "textarea#user_institutions", :name => "user[institutions]"
    end
  end
end
