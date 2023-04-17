class SessionsController < ApplicationController
    def new
        @user = User.new
        render :new
    end 

    def create
        username = params[:user][:username]
        password = params[:user][:password]

        @user = User.find_by_credentials(username,password)

        if @user.save 
            # login!(@user)
            redirect_to cats_url
        else
            user = User.new(username: username)
            render :new 
        end

    end

    def destroy
        logout!

        redirect_to new_session_url
    end

end