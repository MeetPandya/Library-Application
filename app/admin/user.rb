ActiveAdmin.register User do
  permit_params :first_name,:last_name,:email,:password,:hasBooked,:allowMultiple

  def display_name
    first_name
  end


  ####### When a user is deleted , all the coresponding bookings and bookinghistories should be deleted
  controller do
    def destroy
      @bookings = Booking.where("user_id=?",params["id"])
      @bookinghistories = Bookinghistory.where("user_id=?",params["id"])
      @bookings.delete_all
      @bookinghistories.delete_all
      @user = User.where("id=?", params["id"])
      @user.destroy(params["id"])
      redirect_to '/admin/users/'
    end
  end

  ##### Custom filters
  filter :first_name
  filter :last_name
  filter :email
  filter :hasBooked
  filter :allowMultiple

end
