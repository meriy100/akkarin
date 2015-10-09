require 'rails_helper'

RSpec.describe "categories/edit", type: :view do
  before(:each) do
    @category = assign(:category, Category.create!(
      :name => "MyString",
      :color_id => 1,
      :user_id => 1,
      :wallet_id => 1
    ))
  end

  it "renders the edit category form" do
    render

    assert_select "form[action=?][method=?]", category_path(@category), "post" do

      assert_select "input#category_name[name=?]", "category[name]"

      assert_select "input#category_color_id[name=?]", "category[color_id]"

      assert_select "input#category_user_id[name=?]", "category[user_id]"

      assert_select "input#category_wallet_id[name=?]", "category[wallet_id]"
    end
  end
end
