require 'rails_helper'

RSpec.describe User, type: :model do
	it "should check if user is admin" do
		user = FactoryGirl.create(:user, :role => 'admin')
		expect(user.is_admin?).to eq(true)
	end
end
