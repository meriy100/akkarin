require 'rails_helper'

RSpec.describe "salaries/index", type: :view do
  before(:each) do
    assign(:salaries, [
      Salary.create!(
        :name => "Name",
        :user_id => 1,
        :price => 2,
        :remarkds => "MyText",
        :wallets_id => 3
      ),
      Salary.create!(
        :name => "Name",
        :user_id => 1,
        :price => 2,
        :remarkds => "MyText",
        :wallets_id => 3
      )
    ])
  end

  it "renders a list of salaries" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
