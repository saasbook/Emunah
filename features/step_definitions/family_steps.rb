Given("the following families exist:") do |table|
  table.hashes.each do |family|
    Family.create family
  end
end

When("I delete family {string}") do |string|
  pending
  
  # I've tried this.
  # user = User.find_by_email(string)
  # visit "/user", :delete, :id => user.id

  # I've also tried this.
  # user_path User.find_by_email(string), method => :delete
end

When(/^I select the time (\d+)\-(.*)\-(\d+) from "(.*?)"$/) do |year, month, day, label_text|
  label = page.find('label', text: label_text)
  id = label['for']
  select year,   from: "#{id}_1i"
  select month,  from: "#{id}_2i"
  select day,    from: "#{id}_3i"
end