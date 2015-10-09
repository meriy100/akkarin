require 'rails_helper'

RSpec.describe "wallets/index", type: :view do
  before(:each) do
    assign(:wallets, [
      Wallet.create!(
        :name => "Name",
        :user_id => 1,
        :price => 2
      ),
      Wallet.create!(
        :name => "Name",
        :user_id => 1,
        :price => 2
      )
    ])
  end

  it "renders a list of wallets" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
