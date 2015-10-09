require 'rails_helper'

RSpec.describe "short_cut_contents/edit", type: :view do
  before(:each) do
    @short_cut_content = assign(:short_cut_content, ShortCutContent.create!(
      :user_id => 1,
      :category_id => 1,
      :sub_category_id => 1
    ))
  end

  it "renders the edit short_cut_content form" do
    render

    assert_select "form[action=?][method=?]", short_cut_content_path(@short_cut_content), "post" do

      assert_select "input#short_cut_content_user_id[name=?]", "short_cut_content[user_id]"

      assert_select "input#short_cut_content_category_id[name=?]", "short_cut_content[category_id]"

      assert_select "input#short_cut_content_sub_category_id[name=?]", "short_cut_content[sub_category_id]"
    end
  end
end
