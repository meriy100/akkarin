require 'rails_helper'

RSpec.describe "shot_cps/show", type: :view do
  before(:each) do
    @shot_cp = assign(:shot_cp, ShotCp.create!(
      :short_cc_id => 1,
      :user_id => 2,
      :price => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
