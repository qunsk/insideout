<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang='en'>
<head>
<meta charset='utf-8' />

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<style>
#calendar {
	max-width: 800px;
	margin: 0 auto;
}
</style>
<script>
  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
	
    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      initialView: 'dayGridMonth',
      navLinks: true,
      selectable: true,
      selectMirror: true,
      select: function(arg) {
        var title = prompt('입력할 일정:');
        if (title) {
          calendar.addEvent({
            title: title,
            student_name: student_name,
            counsel_Request_Content: COUNSEL_BOOKING.counsel_Request_Content,
            booking_Dt: COUNSEL_BOOKING.booking_Dt,
            booking_Time: COUNSEL_BOOKING.booking_Time,
            backgroundColor: "yellow",
            textColor: "blue"
          });
        }
        calendar.unselect();
      },
      eventClick: function(arg) {
        if (confirm('Are you sure you want to delete this event?')) {
          arg.event.remove();
        }
      },
      editable: true,
      dayMaxEvents: true,
      events: function(info, successCallback, failureCallback) {
        $.ajax({
          type: "get",
          url: "StaffCalendar?method=data",
          dataType: "json"
          
        });

    calendar.render();
  });
</script>
</head>
<body>
	<div id='calendar'></div>
</body>
</html>
