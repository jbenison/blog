class PostsController < ApplicationController
  # Shows all blog posts
  def index
    @posts = Post.all
  end

  # Creates new blog post
  def new
    @post = Post.new
  end

  # Saves new blog post and writes it to database
  def create
    @post = Post.new(params[:post].permit(:title, :text))

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  # Retreive a single blog post by id for display
  def show
    @post = Post.find(params[:id])
  end

  # Retreive a single blog post by id for editing
  def edit
    @post = Post.find(params[:id])
  end

  # Saves updated blog post and wirtes it to the database
  def update
    @post = Post.find(params[:id])

    if @post.update(params[:post].permit(:title, :text))
      redirect_to @post
    else
      render 'edit'
    end
  end

  # Delete blog post
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  # Private blog post parameters
  private
    def post_params
      params.require(:post).permit(:title, :text)
    end
end
