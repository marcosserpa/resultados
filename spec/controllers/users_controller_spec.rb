require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all users as @users" do
      user = User.create! valid_attributes

      get :index, {}, valid_session
      expect(assigns(:users)).to eq([user])
    end
  end

  describe "GET #show" do
    it "assigns the requested user as @user" do
      user = User.create! valid_attributes
      get :show, {:id => user.to_param}, valid_session
      expect(assigns(:user)).to eq(user)
    end
  end
end
