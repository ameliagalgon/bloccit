class UsersController < ApplicationController
     def new
          @user = User.new
     end

     def create
          @user = User.new
          @user.name = params[:name]
          @user.email = params[:email]
          @user.password = params[:password]
          @user.password_confirmation = params[:password_confirmation]

          if @user.save
               flash[:notice] = "Welcome to Bloccit #{@user.name}!"
               create_session(@user)
               redirect_to root_path
               cookies.delete(:user_name)
               cookies.delete(:user_email)
          else
               flash.now[:alert] = "There was an error creating your account. Please try again."
               render :new
          end
     end

     def confirm
          @user = User.new
          @user.name = params[:name]
          @user.email = params[:email]
          @user.password = params[:password]
          @user.password_confirmation = params[:password_confirmation]

          if params[:user][:name] == "" || params[:user][:email] == ""|| params[:user][:password] == "" || params[:user][:password_confirmation] == ""
            redirect_back(fallback_location: new_user_path)
            flash[:alert] = "Please fill out all fields"
          end
     end

     def edit
     end

     def show
       @user = User.find(params[:id])
       @posts = @user.posts.visible_to(current_user)
     end
end
