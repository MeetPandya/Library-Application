class UserNotifierMailer < ApplicationMailer
  default :from => 'LibraryApp@example.com'

  # to send email to members to notify room booking
  def send_signup_email(email,room,timefrom,timeto,date)
    mail( :to =>email,
          :subject => 'Room ' + room + ' booking on ' +date + ' between ' + timefrom + ' and ' +timeto)
  end
end
