class MembersController < ApplicationController

  def index
    @members = Member.all
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to f@member_index_path
    else
      render :new
    end
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update@member_params)
      redirect_to members_index_path
    else
      render :edit
    end
  end


  def show
    @member = Member.find(params[:id])
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to members_index_path
  end


  private

  def member_params
    params.require(:member).permit(:name, :family_id)
  end


end