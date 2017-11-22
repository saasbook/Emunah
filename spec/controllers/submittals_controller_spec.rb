require 'rails_helper'

RSpec.describe SubmittalsController, type: :controller do

	describe "GET #index" do
		it "should load submittals" do
			submittal = Submittal.find(1)
			get :show, params: { :id => 1, :family_id => 1}
			expect(response).to render_template(:show)
		end
	end

	describe "GET #edit" do
		it "should render edit page" do
			get :edit, params: {:id => 1, :family_id => 1}
			expect(response).to render_template(:edit)
		end
	end

	describe "GET #index" do
		it "should render index page" do
			get :index, params: {:family_id => 1}
			expect(response).to render_template(:index)
		end
	end

	describe "GET #new" do 
		it "should render new page" do
			get :new, params: {:family_id => 1}
			expect(response).to render_template(:new)
		end
	end

	describe "POST #create" do
		it "should flash success" do
			submittal_params = FactoryGirl.attributes_for(:submittal)
			post :create, params: { :submittal => submittal_params, :family_id => 1}
			expect(flash[:success]).to include("Submittal successfully created for")
		end

		it "should redirect if invalid" do
			post :create, params: { :submittal => {:title => "bleh", :notes => ""}, :family_id => 1 }
			expect(response).to redirect_to	new_family_submittal_path(1)
		end
	end

	describe "GET #delete" do 
		it "should call destroy" do
			submittal = Submittal.find_by_id_and_family_id(1,1)
			expect(submittal).not_to be_nil 
			delete :destroy, params: {:id => 1, :family_id => 1}
			submittal = Submittal.find_by_id_and_family_id(1,1)
			expect(submittal).to be_nil
		end
	end

	# describe "GET #approve" do
	# 	it "should flash on success" do
	# 		login_admin
	# 		submittal_params = FactoryGirl.attributes_for(:submittal)
	# 		byebug
	# 		get :approve, params: { :family_id => 1, :submittal => submittal_params }
	# 		expect(flash[:success]).to include("Submittal was successfully approved.")
	# 	end

	# 	it "should flash on error" do 
	# 		submittal_params = FactoryGirl.attributes_for(:submittal)
	# 		get :approve, params: { :submittal => submittal_params, :family_id => 1 }
	# 		expect(flash[:success]).to include("Unauthorized")	
	# 	end
	# end

	# describe "GET #revoke" do
	# end

end

