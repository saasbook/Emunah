require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #index" do
  	it "should redirect to dash path if not logged in" do
  		get :index
		expect(response).to render_template(:index)  		
  	end

  	it "should render index if user is logged in" do 
  		login_admin
  		get :index
  		expect(response).to redirect_to(dash_path)
  	end
  end

  describe "GET #login" do
  	it "should login user with valid parameters" do 
  		params = {email: "fake_seth@gmail.com", password: "abcdef"}
  		post :login, params: {user:params}
  		expect(response).to redirect_to(dash_path)
  	end

  	it "should flash wrong password if incorrect" do
  		params = {email: "fake_seth@gmail.com", password: "aaabababa"}
  		post :login, params: {user:params}
  		expect(response).to redirect_to(home_path)
  		expect(flash[:notice]).to include("Wrong password")
  	end

  	it "should redirect if user can not be found" do
  		params = {email: "really_fake_seth@gmail.com", password: "abcdef"}
  		post :login, params: {user:params}
  		expect(response).to redirect_to(home_path)
  		expect(flash[:notice]).to include("Could not")
  	end
  end

  describe "GET #dash" do
  	it "should render dash if logged in" do
  		login_admin
  		get :dash
  		expect(response).to render_template(:dash)
  	end

  	it "should redirect if not logged in" do
  		session.delete(:user_id)
  		get :dash
  		expect(response).to redirect_to(home_path)
  	end
  end

  describe "GET #logout" do
  	it "should log out and redirect" do
  		login_admin
  		get :logout
  		expect(response).to redirect_to(home_path)
  	end
  end

end
