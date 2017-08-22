require 'rails_helper'

RSpec.describe "shows/show", type: :view do
  before(:each) do
    @show = assign(:show, Show.create!(
      :name => "Name",
      :season => 2,
      :episode => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
