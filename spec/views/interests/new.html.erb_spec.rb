require 'spec_helper'

describe "interests/new" do
  before(:each) do
    assign(:interest, stub_model(Interest,
      :text => "MyString",
      :user_ids => "MyText"
    ).as_new_record)
  end

  it "renders new interest form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => interests_path, :method => "post" do
      assert_select "input#interest_text", :name => "interest[text]"
      assert_select "textarea#interest_user_ids", :name => "interest[user_ids]"
    end
  end
end
