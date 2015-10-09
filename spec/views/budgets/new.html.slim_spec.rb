require 'rails_helper'

RSpec.describe "budgets/new", type: :view do
  before(:each) do
    assign(:budget, Budget.new(
      :name => "MyString",
      :user_id => 1,
      :category_id => 1,
      :sub_category_id => 1,
      :price => 1,
      :remarks => "MyText"
    ))
  end

  it "renders new budget form" do
    render

    assert_select "form[action=?][method=?]", budgets_path, "post" do

      assert_select "input#budget_name[name=?]", "budget[name]"

      assert_select "input#budget_user_id[name=?]", "budget[user_id]"

      assert_select "input#budget_category_id[name=?]", "budget[category_id]"

      assert_select "input#budget_sub_category_id[name=?]", "budget[sub_category_id]"

      assert_select "input#budget_price[name=?]", "budget[price]"

      assert_select "textarea#budget_remarks[name=?]", "budget[remarks]"
    end
  end
end
