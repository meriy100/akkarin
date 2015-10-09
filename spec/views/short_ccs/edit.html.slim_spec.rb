require 'rails_helper'

RSpec.describe "short_ccs/edit", type: :view do
  before(:each) do
    @short_cc = assign(:short_cc, ShortCc.create!(
      :user_id => 1,
      :category_id => 1,
      :sub_category_id => 1
    ))
  end

  it "renders the edit short_cc form" do
    render

    assert_select "form[action=?][method=?]", short_cc_path(@short_cc), "post" do

      assert_select "input#short_cc_user_id[name=?]", "short_cc[user_id]"

      assert_select "input#short_cc_category_id[name=?]", "short_cc[category_id]"

      assert_select "input#short_cc_sub_category_id[name=?]", "short_cc[sub_category_id]"
    end
  end
end
