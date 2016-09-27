ActiveAdmin.register Room do
  permit_params :number, :size, :location


####### When Admin deletes a room , corresponding bookings should be deleted and user should be allowed to book a room
#######  after deletion
  controller do
    def destroy
      @bookings = Booking.where("room_id=?",params["id"])
      @bookings.each do |booking|
        @user = User.where("id=?", booking.user_id)
        roomBooked = Booking.where("user_id=?",booking.user_id).count
        if(roomBooked == 1)
        @user.update(booking.user_id , :hasBooked => '0')
        end
      end
      @bookings.destroy_all
      @room = Room.where("id=?",params["id"])
      @room.destroy(params["id"])
      redirect_to '/admin/rooms/'
    end
  end


###### custom Room input form
  form do |f|
    f.inputs "Room Details" do
      f.input :number, label: 'Room Number'
      f.input :size ,label:'Size',:collection => ["Small", "Medium", "Large"]
      f.input :location ,label:'Location',:collection => ["James.B.Hunt", "D.H.Hill"]
    end
    f.actions
  end

 ###Custom room filters
  filter :number
  filter :size
  filter :location
end
