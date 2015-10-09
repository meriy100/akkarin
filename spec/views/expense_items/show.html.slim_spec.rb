require 'rails_helper'

RSpec.describe "expense_items/show", type: :view do
  before(:each) do
    @expense_item = assign(:expense_item, ExpenseItem.create!(
      :name => "Name",
      :user_id => 1,
      :category_id => 2,
      :sub_category_id => 3,
      :price => 4,
      :remarks => "MyText",
      :wallet_id => 5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/5/)
  end
end
