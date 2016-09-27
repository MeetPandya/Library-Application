ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  controller do
    def destroy
      @bookings = Booking.where("luser_id=?",params["id"])
      puts @bookings.count
      @bookings.each do |booking|
        booking.destroy
      end
      @luser = User.where("id=?", params["id"])
      @luser.destroy(params["id"])
      redirect_to '/admin/lusers/'
    end
  end
end
