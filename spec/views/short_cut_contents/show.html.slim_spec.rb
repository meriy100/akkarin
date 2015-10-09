require 'rails_helper'

RSpec.describe "short_cut_contents/show", type: :view do
  before(:each) do
    @short_cut_content = assign(:short_cut_content, ShortCutContent.create!(
      :user_id => 1,
      :category_id => 2,
      :sub_category_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
