require 'rails_helper'

RSpec.describe "shot_cps/new", type: :view do
  before(:each) do
    assign(:shot_cp, ShotCp.new(
      :short_cc_id => 1,
      :user_id => 1,
      :price => 1
    ))
  end

  it "renders new shot_cp form" do
    render

    assert_select "form[action=?][method=?]", shot_cps_path, "post" do

      assert_select "input#shot_cp_short_cc_id[name=?]", "shot_cp[short_cc_id]"

      assert_select "input#shot_cp_user_id[name=?]", "shot_cp[user_id]"

      assert_select "input#shot_cp_price[name=?]", "shot_cp[price]"
    end
  end
end
