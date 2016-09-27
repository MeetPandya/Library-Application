class SessionsController < ApplicationController
    def new

    end

    def create
      ### Batch job to delete bookings done more than two hours ago
      DeleteBookingJob.perform_later

      @user = User.find_by_email(params[:session][:email])
      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        redirect_to '/rooms'
      else
        redirect_to '/login' , :flash => { :error => "Invalid Login!" }
      end
    end

    def destroy
      session[:user_id] = nil
      redirect_to '/'
    end
end
