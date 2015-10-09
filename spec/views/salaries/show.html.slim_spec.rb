require 'rails_helper'

RSpec.describe "salaries/show", type: :view do
  before(:each) do
    @salary = assign(:salary, Salary.create!(
      :name => "Name",
      :user_id => 1,
      :price => 2,
      :remarkds => "MyText",
      :wallets_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/3/)
  end
end
