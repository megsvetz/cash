require "rails_helper"

RSpec.describe Family, type: :model do 

  describe "validations" do
    it { should validate_presence_of(:username)}
    it { should validate_presence_of(:password_digest)}
  end

  describe "association" do
    it { should have_many(:members)}
    it { should have_secure_password }
  end
  
end
