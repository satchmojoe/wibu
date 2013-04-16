require 'spec_helper'

describe "institutions/edit" do
  before(:each) do
    @institution = assign(:institution, stub_model(Institution,
      :text => "MyString",
      :user_ids => "MyText"
    ))
  end

  it "renders the edit institution form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => institutions_path(@institution), :method => "post" do
      assert_select "input#institution_text", :name => "institution[text]"
      assert_select "textarea#institution_user_ids", :name => "institution[user_ids]"
    end
  end
end
