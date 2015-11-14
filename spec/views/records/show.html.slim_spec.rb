require 'rails_helper'

RSpec.describe "records/show", type: :view do
  before(:each) do
    @record = assign(:record, Record.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
