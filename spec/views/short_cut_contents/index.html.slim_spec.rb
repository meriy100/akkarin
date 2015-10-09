require 'rails_helper'

RSpec.describe "short_cut_contents/index", type: :view do
  before(:each) do
    assign(:short_cut_contents, [
      ShortCutContent.create!(
        :user_id => 1,
        :category_id => 2,
        :sub_category_id => 3
      ),
      ShortCutContent.create!(
        :user_id => 1,
        :category_id => 2,
        :sub_category_id => 3
      )
    ])
  end

  it "renders a list of short_cut_contents" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
