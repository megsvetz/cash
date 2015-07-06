require "rails_helper"

RSpec.describe Member, type: :model do 
  context "class methods" do
    
    before(:each) do
      @member_1 = Member.create(name: "Bella")
      @member_2 = Member.create(name: "Zack")
      @member_3 = Member.create(name: "Meg")
      @member_4 = Member.create(name: "Joe")
    end

    describe ".by_first_name" do
      it "orders members by first name" do
        expect(Member.all.by_first_name.last).to eq(@member_2)
      end
    end

    describe "validations" do
      it { should validate_presence_of(:name)}
    end

    describe "associations" do
      it { should belong_to(:family)}
      it { should have_many(:receipts)}
    end
  end  
end
