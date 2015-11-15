require 'rails_helper'

RSpec.describe Record, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe "validation" do
    it "is valid with a price, date, record_type, category and " do
      record = Record.new(user_id: 1,
                         record_type:  Record::PAYMENT,
                         category_id: 1,
                         price: 1000,
                         from_wallet_id: 1)
    end

    describe "is invalid without" do
      before do
        @record = Record.new
        @record.valid?
      end

      it "is invalid without a user_id" do
        expect(@record.errors[:user_id]).to include "can't be blank"
      end
      it "is invalid without a date" do
        expect(@record.errors[:date]).to include "can't be blank"
      end
      it "is valid without a price and default price = 0" do
        expect(@record.price).to eq 0
      end
      it "is invalid without a category" do
        expect(@record.errors[:category_id]).to include "can't be blank"
      end
      it "is invalid without a record_type" do
        expect(@record.errors[:record_type]).to include "can't be blank"
      end
      it "is valid without a record_type and with category" do
        record = Record.new record_type: nil, category_id: 1
        record.valid?
        expect(record.errors[:record_type]).to_not include "can't be blank"
      end

    end

    describe "wallet" do
      describe "record_type=PAYMENT" do
        before do
          @record = Record.new from_wallet: nil, record_type: Record::PAYMENT
          @record.valid?
        end
        it "is invalid without a from_wallet " do
          expect(@record.errors[:from_wallet_id]).to include "can't be blank"
        end
        it "is valid without a to_wallet" do
          expect(@record.errors[:to_wallet_id]).to_not include "can't be blank"
        end
      end
      describe "record_type=INCOME" do
        before do
          @record = Record.new from_wallet: nil, to_wallet: nil, record_type: Record::INCOME
          @record.valid?
        end
        it "is valid without a from_wallet" do
          expect(@record.errors[:from_wallet_id]).to_not include "can't be blank"
        end
        it "is invalid without a to_wallet" do
          expect(@record.errors[:to_wallet_id]).to include "can't be blank"
        end
      end
      describe "record_type=TRANSFER" do
        before do
        @record = Record.new from_wallet: nil, to_wallet: nil, record_type: Record::TRANSFER
        @record.valid?
        end
        it "is invalid without a from_wallet " do
          expect(@record.errors[:from_wallet_id]).to include "can't be blank"
        end
        it "is invalid without a to_wallet" do
          expect(@record.errors[:to_wallet_id]).to include "can't be blank"
        end
      end
    end

    describe "wallet.price" do
      describe "with payment" do
        describe "when create" do
          before do
            @record = build(:record, category_id: 1)
            @before_from = @record.from_wallet.price
            @before_to = @record.to_wallet.price
          end
          describe "valid" do
            before do
              @record.create
            end
            it "from_wallet.price" do
              expect(@record.from_wallet.price).to eq(@before_from - @record.price)
            end
            it "to_wallet.price isn't changed" do
              expect(@record.to_wallet.price).to eq @before_to
            end
          end
          describe "invalid" do
            before do
              @record = build(:record, category_id: 1, date: nil)
              @record.save
            end
            it "from_wallet.price isn't changed'" do
              expect(@record.from_wallet.price).to eq @before_from
            end
            it "to_wallet.price isn't changed" do
              expect(@record.to_wallet.price).to eq @before_to
            end
          end
        end
        describe "when update" do
          before do
            @record = create(:record, category_id: 1)
            @before_from = @record.from_wallet.price
            @before_to = @record.to_wallet.price
            @price = @record.price
          end
          describe "valid" do
            before do
              @record.update price: 2000
            end
            it "from_wallet.price" do
              expect(@record.from_wallet.price).to eq(@before_from + @price - @record.price)
            end
            it "to_wallet.price isn't changed" do
              expect(@record.to_wallet.price).to eq @before_to
            end
          end
          describe "invalid" do
            before do
              @record.update price: 2000, date: nil
            end
            it "from_wallet.price isn't cahnged" do
              expect(@record.from_wallet.price).to eq @before_from
            end
            it "to_wallet.price isn't changed" do
              expect(@record.to_wallet.price).to eq @before_to
            end
          end
        end
        describe "when destroy" do
          before do
            @record = create(:record, category_id: 1)
            @before_from = @record.from_wallet.price
            @before_to = @record.to_wallet.price
            @price = @record.price
            @from_wallet = @record.from_wallet
            @to_wallet = @record.to_wallet
            @record.destroy
          end
          it "from_wallet.price is changed" do
            expect(@from_wallet.price).to eq(@before_from + @price)
          end
          it "to_wallet.price isn't changed" do
            expect(@to_wallet.price).to eq @before_to
          end
        end
      end
    end
  end
end
