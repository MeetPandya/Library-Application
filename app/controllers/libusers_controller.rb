class LibusersController < ApplicationController
    def new
      @luser = User.new
    end

    # GET /lusers/1/edit
    def edit
      @luser = User.find(params[:id])
    end

    def create
       @luser = User.new(libuser_params)
       if @luser.save
         session[:user_id] = @luser.id
         redirect_to '/rooms'
       else
         redirect_to 'signup'
       end
    end

    def update
      @luser = User.find(params[:id])
      respond_to do |format|
        if @luser.update(booking_params)
          format.html { redirect_to rooms_path, notice: 'Room was successfully updated.' }
          format.json { render :show, status: :ok, location: @luser}
        else
          format.html { render :edit }
          format.json { render json: @luser.errors, status: :unprocessable_entity }
        end
      end
    end

    private
    def libuser_params
      params.require(:luser).permit(:first_name,:last_name,:email,:password,:hasBooked,:allowMultiple)
    end
end
