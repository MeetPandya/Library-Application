class UsersController < ApplicationController
    def new
      @user = User.new
    end

    # GET /lusers/1/edit
    def edit
      @user = User.find(params[:id])
    end

    def create
       @user = User.new(user_params)
       if @user.save
         session[:user_id] = @user.id
         redirect_to '/rooms'
       else
         redirect_to 'signup'
       end
    end

    def update
      @user = User.find(params[:id])
      redirect_to rooms_path, notice: 'User was successfully updated.'
    end

    private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :hasBooked, :allowMultiple)
    end
end
