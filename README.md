# [Library Application](https://library1.herokuapp.com)

Admin:

navigate to Admin Login,

username : admin@example.com

password : password

User:

navigate to login,

username:email which is used while signing up

[Request to use working email id as the application will send email to user and team members after booking]

passowrd:one which is used while signing up


Create Booking

1) We have used fullcalendar of jquery to book rooms

Booking Use Case:

  1) System will not allow to book a time slot other than two hours

  2) System will not allow to book past times for a given date

  3) User will be able to book only a single room at a time

  4) In booking option , if user enters email address of library members then they will get email address with the booking details.

  5) Booking will auto populate the details from the slots user has selected from the Calendar

  6) If there is any overlap between user selected booking and the one in database , system will not allow user to book the room

  7) User can view his current booking and booking history

  8) User can cancel his current booking.After cancellation system should allow user to allow booking.

  9) User can view total bookings from all users in 'Create Booking' screen
  
Admin UseCase:

  1) Admin should be able to create rooms.

  2) Admin should be able to create booking on behalf of users.

  3) Admin can grant user 'Multiple Booking' access

  4) If admin deletes a room,all the bookings associated with the room should be deleted

  5) If admin deleted a user,all the bookings associated with the user should be deleted

  6) Admin can dynamically search bookings on the basis of User and Room

  
  Generic:

  1) We have created a batch to delete booking older than two hours.If a start date of booking and current time diference is more than two hours then the booking will be deleted.
  
  
  Booking
  
  1) go to https://library1.herokuapp.com/
  
  2) login with appropriate credentials / sign up
  
  3) select the date and timeslots you want to book the room for

  4) add email ids (comma separated) of the members you want to add

  5) Check your booking in current Booking
  
