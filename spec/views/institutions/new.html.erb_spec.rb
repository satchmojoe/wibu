require 'spec_helper'

describe "institutions/new" do
  before(:each) do
    assign(:institution, stub_model(Institution,
      :text => "MyString",
      :user_ids => "MyText"
    ).as_new_record)
  end

  it "renders new institution form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => institutions_path, :method => "post" do
      assert_select "input#institution_text", :name => "institution[text]"
      assert_select "textarea#institution_user_ids", :name => "institution[user_ids]"
    end
  end
end
