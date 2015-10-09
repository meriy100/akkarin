require 'rails_helper'

RSpec.describe "wallets/new", type: :view do
  before(:each) do
    assign(:wallet, Wallet.new(
      :name => "MyString",
      :user_id => 1,
      :price => 1
    ))
  end

  it "renders new wallet form" do
    render

    assert_select "form[action=?][method=?]", wallets_path, "post" do

      assert_select "input#wallet_name[name=?]", "wallet[name]"

      assert_select "input#wallet_user_id[name=?]", "wallet[user_id]"

      assert_select "input#wallet_price[name=?]", "wallet[price]"
    end
  end
end
