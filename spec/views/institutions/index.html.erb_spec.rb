require 'spec_helper'

describe "institutions/index" do
  before(:each) do
    assign(:institutions, [
      stub_model(Institution,
        :text => "Text",
        :user_ids => "MyText"
      ),
      stub_model(Institution,
        :text => "Text",
        :user_ids => "MyText"
      )
    ])
  end

  it "renders a list of institutions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Text".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
