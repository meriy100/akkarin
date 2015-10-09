require 'rails_helper'

RSpec.describe "shot_cps/index", type: :view do
  before(:each) do
    assign(:shot_cps, [
      ShotCp.create!(
        :short_cc_id => 1,
        :user_id => 2,
        :price => 3
      ),
      ShotCp.create!(
        :short_cc_id => 1,
        :user_id => 2,
        :price => 3
      )
    ])
  end

  it "renders a list of shot_cps" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
