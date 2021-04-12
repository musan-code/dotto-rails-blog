class CommentsController < ApplicationController

  def create
    #params フォームで送信した値を取得
    @post = Post.find(params[:post_id])
    #記事に紐ついた形でコメントを生成
    @post.comments.create(comment_params)
    #記事の詳細画面にredirectする
    redirect_to post_path(@post)
  end


  def destroy
    #記事を特定
    @post = Post.find(params[:post_id])
    #コメントを特定
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end


  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
