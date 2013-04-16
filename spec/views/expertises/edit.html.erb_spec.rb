require 'spec_helper'

describe "expertises/edit" do
  before(:each) do
    @expertise = assign(:expertise, stub_model(Expertise,
      :text => "MyString",
      :user_ids => "MyText"
    ))
  end

  it "renders the edit expertise form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => expertises_path(@expertise), :method => "post" do
      assert_select "input#expertise_text", :name => "expertise[text]"
      assert_select "textarea#expertise_user_ids", :name => "expertise[user_ids]"
    end
  end
end
