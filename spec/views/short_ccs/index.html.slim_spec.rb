require 'rails_helper'

RSpec.describe "short_ccs/index", type: :view do
  before(:each) do
    assign(:short_ccs, [
      ShortCc.create!(
        :user_id => 1,
        :category_id => 2,
        :sub_category_id => 3
      ),
      ShortCc.create!(
        :user_id => 1,
        :category_id => 2,
        :sub_category_id => 3
      )
    ])
  end

  it "renders a list of short_ccs" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
