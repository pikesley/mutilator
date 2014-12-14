Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then /^(?:|I )should see '([^\"]*)'/ do |text|
  page.should have_content text
end

Then(/^I should see \/([^\"]*)\/$/) do |regex|
  page.should have_content /#{regex}/
end

Then /^the response should be a text block:$/ do |text|
  page.should have_content(text)
end

Then /^the response should be JSON:$/ do |json|
  JSON.parse(page.body).should == JSON.parse(json)
end

Then /^the JSON response should have a field "(.*?)" with content \/(.*)\/$/ do |field, regex|
  h = JSON.parse(page.body)
  h.has_key? field && h[field].should =~ /#{regex}/

end
