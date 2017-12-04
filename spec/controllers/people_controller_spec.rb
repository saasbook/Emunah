require 'rails_helper'

RSpec.describe PeopleController, type: :controller do
	describe "get #DELETE " do
		it "should call destroy" do
			submittal = Person.find(1)
			delete :destroy, params: { :family_id => 1, :id => 1 }
		end
	end
end