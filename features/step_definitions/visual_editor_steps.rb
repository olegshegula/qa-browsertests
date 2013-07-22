Given(/^I am at my user page$/) do
  visit(VisualEditorPage)
end

Given(/^I am not logged in$/) do
  # user is logged out by default, nothing to do here
end

When(/^I click Review and Save$/) do
  on(VisualEditorPage) do |page|
    page.container_disabled_element.when_not_visible.should_not exist
    page.review_and_save_element.when_visible.click
  end
end

When(/^I click Looks good to me$/) do
  on(VisualEditorPage) do |page|
    page.diff_view_element.when_visible.should be_visible
    page.looks_good_element.click
  end
end

When(/^I click This is a minor edit$/) do
  on(VisualEditorPage).minor_edit_element.when_present.click
end

When(/^I click Save page$/) do
  on(VisualEditorPage) do |page|
    sleep 2 # blame Chris for this!
    page.save_page_element.when_present.click
  end
end

When(/^I click Save page the second time$/) do
    on(VisualEditorPage).second_save_page_element.when_present.click
end

When(/^I edit the page with a string$/) do
  on(VisualEditorPage) do |page|
    page.edit_ve
    page.content_element.when_visible.send_keys("Editing with #{@does_not_exist_page_name}")
  end
end

When(/^I click Return to save form$/) do
  on(VisualEditorPage) do |page|
    page.diff_view_element.when_present
    page.return_to_save_element.when_present.click
  end
end

When(/^I click Review your changes$/) do
  on(VisualEditorPage).review_changes_element.when_present.click
end

When(/^I edit the description of the change$/) do
  on(VisualEditorPage).describe_change_element.when_visible.send_keys("Describing with #{@does_not_exist_page_name}")
end

Then(/^Edit Source page should open$/) do
  @browser.url.should match /&action=edit/
  @browser.url.should_not match /\?veaction=edit/
end

Then(/^Page text should contain the string$/) do
  on(VisualEditorPage).page_text_element.when_present.text.should match Regexp.escape("Editing with #{@does_not_exist_page_name}")
end

Then(/^textbox with source text appears$/) do
  on(EditPage).article_text_element.should exist
end

Then(/^Visual Editor page should open$/) do
  @browser.url.should match /\?veaction=edit/
  @browser.url.should_not match /&action=edit/
end

Then(/^Visual Editor toolbar should appear$/) do
  on(VisualEditorPage).visual_editor_toolbar_element.when_present.should be_visible
end
