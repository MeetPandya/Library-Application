

$( document ).ready(function() {

    $('#booking_date').datepicker({
        dateFormat: 'yy-mm-dd',
        minDate: 0, //  min date
        maxDate: '+1w' //
    });

    $('#booking_timefrom').timepicker({
        'timeFormat': 'H:i',
        'disableTimeRanges': [['12am', getCurrentTime(new Date())]]
    });

    $('#booking_timeto').timepicker({
        'timeFormat': 'H:i',
        'disableTimeRanges': [['12am', getCurrentTime(new Date())]]
    });

    function getCurrentTime(date) {
        var hours = date.getHours(),
            minutes = date.getMinutes(),
            ampm = hours >= 12 ? 'pm' : 'am';

        hours = hours % 12;
        hours = hours ? hours : 12;
        minutes = minutes < 10 ? '0'+minutes : minutes;

        return hours + ':' + minutes + ' ' + ampm;
    }


});
