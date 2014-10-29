class LoginController < ApplicationController

	def new
		@user = User.new
	end

  def create
    user = User.where(email: params[:email]).first

    if user && user.authenticate(params[:password])
      flash[:success] = "Login sucessful! Welcome #{user.name}!"
      session[:current_user_id] = user.id
      redirect_to user_path(user.id)
    else
      flash[:error] = "Login was not sucessful"
      redirect_to login_path
    end
  end

  def destroy
    session[:current_user_id] = nil
    flash[:notice] = "You have successfully logged out."
    redirect_to root_url
  end
end

