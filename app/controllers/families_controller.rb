class FamiliesController < ApplicationController

  def new
    @family = Family.new
  end

  def create
    @family = Family.new(family_params)
    if @family.save
      redirect_to login_path
    else
      render :new
    end
  end

  def destroy
    @family = Family.find(params[:id])
    @family.destroy
    redirect_to members_index_path
  end

  private

  def family_params
    params.require(:family).permit(:username, :password, :password_confirmation)
  end

end