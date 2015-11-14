require 'rails_helper'

RSpec.describe "records/index", type: :view do
  before(:each) do
    assign(:records, [
      Record.create!(),
      Record.create!()
    ])
  end

  it "renders a list of records" do
    render
  end
end
