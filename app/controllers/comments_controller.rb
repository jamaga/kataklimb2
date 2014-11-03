class CommentsController < ApplicationController
	def index
		@comments = Comment.all
	end

	def show
		@comment = Comment.find(params[:id])
	end

	def new
		@comment = Comment.new
	end

	def edit
		@comment = Comment.find(params[:id])
	end

	def update
		@comment = Comment.find(params[:id])
		if @comment.update_attributes commment_params
			redirect_to group_path(@group)
		else
			@errors = "error"
			render 'edit'
		end
	end


	def destroy
		comment = Comment.find(params[:id]).destroy
		group.comments.each do |comment|
			comment.destroy
		end
		redirect_to group_path(@group)
	end
	
	def create
		@comment = Comment.create(comment_params)
		group = Group.find(params[:group_id])
		group.comments << @comment
			@comment.save
			redirect_to group_path(@comment.group.id)
	end

	private
		def comment_params
			params.require(:comment).permit(:title, :content, :id)
		end
end
