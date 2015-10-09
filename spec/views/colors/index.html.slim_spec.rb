require 'rails_helper'

RSpec.describe "colors/index", type: :view do
  before(:each) do
    assign(:colors, [
      Color.create!(
        :name => "Name",
        :value => "Value"
      ),
      Color.create!(
        :name => "Name",
        :value => "Value"
      )
    ])
  end

  it "renders a list of colors" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Value".to_s, :count => 2
  end
end
