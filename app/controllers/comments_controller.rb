class CommentsController < ApplicationController
    def create
        @photo = Photo.find(params[:photo_id])
        @comment = Comment.create(comment_params)
        @comment.photo_id = @photo.id
        @comment.user_id = current_user.id
        @comment.save
        flash[:notice]= "Comment successful."
        redirect_to user_path(session[:user_id])
    end

    def new
        redirect_to "/"
    end
    
    private
    def comment_params
        params.require(:comment).permit(:comment)
    end
end
