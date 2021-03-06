require 'rails_helper'

RSpec.describe "expense_items/new", type: :view do
  before(:each) do
    assign(:expense_item, ExpenseItem.new(
      :name => "MyString",
      :user_id => 1,
      :category_id => 1,
      :sub_category_id => 1,
      :price => 1,
      :remarks => "MyText",
      :wallet_id => 1
    ))
  end

  it "renders new expense_item form" do
    render

    assert_select "form[action=?][method=?]", expense_items_path, "post" do

      assert_select "input#expense_item_name[name=?]", "expense_item[name]"

      assert_select "input#expense_item_user_id[name=?]", "expense_item[user_id]"

      assert_select "input#expense_item_category_id[name=?]", "expense_item[category_id]"

      assert_select "input#expense_item_sub_category_id[name=?]", "expense_item[sub_category_id]"

      assert_select "input#expense_item_price[name=?]", "expense_item[price]"

      assert_select "textarea#expense_item_remarks[name=?]", "expense_item[remarks]"

      assert_select "input#expense_item_wallet_id[name=?]", "expense_item[wallet_id]"
    end
  end
end
