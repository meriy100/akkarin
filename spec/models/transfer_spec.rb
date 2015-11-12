require 'rails_helper'

RSpec.describe Transfer, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe "transfer validates" do
    before do
      @transfer = Transfer.new user_id: 1,
        price: 1000,
        date: Date.new(2015, 10,10),
        from_wallet_id: 2,
        to_wallet_id: 1,
        commission: 105
    end
    it "transfer.save" do
      expect(@transfer).to be_valid
    end

    describe "update wallet" do
      before do
        from_price = @transfer.from_wallet.price
        to_price = @transfer.to_wallet.price
        @from_price = from_price - @transfer.price - @transfer.commission
        @to_price = to_price + @transfer.price
        @transfer.save
      end
      it "from_wallet_price" do
        expect(@transfer.from_wallet.price).to eq @from_price
      end
      it "to_wallet_price" do
        expect(@transfer.to_wallet.price).to eq @to_price
      end
    end
  end

#  describe "update transfer" do
#    before do
#      @transfer = Transfer.find 1
#      from_price = @transfer.from_wallet.price
#      to_price = @transfer.to_wallet.price
#      price = @transfer.price
#      commission = @transfer.commission
#      @transfer.update price: 12000, commission: 210
#      @from_after = from_price + price + commission - @transfer.price - @transfer.commission
#      @to_after = to_price - price + @transfer.price + @transfer.commission
#    end
#    it "from wallet price" do
#      expect(@transfer.from_wallet.price).to eq @from_after
#    end
#    it "to wallet price" do
#      expect(@transfer.to_wallet.price).to eq @to_after
#    end
#  end


end
