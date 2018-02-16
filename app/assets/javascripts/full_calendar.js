// var initialize_calendar;
// initialize_calendar = function() {
//   $('#calendar').each(function(){
//     var calendar = $(this);
//     calendar.fullCalendar({});
//   })
// };
// $(document).on('turbolinks:load', initialize_calendar);

$(document).ready(function() {

   // page is now ready, initialize the calendar...

   $('#calendar').fullCalendar({
       // put your options and callbacks here
       aspectRatio: 3
       // height: 150;
   })

});
