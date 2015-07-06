require "rails_helper"

RSpec.describe Receipt, type: :model do 

  context "class methods" do
    before(:each) do
      @receipt_1 = Receipt.create(name: "Target", date: "2015-05-13 22:30:00", amount: 58.94, member_id: 2)
      @receipt_2 = Receipt.create(name: "Albertsons", date: "2015-02-22 22:30:00", amount: 13.73, member_id: 1)
      @receipt_3 = Receipt.create(name: "Outback", date: "2014-12-13 22:30:00", amount: 108.42, member_id: 3)
      @receipt_4 = Receipt.create(name: "Walmart", date: "2015-03-08 22:30:00", amount: 423.22, member_id: 1)
    end

    describe ".by_date" do
      it "orders by date" do
        expect(Receipt.all.by_date.first).to eq(@receipt_3)
      end
    end

    describe ".by_name" do
      it "orders by name" do
        expect(Receipt.all.by_name.first).to eq(@receipt_2)
      end
    end

    describe ".by_amount" do
      it "orders by amount" do
        expect(Receipt.all.by_amount.first).to eq(@receipt_2)
      end
    end

    describe "validations" do
      it { should validate_presence_of(:name)}
      it { should validate_presence_of(:date)}
      it { should validate_presence_of(:amount)}
    end

    describe "relationships" do
      it { should belong_to(:member)}
    end
  end
end
