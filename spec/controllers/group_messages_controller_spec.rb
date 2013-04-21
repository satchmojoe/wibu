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

describe GroupMessagesController do

  # This should return the minimal set of attributes required to create a valid
  # GroupMessage. As you add validations to GroupMessage, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # GroupMessagesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all group_messages as @group_messages" do
      group_message = GroupMessage.create! valid_attributes
      get :index, {}, valid_session
      assigns(:group_messages).should eq([group_message])
    end
  end

  describe "GET show" do
    it "assigns the requested group_message as @group_message" do
      group_message = GroupMessage.create! valid_attributes
      get :show, {:id => group_message.to_param}, valid_session
      assigns(:group_message).should eq(group_message)
    end
  end

  describe "GET new" do
    it "assigns a new group_message as @group_message" do
      get :new, {}, valid_session
      assigns(:group_message).should be_a_new(GroupMessage)
    end
  end

  describe "GET edit" do
    it "assigns the requested group_message as @group_message" do
      group_message = GroupMessage.create! valid_attributes
      get :edit, {:id => group_message.to_param}, valid_session
      assigns(:group_message).should eq(group_message)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new GroupMessage" do
        expect {
          post :create, {:group_message => valid_attributes}, valid_session
        }.to change(GroupMessage, :count).by(1)
      end

      it "assigns a newly created group_message as @group_message" do
        post :create, {:group_message => valid_attributes}, valid_session
        assigns(:group_message).should be_a(GroupMessage)
        assigns(:group_message).should be_persisted
      end

      it "redirects to the created group_message" do
        post :create, {:group_message => valid_attributes}, valid_session
        response.should redirect_to(GroupMessage.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved group_message as @group_message" do
        # Trigger the behavior that occurs when invalid params are submitted
        GroupMessage.any_instance.stub(:save).and_return(false)
        post :create, {:group_message => {}}, valid_session
        assigns(:group_message).should be_a_new(GroupMessage)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        GroupMessage.any_instance.stub(:save).and_return(false)
        post :create, {:group_message => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested group_message" do
        group_message = GroupMessage.create! valid_attributes
        # Assuming there are no other group_messages in the database, this
        # specifies that the GroupMessage created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        GroupMessage.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => group_message.to_param, :group_message => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested group_message as @group_message" do
        group_message = GroupMessage.create! valid_attributes
        put :update, {:id => group_message.to_param, :group_message => valid_attributes}, valid_session
        assigns(:group_message).should eq(group_message)
      end

      it "redirects to the group_message" do
        group_message = GroupMessage.create! valid_attributes
        put :update, {:id => group_message.to_param, :group_message => valid_attributes}, valid_session
        response.should redirect_to(group_message)
      end
    end

    describe "with invalid params" do
      it "assigns the group_message as @group_message" do
        group_message = GroupMessage.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        GroupMessage.any_instance.stub(:save).and_return(false)
        put :update, {:id => group_message.to_param, :group_message => {}}, valid_session
        assigns(:group_message).should eq(group_message)
      end

      it "re-renders the 'edit' template" do
        group_message = GroupMessage.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        GroupMessage.any_instance.stub(:save).and_return(false)
        put :update, {:id => group_message.to_param, :group_message => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested group_message" do
      group_message = GroupMessage.create! valid_attributes
      expect {
        delete :destroy, {:id => group_message.to_param}, valid_session
      }.to change(GroupMessage, :count).by(-1)
    end

    it "redirects to the group_messages list" do
      group_message = GroupMessage.create! valid_attributes
      delete :destroy, {:id => group_message.to_param}, valid_session
      response.should redirect_to(group_messages_url)
    end
  end

end