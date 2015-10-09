require 'rails_helper'

RSpec.describe "budgets/index", type: :view do
  before(:each) do
    assign(:budgets, [
      Budget.create!(
        :name => "Name",
        :user_id => 1,
        :category_id => 2,
        :sub_category_id => 3,
        :price => 4,
        :remarks => "MyText"
      ),
      Budget.create!(
        :name => "Name",
        :user_id => 1,
        :category_id => 2,
        :sub_category_id => 3,
        :price => 4,
        :remarks => "MyText"
      )
    ])
  end

  it "renders a list of budgets" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
