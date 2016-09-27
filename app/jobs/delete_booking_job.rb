class DeleteBookingJob < ApplicationJob
  queue_as :default

  ##### Created a job to delete bookings done more than two hours ago
  ##### We have used (time + 4) to keep up with UTC time so 2 hours ago will be 6 hours ago
  def perform(*args)
    @bookings = Booking.where("date=? and timefrom<=?",Time.now.strftime("%Y-%m-%d"),6.hours.ago)
    @bookings.each do |booking|
      @booking_histroy = Bookinghistory.new
      ### Move current booking data to booking history
      @booking_histroy.attributes = booking.attributes
      @booking_histroy.save
      @user = User.where("id=?",booking.user_id)
      @count = Booking.where("user_id=?",booking.user_id).count
      ### allow user to book a room after his booking is cancelled
      if(@count == 1)
        @user.update(booking.user_id , :hasBooked => '0')
      end
    end
    @bookings.destroy_all
  end
end
