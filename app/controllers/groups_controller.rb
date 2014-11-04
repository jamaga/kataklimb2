class GroupsController < ApplicationController	
	before_filter :authenticate, except: [:index, :show]
	before_filter :get_group, only: [:show, :destroy, :edit, :update]
	before_filter :authorize, only: [:destroy, :edit, :update]

	def index
		@groups = Group.all
	end

	def new
		@group = Group.new
	end

	def create
		@group = Group.create(
			name: params[:group][:name], 
			climbing_level: params[:group][:climbing_level], 
			capacity: params[:group][:capacity],
			creator_id: current_user.id
		)
		redirect_to groups_path
		@group.users << current_user
	end

	def show
  end

  def destroy
  	@group.destroy
    redirect_to groups_path
  end

	def edit
	end

	def update
		@group.update(name: params[:group][:name],
		 climbing_level: params[:group][:climbing_level],
		 capacity: params[:group][:capacity])
		redirect_to group_path(@group)
	end

	# def join
 #  	@group = Group.find(params[:group_id])
 #  	@group.users << current_user
 #  	redirect_to groups_path, notice: "You joined the group!!"
	# end

	def join
  	@group = Group.find(params[:group_id])
  	if current_user.climbing_level == @group.climbing_level
  		@group.users << current_user
  	redirect_to groups_path, notice: "You joined the group!!"
  	else
  		redirect_to groups_path, notice: "you need to have adequate climbing level!"
		end
	end

	private

  def authorize
  	if creator_id != current_user.id
      flash[:error] = "you do not have rights to do this! you must be creator"
      redirect_to root_path
    end
  end

  def get_group
  	@group ||= Group.find(params[:id])
  end

  def creator_id
    @group.creator_id
  end
end




