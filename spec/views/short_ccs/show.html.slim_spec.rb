require 'rails_helper'

RSpec.describe "short_ccs/show", type: :view do
  before(:each) do
    @short_cc = assign(:short_cc, ShortCc.create!(
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
