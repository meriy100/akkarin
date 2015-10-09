require 'rails_helper'

RSpec.describe "colors/new", type: :view do
  before(:each) do
    assign(:color, Color.new(
      :name => "MyString",
      :value => "MyString"
    ))
  end

  it "renders new color form" do
    render

    assert_select "form[action=?][method=?]", colors_path, "post" do

      assert_select "input#color_name[name=?]", "color[name]"

      assert_select "input#color_value[name=?]", "color[value]"
    end
  end
end
