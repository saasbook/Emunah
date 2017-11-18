Given("the following submittal exist:") do |table|
  table.hashes.each do |submittal|
    Submittal.create submittal
  end
end