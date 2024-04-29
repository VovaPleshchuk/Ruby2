class MovieMailer < ApplicationMailer
    def import_completed
        @user = params[:user]
        @movie = params[:movie]

        mail to: @user.email, subject: 'Movie import complete!'
    end
end