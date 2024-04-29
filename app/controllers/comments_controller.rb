class CommentsController < ApplicationController
   before_action :find_movie
   before_action :find_and_authorize_comment, except: :create

    def create
        @comment = Comment.build(user: current_user, **comment_params)

        flash[:error] = @comment.errors.full_messages.join(", ") unless @comment.save

        redirect_to @movie
    end

    def edit
        # redirect_to edit_movie_comment_path(@comment)
    end

    def update
        @comment.assign_attributes(comment_params)
        if @comment.save
            redirect_to @comment.commentable
        else
            flash[:alert] = @comment.errors.full_messages.join(", ")
            render :edit
        end
    end

    def destroy
        @comment.destroy
    end

    def comment_params
        params.require(:comment).permit(:body, :commentable_id, :commentable_type)
    end

    def find_movie
        @movie = Movie.find(params[:movie_id])
    end

    def find_and_authorize_comment
        @comment = Comment.find(params[:id])
        authorize @comment
    end

end