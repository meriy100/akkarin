require 'rails_helper'

RSpec.describe "salaries/edit", type: :view do
  before(:each) do
    @salary = assign(:salary, Salary.create!(
      :name => "MyString",
      :user_id => 1,
      :price => 1,
      :remarkds => "MyText",
      :wallets_id => 1
    ))
  end

  it "renders the edit salary form" do
    render

    assert_select "form[action=?][method=?]", salary_path(@salary), "post" do

      assert_select "input#salary_name[name=?]", "salary[name]"

      assert_select "input#salary_user_id[name=?]", "salary[user_id]"

      assert_select "input#salary_price[name=?]", "salary[price]"

      assert_select "textarea#salary_remarkds[name=?]", "salary[remarkds]"

      assert_select "input#salary_wallets_id[name=?]", "salary[wallets_id]"
    end
  end
end
