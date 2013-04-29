require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe GroupMembershipsController do

  # This should return the minimal set of attributes required to create a valid
  # GroupMembership. As you add validations to GroupMembership, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # GroupMembershipsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all group_memberships as @group_memberships" do
      group_membership = GroupMembership.create! valid_attributes
      get :index, {}, valid_session
      assigns(:group_memberships).should eq([group_membership])
    end
  end

  describe "GET show" do
    it "assigns the requested group_membership as @group_membership" do
      group_membership = GroupMembership.create! valid_attributes
      get :show, {:id => group_membership.to_param}, valid_session
      assigns(:group_membership).should eq(group_membership)
    end
  end

  describe "GET new" do
    it "assigns a new group_membership as @group_membership" do
      get :new, {}, valid_session
      assigns(:group_membership).should be_a_new(GroupMembership)
    end
  end

  describe "GET edit" do
    it "assigns the requested group_membership as @group_membership" do
      group_membership = GroupMembership.create! valid_attributes
      get :edit, {:id => group_membership.to_param}, valid_session
      assigns(:group_membership).should eq(group_membership)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new GroupMembership" do
        expect {
          post :create, {:group_membership => valid_attributes}, valid_session
        }.to change(GroupMembership, :count).by(1)
      end

      it "assigns a newly created group_membership as @group_membership" do
        post :create, {:group_membership => valid_attributes}, valid_session
        assigns(:group_membership).should be_a(GroupMembership)
        assigns(:group_membership).should be_persisted
      end

      it "redirects to the created group_membership" do
        post :create, {:group_membership => valid_attributes}, valid_session
        response.should redirect_to(GroupMembership.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved group_membership as @group_membership" do
        # Trigger the behavior that occurs when invalid params are submitted
        GroupMembership.any_instance.stub(:save).and_return(false)
        post :create, {:group_membership => {}}, valid_session
        assigns(:group_membership).should be_a_new(GroupMembership)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        GroupMembership.any_instance.stub(:save).and_return(false)
        post :create, {:group_membership => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested group_membership" do
        group_membership = GroupMembership.create! valid_attributes
        # Assuming there are no other group_memberships in the database, this
        # specifies that the GroupMembership created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        GroupMembership.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => group_membership.to_param, :group_membership => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested group_membership as @group_membership" do
        group_membership = GroupMembership.create! valid_attributes
        put :update, {:id => group_membership.to_param, :group_membership => valid_attributes}, valid_session
        assigns(:group_membership).should eq(group_membership)
      end

      it "redirects to the group_membership" do
        group_membership = GroupMembership.create! valid_attributes
        put :update, {:id => group_membership.to_param, :group_membership => valid_attributes}, valid_session
        response.should redirect_to(group_membership)
      end
    end

    describe "with invalid params" do
      it "assigns the group_membership as @group_membership" do
        group_membership = GroupMembership.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        GroupMembership.any_instance.stub(:save).and_return(false)
        put :update, {:id => group_membership.to_param, :group_membership => {}}, valid_session
        assigns(:group_membership).should eq(group_membership)
      end

      it "re-renders the 'edit' template" do
        group_membership = GroupMembership.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        GroupMembership.any_instance.stub(:save).and_return(false)
        put :update, {:id => group_membership.to_param, :group_membership => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested group_membership" do
      group_membership = GroupMembership.create! valid_attributes
      expect {
        delete :destroy, {:id => group_membership.to_param}, valid_session
      }.to change(GroupMembership, :count).by(-1)
    end

    it "redirects to the group_memberships list" do
      group_membership = GroupMembership.create! valid_attributes
      delete :destroy, {:id => group_membership.to_param}, valid_session
      response.should redirect_to(group_memberships_url)
    end
  end

end
