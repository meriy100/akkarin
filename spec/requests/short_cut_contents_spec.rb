require 'rails_helper'

RSpec.describe "ShortCutContents", type: :request do
  describe "GET /short_cut_contents" do
    it "works! (now write some real specs)" do
      get short_cut_contents_path
      expect(response).to have_http_status(200)
    end
  end
end
