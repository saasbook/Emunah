require 'rails_helper'

RSpec.describe TasksController, type: :controller do

  describe "GET #index" do
  	it "render index" do
  		get :index, :params => { :user_id => 1}
		expect(response).to render_template(:index)  		
  	end
  end
end