require 'rails_helper'

RSpec.describe "sub_categories/index", type: :view do
  before(:each) do
    assign(:sub_categories, [
      SubCategory.create!(
        :name => "Name",
        :category_id => 1,
        :user_id => 2,
        :wallet_id => 3
      ),
      SubCategory.create!(
        :name => "Name",
        :category_id => 1,
        :user_id => 2,
        :wallet_id => 3
      )
    ])
  end

  it "renders a list of sub_categories" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
