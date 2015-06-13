class SessionsController < ApplicationController

  def new
    @family = Family.new
  end

  def create
    @family = Family.where(username: params['/login'][:username]).first
    if @family.present? && @family.authenticate(params['/login'][:password])
      session[:family_id] = @family.id
      redirect_to members_path, notice: "Welcome to Cash Register!"
    else
      flash[:alert] = 'Wrong username or password'
      render :new
    end
  end

  def destroy
    sessions[:family_id]
    redirect_to members_index
  end
end
