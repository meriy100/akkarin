require 'rails_helper'

RSpec.describe "transfers/new", type: :view do
  before(:each) do
    assign(:transfer, Transfer.new(
      :user_id => 1,
      :price => 1,
      :form_wallet_id => 1,
      :to_wallet_id => 1,
      :commission => 1
    ))
  end

  it "renders new transfer form" do
    render

    assert_select "form[action=?][method=?]", transfers_path, "post" do

      assert_select "input#transfer_user_id[name=?]", "transfer[user_id]"

      assert_select "input#transfer_price[name=?]", "transfer[price]"

      assert_select "input#transfer_form_wallet_id[name=?]", "transfer[form_wallet_id]"

      assert_select "input#transfer_to_wallet_id[name=?]", "transfer[to_wallet_id]"

      assert_select "input#transfer_commission[name=?]", "transfer[commission]"
    end
  end
end
