require 'rails_helper'

RSpec.describe "categories/new", type: :view do
  before(:each) do
    assign(:category, Category.new(
      :name => "MyString",
      :color_id => 1,
      :user_id => 1,
      :wallet_id => 1
    ))
  end

  it "renders new category form" do
    render

    assert_select "form[action=?][method=?]", categories_path, "post" do

      assert_select "input#category_name[name=?]", "category[name]"

      assert_select "input#category_color_id[name=?]", "category[color_id]"

      assert_select "input#category_user_id[name=?]", "category[user_id]"

      assert_select "input#category_wallet_id[name=?]", "category[wallet_id]"
    end
  end
end
