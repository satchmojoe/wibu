require 'spec_helper'

describe "expertises/new" do
  before(:each) do
    assign(:expertise, stub_model(Expertise,
      :text => "MyString",
      :user_ids => "MyText"
    ).as_new_record)
  end

  it "renders new expertise form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => expertises_path, :method => "post" do
      assert_select "input#expertise_text", :name => "expertise[text]"
      assert_select "textarea#expertise_user_ids", :name => "expertise[user_ids]"
    end
  end
end
