require "rails_helper"

RSpec.describe MembersController, type: :controller do 
  let(:family){create(:family)}
  let(:member){create(:member)}
  @family = FactoryGirl.create(:family)

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end #describe GET #index

  describe "GET #new" do
    it "returns http success" do
      get :new
      #  get :index, {:page_id => @page.id, :article_id => @article.id}
      expect(response).to have_http_status(:success)
    end
   end #describe GET #new

  describe "GET #show" do
    it "returns http success" do
      get :show, id: member.id
      expect(response).to have_http_status(:success)
    end

    it "does not return http success" do 
      get :show, id: '1234'
      expect(response).to have_http_status(:not_found)
    end
  end #descibe GET #show

  describe "GET #edit" do
    it "returns http success" do
      get :edit, id: member.id
      expect(response).to have_http_status(:success)
    end
  end #describe GET edit endtag

  describe "PUT #update" do
    it "updates" do
      put :update, id: member.id, member: {name: "Katie"}
      expect(response).to have_http_status(:redirect)
      expect(member.reload.name).to eq("Katie")
    end

    it "doesn't update" do 
      put :update, id: member.id, member: {name: nil}
      expect(response).to render_template(:edit)
    end
  end #describe PUT #update endtag

  describe "POST #create" do
    it "creates" do
      post :create, member: {name: 'Stephanie'} 
      expect(response).to have_http_status(:redirect)
    end

    it "doesn't create" do
      post :create, member: {name: nil}
      expect(response).to render_template(:new)
    end
  end #describe POST #create endtag

  describe "DELETE #destroy" do
    it "deletes" do
      delete :destroy, id: member.id
      expect(Member.all.count).to eq(0)
      expect(response).to have_http_status(:redirect)
      should set_flash[:alert]
    end
    
    it "does not delete" do
      delete :destroy, id: '5432'
      expect(response).to have_http_status(:not_found)
    end
  end #describe DELETE #destroy endtag
end