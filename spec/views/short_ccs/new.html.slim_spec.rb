require 'rails_helper'

RSpec.describe "short_ccs/new", type: :view do
  before(:each) do
    assign(:short_cc, ShortCc.new(
      :user_id => 1,
      :category_id => 1,
      :sub_category_id => 1
    ))
  end

  it "renders new short_cc form" do
    render

    assert_select "form[action=?][method=?]", short_ccs_path, "post" do

      assert_select "input#short_cc_user_id[name=?]", "short_cc[user_id]"

      assert_select "input#short_cc_category_id[name=?]", "short_cc[category_id]"

      assert_select "input#short_cc_sub_category_id[name=?]", "short_cc[sub_category_id]"
    end
  end
end
