require 'rails_helper'

RSpec.describe ServiceController, type: :controller do
  let(:valid_session) { {user_id: 1} }
  describe "GET #index" do
    before do
      @record  = create :record, category_id: 1
      @not_user = create :record, category_id: 1, user_id: 2
      get :index, {}, valid_session
    end
    it "assigns @search.result as @records"
    it "assigns ransack records as @search"
    it "assigns wallet as @wallets"
    it "renders the :index record" do
      expect(response).to render_template :index
    end
  end
  describe "GET #create" do
    it "with params[]"
    describe "with valid params" do
      before do
        @shotr_cc = create :short_cc
        @shotr_cp = create :short_cp
      end
      it "creates a new Record" do
        expect {
          get :create, {}, valid_session, short_cc: 1, short_cp: 1
        }.to change(Record, :count).by 1
      end
      it "assigns a newly created record as @record"
    end
    describe "with invalid params"
  end
end
