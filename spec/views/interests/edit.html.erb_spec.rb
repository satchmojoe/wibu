require 'spec_helper'

describe "interests/edit" do
  before(:each) do
    @interest = assign(:interest, stub_model(Interest,
      :text => "MyString",
      :user_ids => "MyText"
    ))
  end

  it "renders the edit interest form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => interests_path(@interest), :method => "post" do
      assert_select "input#interest_text", :name => "interest[text]"
      assert_select "textarea#interest_user_ids", :name => "interest[user_ids]"
    end
  end
end
