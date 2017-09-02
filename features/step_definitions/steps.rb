require 'cucumber/rails'
require 'uri'
require 'cgi'
require 'factory_girl'

Tmdb::Api.key("cc4b67c52acb514bdf4931f7cedfd12b")

module NavigationHelpers

    def path_to(page_name)
        case page_name

        when /^the home\s?page$/
          '/'
        else
            begin
                page_name =~ /^the (.*) page$/
                path_components = $1.split(/\s+/)
                self.send(path_components.push('path').join('_').to_sym)
            rescue NoMethodError, ArgumentError
                raise "Can't find mapping from \"#{page_name}\" to a path.\n"
            end
        end
    end
end
World(NavigationHelpers)

Given (/^(?:|I )am on (.+)$/) do |page_name|
    visit path_to(page_name)
end

Then (/^(?:|I )should see "([^"]*)"$/) do |text|
    if page.respond_to? :should
        page.should have_content(text)
    else
        assert page.has_content?(text)
    end
end

Then (/^(?:|I )should be on (.+)$/) do |page_name|
  visit path_to(page_name)
end

When (/^(?:|I )fill in "([^"]*)" with "([^"]*)"$/) do |field, value|
  fill_in(field, with: value)
end

Given (/I've filled in "([^"]*)" with "([^"]*)"$/) do |field, value|
  fill_in(field, with: value)
end

When (/^(?:|I )press "([^"]*)"$/) do |button|
  click_button(button)
end

Given(/^I've clicked "([^"]*)"$/) do |arg1|
  click_button(button)
end

When (/^(?:|I )follow "([^"]*)"$/) do |link|
  click_link(link)
end

Given(/^I've followed "([^"]*)"$/) do |arg1|
  click_link(link)
end

Given(/^the show "([^"]*)" exists$/) do |name|
  FactoryGirl.create(:show, name: name)
end

Then(/^show me the page$/) do
  save_and_open_page
end