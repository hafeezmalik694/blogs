class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_post, only: %i[show edit update destroy like]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  def like
    if @post.liked_by?(current_user)
      @post.likes.find_by(user: current_user).destroy
    else
      @post.likes.create(user: current_user)
    end
    redirect_back(fallback_location: posts_url)
  end


  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
