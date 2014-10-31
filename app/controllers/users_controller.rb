class UsersController < ApplicationController

	def index
	end

	def show
    @user = User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id]).destroy
    redirect_to root_path
  end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(name: params[:user][:name], email: params[:user][:email], password: params[:user][:password], userpic: params[:user][:userpic], climbing_level: params[:user][:climbing_level])
		redirect_to user_path(@user)
	end
end
