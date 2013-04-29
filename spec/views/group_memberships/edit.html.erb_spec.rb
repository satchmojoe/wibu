require 'spec_helper'

describe "group_memberships/edit" do
  before(:each) do
    @group_membership = assign(:group_membership, stub_model(GroupMembership,
      :user_id => 1,
      :group_id => 1
    ))
  end

  it "renders the edit group_membership form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => group_memberships_path(@group_membership), :method => "post" do
      assert_select "input#group_membership_user_id", :name => "group_membership[user_id]"
      assert_select "input#group_membership_group_id", :name => "group_membership[group_id]"
    end
  end
end
