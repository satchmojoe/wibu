require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :user_name => "User Name",
        :email => "Email",
        :bio => "Bio",
        :city => "City",
        :state => "State",
        :password_hash => "Password Hash",
        :password_salt => "Password Salt",
        :tmp_password_hash => "Tmp Password Hash",
        :interests => "MyText",
        :expertises => "MyText",
        :institutions => "MyText"
      ),
      stub_model(User,
        :user_name => "User Name",
        :email => "Email",
        :bio => "Bio",
        :city => "City",
        :state => "State",
        :password_hash => "Password Hash",
        :password_salt => "Password Salt",
        :tmp_password_hash => "Tmp Password Hash",
        :interests => "MyText",
        :expertises => "MyText",
        :institutions => "MyText"
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "User Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Bio".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Password Hash".to_s, :count => 2
    assert_select "tr>td", :text => "Password Salt".to_s, :count => 2
    assert_select "tr>td", :text => "Tmp Password Hash".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
