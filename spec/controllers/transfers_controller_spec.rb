require "rails_helper"
# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe TransfersController, type: :controller do

  render_views

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TransfersController. Be sure to keep this updated too.
  let(:valid_session) { {user_id: 1} }

  describe "GET #index" do
    it "render template index" do
      get :index, {}, valid_session
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    before do
      @transfer = create(:transfer)
      get :show, {id: @transfer}, valid_session
    end
    it "assigns the requested contact to @transfer" do
      expect(assigns(:transfer)).to eq @transfer
    end
    # :show テンプレートを表示すること
    it "renders the :show template" do
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    before do
      get :new, {}, valid_session
    end
    it "assigns a new transfer as @transfer" do
      expect(assigns(:transfer)).to be_a_new Transfer
    end
    it "Transfer user_id: 1?" do
      expect(assigns(:transfer).user_id).to eq 1
    end
  end

  describe "GET #edit" do
    before do
      @transfer = create(:transfer)
      get :edit, {id: @transfer}, valid_session
    end
    it "assigns the requested transfer as @transfer" do
      expect(assigns(:transfer)).to eq @transfer
    end
  end

  describe "POST #create" do
    before do
      @transfers = [
        attributes_for(:transfer),
        attributes_for(:transfer),
        attributes_for(:transfer)
      ]
    end
    context "with valid params" do
      it "creates a new Transfer" do
        expect {
          post :create, {transfer: attributes_for(:transfer, transfers_attributes: @transfers)}, valid_session
        }.to change(Transfer, :count).by(1)
      end

      it "assigns a newly created transfer as @transfer" do
        post :create, {transfer: attributes_for(:transfer, transfers_attributes: @transfers)}, valid_session
        expect(assigns(:transfer)).to be_a(Transfer)
        expect(assigns(:transfer)).to be_persisted
      end

      it "redirects to the created transfer" do
        post :create, {transfer: attributes_for(:transfer, transfers_attirbutes: @transfers)}, valid_session
        expect(response).to redirect_to transfer_path(assigns[:transfer])
      end
    end

    context "with invalid params" do
      it "does not save the new transfer in the database" do
        expect{
          post :create, {transfer: attributes_for(:invalid_transfer)}, valid_session
        }.not_to change(Transfer, :count)
      end

      it "re-renders the 'new' template" do
        post :create, {transfer: attributes_for(:invalid_transfer)}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    before do
      @transfer = create(:transfer, price: 2000 )
    end
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "正しい @transfer か" do
        patch :update, {id: @transfer, transfer: attributes_for(:transfer)}, valid_session
        expect(assigns(:transfer)).to eq @transfer
      end

      # @transfer の属性を変更すること
      it "changes @transfer's attributes" do
        patch :update, {id: @transfer, transfer: attributes_for(:transfer, price: '2000')}, valid_session
        @transfer.reload
        expect(@transfer.price).to eq 2000
      end

      # reset from wallet and update wallet
      it "reset from wallet and update from wallet" do
        from_price = @transfer.from_wallet.price
        before_price = @transfer.price
        patch :update, {id: @transfer, transfer: attributes_for(:transfer, price: '2000')}, valid_session
        @transfer.reload
        expect(@transfer.from_wallet.price).to eq(from_price + before_price - @transfer.price)
      end

      # reset to wallet and update wallet
      it "reset to wallet and update to wallet" do
        to_price = @transfer.to_wallet.price
        before_price = @transfer.price
        patch :update, {id: @transfer, transfer: attributes_for(:transfer, price: '2000')}, valid_session
        @transfer.reload
        expect(@transfer.to_wallet.price).to eq(to_price - before_price + @transfer.price)
      end
    end
    context "with invalid attirbutes" do
      #値を変更しない
      it "does not change the transfer's attibutes" do
        patch :update, {id: @transfer, transfer: attributes_for(:transfer, price: 3000, date: nil)}, valid_session
        @transfer.reload
        expect(@transfer.price).not_to eq 3000
        expect(@transfer.date).to eq Date.new(2010, 01, 21)
      end
      it "re-renders the edit template" do
        patch :update, {id: @transfer, transfer: attributes_for(:invalid_transfer)}, valid_session
        expect(response).to render_template :edit
      end
      describe "non update" do
        before do
          @before_from = @transfer.from_wallet
          @before_to = @transfer.to_wallet
          patch :update, {id: @transfer, transfer: attributes_for(:transfer, price: 3000, date: nil)}, valid_session
          @transfer.reload
        end

        it "from wallet" do
          expect(@transfer.from_wallet.price).to eq @before_from.price
        end
        it "to wallet" do
          expect(@transfer.to_wallet.price).to eq @before_to.price
        end
      end
    end
  end

  describe "DELETE #destroy" do
    before do
      @transfer = create(:transfer)
    end
    it "deletes the transfer" do
      expect{
        delete :destroy, {id: @transfer}, valid_session
      }.to change(Transfer, :count).by(-1)
    end
    it "rendirects to transfer#index" do
      delete :destroy, {id: @transfer}, valid_session
      expect(response).to redirect_to transfers_url
    end
    describe "reset" do
      before do
        @before_from = @transfer.from_wallet
        @before_to = @transfer.to_wallet
        @price = @transfer.price
        @commission = @transfer.commission
        @from_id = @transfer.from_wallet_id
        @to_id = @transfer.to_wallet_id
        delete :destroy, {id: @transfer}, valid_session
      end
      it "from wallet" do
        expect(Wallet.find(@from_id).price).to eq(@before_from.price + @price + @commission)
      end
      it "to wallet" do
        expect(Wallet.find(@to_id).price).to eq(@before_to.price - @price)
      end
    end
  end

end
