require 'rails_helper'

RSpec.describe "transfers/index", type: :view do
  before(:each) do
    assign(:transfers, [
      Transfer.create!(
        :user_id => 1,
        :price => 2,
        :form_wallet_id => 3,
        :to_wallet_id => 4,
        :commission => 5
      ),
      Transfer.create!(
        :user_id => 1,
        :price => 2,
        :form_wallet_id => 3,
        :to_wallet_id => 4,
        :commission => 5
      )
    ])
  end

  it "renders a list of transfers" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
  end
end
