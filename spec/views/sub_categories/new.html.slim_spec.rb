require 'rails_helper'

RSpec.describe "sub_categories/new", type: :view do
  before(:each) do
    assign(:sub_category, SubCategory.new(
      :name => "MyString",
      :category_id => 1,
      :user_id => 1,
      :wallet_id => 1
    ))
  end

  it "renders new sub_category form" do
    render

    assert_select "form[action=?][method=?]", sub_categories_path, "post" do

      assert_select "input#sub_category_name[name=?]", "sub_category[name]"

      assert_select "input#sub_category_category_id[name=?]", "sub_category[category_id]"

      assert_select "input#sub_category_user_id[name=?]", "sub_category[user_id]"

      assert_select "input#sub_category_wallet_id[name=?]", "sub_category[wallet_id]"
    end
  end
end
