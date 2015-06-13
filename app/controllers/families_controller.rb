class FamiliesController < ApplicationController

  def index
    @families = Family.all
  end

  def new
    @family = Family.new
  end

  def create
    @family = Family.new(family_params)
    if @family.save
      redirect_to members_index_path
    else
      render :new
    end
  end

  def edit
    @family = Family.find(params[:id])
  end

  def update
    @family = Family.find(params[:id])
    if @family.update(family_params)
      redirect_to sessions_new_path
    else
      render :edit
    end
  end

  def show
    @family = Family.find(params[:id])
    @members = @family.members
  end

  def destroy
    @family = Family.find(params[:id])
    @family.destroy
    redirect_to members_index_path
  end

  private

  def family_params
    params.require(:family).permit(:username, :password)
  end

end