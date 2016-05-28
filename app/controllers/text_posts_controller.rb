class TextPostsController < ApplicationController
    def index
      @text_posts = TextPost.all
    end

    def show
      @text_post = TextPost.find(id)
    end

    def new
      @text_post = TextPost.new
    end

    def edit
      @text_post = TextPost.find(id)
    end

    def create
      @text_post = TextPost.new(text_post_params)
        if @text_post.save
          redirect_to text_posts_path
        else
          @errors = @text_post.errors
            render :new
        end
      end

    def update
      @text_post = TextPost.find(id)
        if @text_post.update(text_post_params)
          redirect_to text_posts_path
        else
          @errors = @text_post.errors
            render :edit
        end
    end

    def delete
      @text_post = TextPost.find(id)
       if @text_post.destroy
        redirect_to text_posts_path
      end
    end

    private
      def text_post_params
        params.require(:text_post).permit(:url, :title, :blog)
      end

      def id
        params[:id]
      end
end
