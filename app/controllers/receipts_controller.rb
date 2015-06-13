class ReceiptsController < ApplicationController

  def index
    @receipts = Receipt.all
  end

  def new
    @receipt = Receipt.new
    @member = Member.find(params[:member_id])
  end

  def create
    @receipt = Receipt.new(receipt_params)
    if @receipt.save
      redirect_to members_path
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
      redirect_to members_path
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
    redirect_to members_path
  end


  private

  def receipt_params
    params.require(:receipt).permit(:name, :date, :amount, :description, :member_id)
  end

end
