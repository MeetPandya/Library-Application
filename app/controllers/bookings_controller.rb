class BookingsController < ApplicationController

  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :check_booking, only: [:create,:update]  ## Check whether previous bookings are there


  # GET /bokings
  # GET /bookings.json
  def index
    @bookings = Booking.all
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
  end

  def showUserBooking
    @user = User.find(params["id"])
    @bookings = @user.bookings
    render 'index'
  end

  def showBookingHistory
    @user = User.find(params["id"])
    @bookings = @user.bookinghistories
    render 'bookinghistory'
  end


  ## Find the bookings on the basis of selected Room
  def find
    @booking = Booking.new
    @booking.user_id = current_user.id
    @booking.room_id = params[:id]
    if(!params[:date].nil?)
      @booking.date = Time.parse(params[:date]).strftime('%Y-%m-%d')
      @booking.timefrom = (Time.parse(params[:start])+4.hours).strftime('%H:%M:%S')
      @booking.timeto = (Time.parse(params[:end])+4.hours).strftime('%H:%M:%S')
    end
    @bookings = Booking.where("room_id=?",params[:id]).order(:date)
  end

  # GET /rooms/new
  def new
    @booking = Booking.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms
  # POST /rooms.json
  def create

    ### Check that bookign should not overlap
    if @count_overall > 0 or @count_from > 0 or @count_to > 0
      respond_to do |format|
        redirect_to rooms_path, :flash => { :error => "Booking already done for these timeslots!" }
        return
      end
    else
    params["booking"]["timefrom"] = Time.parse(params["booking"]["timefrom"]).strftime('%H:%M:%S')
    timeto = Time.parse(params["booking"]["timefrom"]) + 2.hours
    params["booking"]["timeto"] = timeto.strftime('%H:%M:%S')

    ###Send email functionality
    UserNotifierMailer.send_signup_email(current_user.email,params["booking"]["room_id"],params["booking"]["timefrom"], params["booking"]["timeto"], params["booking"]["date"]).deliver
    @emails = params["booking"]["members"].split(',')
    @emails.each do |email|
      UserNotifierMailer.send_signup_email(email,params["booking"]["room_id"],params["booking"]["timefrom"], params["booking"]["timeto"], params["booking"]["date"]).deliver
    end

    ### To prevent user from allowing multiple bookings
    params["booking"]["user_id"] = current_user.id
         current_user.hasBooked = 1
         @booking = Booking.new(booking_params)
           if @booking.save
              current_user.save
              redirect_to show_user_booking_path(current_user.id), :flash => { :notice => "notice: 'Room is booked and members(if any) are notified via e-mail" }
             return
           else
           end
      end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    params["booking"]["timefrom"]= ((params["booking"]["timefrom(5i)"]))
    params["booking"]["timeto"]= (params["booking"]["timeto(5i)"])
    params["booking"].delete("timefrom(5i)")
    params["booking"].delete("timeto(5i)")
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    ### allow User to book room after cancelling ONLY IF
    ## 1) admin has allowed him to book multiple rooms but he has booked only a single room
    ## 2) user is not allowed to book multiple rooms
    if current_user.bookings.count == 1
      @user = User.find(current_user.id)
      @user.hasBooked = 0
      @user.save
    end
    ### Move current booking to booking History
    @booking_histroy = Bookinghistory.new
    @booking_histroy = @booking.clone
    @booking_histroy.save
    @booking.destroy
    redirect_to show_user_booking_path(current_user.id), notice: 'Booking was successfully Cancelled.'
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def check_booking
    @count_overall = Booking.where("room_id=? and date=? and timefrom > ? and timeto < ?",params["booking"]["room_id"],params["booking"]["date"],params["booking"]["timefrom(5i)"],
                                  params["booking"]["timeto(5i)"]).count
    @count_from = Booking.where("room_id=? and date=? and timefrom > ? and timefrom < ?",params["booking"]["room_id"],params["booking"]["date"],params["booking"]["timefrom(5i)"],
                               params["booking"]["timeto(5i)"]).count
    @count_to = Booking.where("room_id=? and date=? and timeto > ? and timeto < ?",params["booking"]["room_id"],params["booking"]["date"],params["booking"]["timefrom(5i)"],
                             params["booking"]["timeto(5i)"]).count
  end

    def booking_params
      params.require(:booking).permit(:user_id, :room_id, :date, :timefrom, :timeto, :members)
    end
end

