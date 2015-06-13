class ReceiptsController < ApplicationController

  def index
    @receipts = Receipt.all
  end

  def new
    @receipt = Receipt.new
  end

  def create
    @receipt = Receipt.find(params[:id])
    if @receipt.update(receipt_params)
      redirect_to members_show_path
    else
      render :new
    end
  end

  def edit
    @receipt = Receipt.find(params[:id])
  end

  def update
    @receipt = Receipt.find(params[:id])
    if @receipt.update(receipt_params)
      redirect_to members_show_path
    else
      render :edit
    end
  end


  def show
    @receipt = Receipt.find(params[:id])
  end

  def destroy
    @receipt = Receipt.find(params[:id])
    @receipt.destroy
    redirect_to members_show_path
  end


  private

  def receipt_params
    params.require(:receipt).permit(:name, :date, :amount, :description, :member_id)
  end

end

sessions_new GET  /sessions/new(.:format)   sessions#new
receipts_index GET  /receipts/index(.:format) receipts#index
 receipts_new GET  /receipts/new(.:format)   receipts#new
receipts_edit GET  /receipts/edit(.:format)  receipts#edit
receipts_show GET  /receipts/show(.:format)  receipts#show
members_index GET  /members/index(.:format)  members#index
  members_new GET  /members/new(.:format)    members#new
 members_edit GET  /members/edit(.:format)   members#edit
 members_show GET  /members/show(.:format)   members#show
 groups_index GET  /groups/index(.:format)   groups#index
   groups_new GET  /groups/new(.:format)     groups#new
  groups_edit GET  /groups/edit(.:format)    groups#edit
  groups_show GET  /groups/show(.:format)    groups#show
 groups_posts GET  /groups/posts(.:format)   groups#posts
              GET  /groups/index(.:format)   groups#index
              GET  /groups/show(.:format)    groups#show
              GET  /groups/new(.:format)     groups#new
