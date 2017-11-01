Given("the following families exist:") do |table|
  table.hashes.each do |family|
    Family.create family
  end
end