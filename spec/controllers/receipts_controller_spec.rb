require "rails_helper"

RSpec.describe ReceiptsController, type: :controller do 
  let(:member){create(:member)}
  let(:receipt){create(:receipt)}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end #describe GET #index

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
   end #describe GET #new

  describe "GET #show" do
    it "shows receipt" do
      get :show, id: receipt.id
      expect(response).to have_http_status(:success)
    end

    it "does not show receipt" do 
      get :show, id: '1234'
      expect(response).to have_http_status(:not_found)
    end
  end #descibe GET #show

  describe "GET #edit" do
    it "returns http success" do
      get :edit, id: receipt.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do

    it "updates receipt correctly" do
      put :update, id: receipt.id, :receipt => {name: "Trader Joes", date: "2015-03-17 11:30:00", amount: 45.80, description: "Corned beef and cabbage.", member_id: 1}
      expect(response).to have_http_status(:redirect)
      expect(receipt.reload.name).to eq('Trader Joes')
    end

    it "does't update correctly" do 
      put :update, id: receipt.id, :receipt => {name: nil}
      expect(response).to render_template(:edit)
    end
  end #describe put #update endtag

  describe "POST #create" do
    it "creates successfully" do
      post :create, receipt: {name: "Nordstroms", date: "2015-05-01 11:30:00", amount: 127.34, description: "Summer clothes for kids.", member_id: 2}
      expect(response).to have_http_status(:redirect)
    end
    it "does not create" do
      post :create, :receipt => {name: nil}
      expect(response).to render_template(:new)
    end
  end

  describe "DELETE #destroy" do
    it "deletes" do
      delete :destroy, id: receipt.id
      expect(Receipt.all.count).to eq(0)
      expect(response).to have_http_status(:redirect)
    end
    it "does not delete" do
      delete :destroy, id: '432'
      expect(response.body).to eq "Receipt not found."
      expect(response).to have_http_status(:not_found)
    end
  end
end
