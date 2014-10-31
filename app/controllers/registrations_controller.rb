class RegistrationsController < ApplicationController

	def new
  	@user = User.new
 	end

 def create
 	@user = User.new(user_params)
  	if @user.save
      redirect_to user_path(@user.id)
   	else
     render :new
    end
 		rescue ActiveRecord::RecordNotUnique
   		@user.errors.add(:email, "There is already an user with this email")
    render :new
 end

 private

 def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation, :userpic)
 end
end
