class CommentsController < ApplicationController
  # Authenticate
  http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

  # Creates a comment
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:commenter, :body))
    redirect_to post_path(@post)
  end

  # Deletes a comment
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
end
