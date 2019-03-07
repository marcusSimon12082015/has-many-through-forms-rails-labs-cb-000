class PostsController < ApplicationController
  before_action :set_post, only:[:show,:edit]

  def show
    @comment = Comment.new
    @comment.user = User.new
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create(post_params)
    redirect_to post
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])

  end

  def set_post
    @post = Post.find(params[:id])
  end
end
