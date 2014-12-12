class CommentsController < ApplicationController
  before_filter :authenticate, except: [:index, :show]

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id]) 
    @user = current_user
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
    group = Group.find(params[:group_id])
    comment = Comment.find(params[:id]).destroy
    redirect_to group_path(group.id)
  end

  def create
    @comment = Comment.create(comment_params)
    group = Group.find(params[:group_id])
    puts '='*100
    puts @comment
    puts '='*100
    group.comments << @comment
    current_user.comments << @comment
    redirect_to group_path(@comment.group.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :content)
  end

end