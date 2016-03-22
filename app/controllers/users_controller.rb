class UsersController < ApplicationController
    #引入SessionsHelper moudle，这样就可以调用该moudle中的方法了
    include UsersHelper
             
    def new
    end

    def index
      if(logged_in?)
        redirect_to :controller => 'posts', :action => 'index' 
      else
        render :new
      end
    end

    def create
      username = params[:user][:login]
      password = params[:user][:password]
      
      @user = User.find_by_name(username)
      
      if @user.class == NilClass
        @hint = 'Unregisted Username!'
      elsif @user.authenticate(password)
        @hint = "Welcome back, "
        log_in(@user)
        redirect_to :controller => 'posts', :action => 'index' and return
      else
        @user = nil
        @hint = "Login failed, please check up you info"
      end
      render :new
    end

    def destroy
      log_out if logged_in? #SessionsHelper中的方法
      redirect_to root_path
    end

end
