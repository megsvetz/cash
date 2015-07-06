class MembersController < ApplicationController
  before_action :find_member, only:[:edit, :update, :show, :destroy]

  def index
    @members = Member.all
    @family = Family.where(id: session[:id]).first
  end

  def new
    @member = Member.new
    @member.family_id = Family.where(id: session[:id]).first
  end

  def create
    @member = Family.where(id: session[:id]).first.members.build(member_params)
    if @member.save
      redirect_to members_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @member.update(member_params)
      redirect_to members_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @member.destroy
    redirect_to members_path
  end

  private

  def member_params
    params.require(:member).permit(:name, :family_id)
  end

  def find_member
    @member = Member.find_by(id: params[:id])
    unless @member
      render(text: "Member not found.", status: :not_found)
    end
  end

end
