class ReceiptsController < ApplicationController
  before_action :find_receipt, only: [:edit, :update, :show, :destroy]

  def index
    @receipts = Receipt.all
  end

  def new
    @receipt = Receipt.new
    if @member = Member.find_by(id: params[:id])
    else
      render(text: "Member not found.", status: :not_found)
    end
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
  end

  def update
    if @receipt.update(receipt_params)
      redirect_to receipt_path
    else
      render :edit
    end
  end


  def show
  end

  def destroy
    @receipt.destroy
    redirect_to receipts_path
  end

  private

  def receipt_params
    params.require(:receipt).permit(:name, :date, :amount, :description, :member_id, :receipt_pic)
  end

  def find_receipt
    @receipt = Receipt.find_by(id: params[:id])
    unless @receipt
      render(text: "Receipt not found.", status: :not_found)
    end
  end

end
