class TextPostsController < ApplicationController
  before_action :set_text_post, only: [:show, :edit, :update, :destroy]

  def index
    @text_posts = TextPost.all
  end

  def new
    @text_post = TextPost.new
  end

  def create
    @text_post.user = current_user 
    @text_post = TextPost.new(text_post_params)
    if @text_post.save
      redirect_to text_posts_path
    else
      @errors = @text_post.errors
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update
    if @text_post.update(text_post_params)
      redirect_to text_posts_path
    else
      @errors = @text_post.errors
      render :edit
    end
  end

  def destroy
    if current_user == @text_post.user
    @text_post.destroy
    else redirect_to text_posts_path, error: "You don't have permission"
    end
  end

  private

  def set_text_post
    @text_post = TextPost.find(id)
  end

  def text_post_params
    params.require(:text_post).permit(:url, :title, :blog)
  end

  def id
    params[:id]
  end
end
