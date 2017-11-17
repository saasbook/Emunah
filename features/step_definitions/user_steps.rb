Given("the following users exist:") do |table|
  table.hashes.each do |user|
    User.create user
  end
end

When("I delete user {string}") do |string|
  pending
  
  # I've tried this.
  # user = User.find_by_email(string)
  # visit "/user", :delete, :id => user.id

  # I've also tried this.
  # delete_user_path(User.find_by_email(string))
end

When(/^I select "(.*)" from role/) do |role|
  # label = page.find('label', text: "role")
  select(role, :from => "user[role]")
end

When(/^I should see todays date/) do
	today = Date.current.to_formatted_s(:long_ordinal)
	page.should have_content(today)
end