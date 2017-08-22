require 'rails_helper'

RSpec.describe "shows/new", type: :view do
  before(:each) do
    assign(:show, Show.new(
      :name => "MyString",
      :season => 1,
      :episode => 1
    ))
  end

  it "renders new show form" do
    render

    assert_select "form[action=?][method=?]", shows_path, "post" do

      assert_select "input#show_name[name=?]", "show[name]"

      assert_select "input#show_season[name=?]", "show[season]"

      assert_select "input#show_episode[name=?]", "show[episode]"
    end
  end
end
