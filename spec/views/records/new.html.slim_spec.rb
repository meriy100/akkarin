require 'rails_helper'

RSpec.describe "records/new", type: :view do
  before(:each) do
    assign(:record, Record.new())
  end

  it "renders new record form" do
    render

    assert_select "form[action=?][method=?]", records_path, "post" do
    end
  end
end
