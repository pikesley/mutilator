When /^(?:|I )go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then /^(?:|I )should see '([^\"]*)'/ do |text|
  page.should have_content text
end

Then(/^I should see \/([^\"]*)\/$/) do |regex|
  page.should have_content /#{regex}/
end
