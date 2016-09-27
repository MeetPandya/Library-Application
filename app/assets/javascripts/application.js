// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui/datepicker
//= require jquery.timepicker
//= require moment.min
//= require fullcalendar.min
//= require scheduler
//= require_tree .


$( document ).ready(function() {

    $("#tabs").tabs();

   var calendar = $('#calendar').fullCalendar({
        schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
        defaultView: 'timelineDay',
        defaultEventMinutes: 120,
        slotMinutes: 30,
        snapMinutes: 60,
        resourceLabelText: 'Rooms',
        events:
            {
                url: '/bookings.json'
            }
        ,
        resources: {
            url: '/rooms.json'
        },
         editable: true,
         selectable: true,
         selectHelper: true,
         select: function(start, end, event, view, resource) {
            $("#notice").html("");
            var now = new Date();
            var new_start = new Date(start);
            if(new_start.getDate()==now.getDate()) {
                if (new_start.getHours() + 4 < now.getHours()) {
                    $("#notice").html("Can not book the previous time slot");
                    return false;
                }
            }
            if(new_start.getDate() < now.getDate()){
                $("#notice").html("Can not book previous date");
                return false;
            }
           var duration = (end - start)/3600;
           //Check if duration is 2 hours
           if(duration==2000) {
              start = new Date(start);
              end = new Date(end);
              var date1 = calendar.fullCalendar('getDate');
              var date = new Date(date1);
              //date.setDate(date.getDate());
               date.setHours(date.getHours()+4);
              var url = "/bookings/find/" + resource["number"] + "?start=" + start + "&end=" + end + "&date=" + date;
              window.open(url, "_self");
          }
          else{
               $("#notice").html("Please select two hours slots")
          }
       },
       eventClick: function(event) {
           if (event.url) {
               $("#notice").html("Room is already booked");
               return false;
           }
       }
    });




});

