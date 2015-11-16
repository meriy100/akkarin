require 'rails_helper'

RSpec.describe RecordsController, type: :controller do

  let(:valid_session) { {user_id: 1} }

  describe "GET #index" do
    before do
      @record  = create :record, category_id: 1
      @not_user = create :record, category_id: 1, user_id: 2
      get :index, {}, valid_session
    end
    it "assigns user records as @records" do
      expect(assigns(:records)).to match_array([@record])
    end
    it "not assigns not_user records as @records" do
      expect(assigns(:records)).to_not match_array([@record, @not_user])
    end
    it "renders the :index record" do
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    before do
      @record = create :record, category_id: 1
      get :show, {id: @record}, valid_session
    end
    it "assigns the requested record as @record" do
      expect(assigns(:record)).to eq @record
    end
    it "renders the :show template" do
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    before do
      get :new, {}, valid_session
    end
    it "assigns a new record as @record" do
      expect(assigns(:record)).to be_a_new Record
    end
    it "renders the :new template" do
      expect(response).to render_template :new
    end
    it "user_id: 1" do
      expect(assigns(:record).user_id).to eq 1
    end
    it "date: today" do
      expect(assigns(:record).date).to eq Date.today
    end
  end

  describe "GET #edit" do
    before do
      @record = create :record
      get :edit, {id: @record}, valid_session
    end
    it "assigns the requested record as @record" do
      expect(assigns(:record)).to eq @record
    end
    it "renders the :edit template" do
      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    before do
      @records = [
        attributes_for(:record, category_id: 1),
        attributes_for(:record, category_id: 1),
        attributes_for(:record, category_id: 1)
      ]
    end
    context "with valid params" do
      it "creates a new Record" do
        expect {
          post :create, {record: attributes_for(:record, records_attrigutes: @records)}, valid_session
        }.to change(Record, :count).by(1)
      end

      it "assigns a newly created record as @record" do
        post :create, {record: attributes_for(:record, records_attrigutes: @records)}, valid_session
        expect(assigns(:record)).to be_a Record
        expect(assigns(:record)).to be_persisted
      end

      it "redirects to the created record" do
        post :create, {record: attributes_for(:record, records_attrigutes: @records)}, valid_session
        expect(response).to redirect_to record_path(assigns[:record])
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved record as @record" do
        post :create, {record: attributes_for(:invalid_record)}, valid_session
        expect(assigns(:record)).to be_a_new Record
      end

      it "re-renders the 'new' template" do
        post :create, {record: attributes_for(:invalid_record)}, valid_session
        expect(response).to render_template :new
      end
    end
  end

  describe "PUT #update" do
    before do
      @record = create :record
    end
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "assigns the requested record as @record" do
        put :update, {id: @record, record: attributes_for(:record)}, valid_session
        expect(assigns(:record)).to eq @record
      end

      it "changes @record's attributes" do
        put :update, {id: @record, record: attributes_for(:record, price: 2000)}, valid_session
        @record.reload
        expect(@record.price).to eq 2000
      end

      it "redirects to the record" do
        put :update, {id: @record, record: attributes_for(:record)}, valid_session
        expect(response).to redirect_to @record
      end
      describe "wallet.price" do
        describe "payment" do
          before do
            @record = create :type_payment
            @before_from = @record.from_wallet.price
            @before_to = @record.to_wallet.price
            @price = @record.price
            put :update, {id: @record, record: attributes_for(:record, price: 2000)}, valid_session
            @record.reload
          end
          it "from_wallet.price is changed" do
            expect(@record.from_wallet.price).to eq(@before_from + @price - @record.price)
          end
          it "to_wallet.price isn't changed" do
            expect(@record.to_wallet.price).to eq @before_to
          end
        end
      end
    end

    context "with invalid params" do
      before do
        put :update, {id: @record, record: attributes_for(:invalid_record)}, valid_session
      end
      it "assigns the record as @record" do
        expect(assigns(:record)).to eq @record
      end

      it "re-renders the 'edit' template" do
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    before do
      @render = create :type_transfer
    end
    it "destroys the requested record" do
      expect {
        delete :destroy, {id: @render}, valid_session
      }.to change(Record, :count).by(-1)
    end

    it "redirects to the records list" do
      delete :destroy, {id: @render}, valid_session
      expect(response).to redirect_to records_url
    end
    describe "wallet.price" do
      describe "transfer" do
        before do
          @before_from = @render.from_wallet
          @before_to = @render.to_wallet
          @price = @render.price
          @commission = @render.commission
          @from_id = @render.from_wallet_id
          @to_id = @render.to_wallet_id
          delete :destroy, {id: @render}, valid_session
        end
        it "from wallet price is changed" do
          expect(Wallet.find(@from_id).price).to eq(@before_from.price + @price + @commission)
        end
        it "to wallet price is changed" do
          expect(Wallet.find(@to_id).price).to eq(@before_to.price - @price)
        end
      end
    end
  end
end
