require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #index" do
    it "should redirect to /login if user is not logged in" do
      get :index
      expect(response).to redirect_to(home_path)
    end

    it "should redirect to /dashboard if user is not an admin" do
      login(2)
      get :index
      expect(response).to redirect_to(home_path)
    end

    it "should render index if user is logged in as admin" do
      login_admin
      get :index
      expect(response).to render_template(:index)
    end

  end

  describe "GET #create" do
    it "should create create a new user" do
      login_admin
      user_params = FactoryGirl.attributes_for(:user)
      post :create, params: { :user => user_params }
      user = User.find_by_email(user_params[:email])
      expect(flash[:notice]).to eq("Bob Jones was successfully created.")
      expect(response).to redirect_to(new_user_path)
    end

    it "should flash error when unable to create" do
      login_admin
      user_params = FactoryGirl.attributes_for(:user)
      post :create, params: { :user => user_params }
      post :create, params: { :user => user_params }
      expect(flash[:notice]).to include("Could not create user.")
    end
  end

  describe "GET #edit" do
    it "should find user with by id" do
      login_admin
      get :edit, params: {id:1}
      expect(response).to render_template(:edit)
    end
  end

  describe "GET #update" do
    it "should update the user" do
      login_admin
      user = User.find(1)
      put :update, params: {id:1, user: {full_name: "Seth Changed"}}
      expect(flash[:notice]).to eq("Seth Changed was successfully updated.")
      expect(response).to redirect_to(users_path) 
    end
  end

  describe "GET #delete" do
  end

  describe "GET #new" do
  end 

end
