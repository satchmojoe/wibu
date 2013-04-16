require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/User Name/)
    rendered.should match(/Email/)
    rendered.should match(/Bio/)
    rendered.should match(/City/)
    rendered.should match(/State/)
    rendered.should match(/Password Hash/)
    rendered.should match(/Password Salt/)
    rendered.should match(/Tmp Password Hash/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
  end
end
