class CommentsController < ApplicationController

  
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype)
      # redirect_to tweet_path(@comment.tweet) # 今回の実装には関係ありませんが、このようにPrefixでパスを指定することが望ましいです。
    else
      @prototype = @comment.prototype
      @comments = @prototype.comments
      render "prototypes/show", status: :unprocessable_entity
      # views/tweets/show.html.erbのファイルを参照しています。
    end
  end
  # 省略

  def show
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  

 private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id,  prototype_id: params[:prototype_id])
  end
end
