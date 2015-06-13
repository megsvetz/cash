class MembersController < ApplicationController

  def index
    @members = Member.all
    @family = current_family
  end

  def new
    @member = current_family.members.build
  end

  def create
    @member = current_family.members.build(member_params)
    if @member.save
      redirect_to members_path
    else
      render :new
    end
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to members_path
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
    redirect_to members_path
  end


  private

  def member_params
    params.require(:member).permit(:name, :family_id)
  end


end
