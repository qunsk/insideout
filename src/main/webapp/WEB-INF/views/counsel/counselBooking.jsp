<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담 예약</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

</head>
<style>
.container-fluid {
	justify-content: center;
	align-items: center;
}

.calendar {
	width: 50%;
}

.calendar th {
	text-align: center;
	padding: 15px;
	font-size: 25px;
	color: black;
}

.calendar td {
	cursor: pointer;
	text-align: center;
	padding: 30px;
	/* border: 1px solid #ccc; */
}

.calendar td.weekend {
	background-color: #F2F2F2;
	color: red;
}

.calendar td.weekend:last-child {
	color: #0000ff; /* 토요일 텍스트 색상 설정 */
}

.calendar table {
	width: 100%;
}

.calendar .selected {
	background-color: #CEDEF2;
	color: black;
}

.calendar .prev, .calendar .next {
	cursor: pointer;
}

.calendar-container {
	display: flex;
	justify-content: space-between;
}

.staff .btn.active {
	background-color: #CEDEF2;
	color: black; 
}

.booking_time .btn.active {
	background-color: #CEDEF2;
	color: black;
}

.staff .btn[value :"checked"] {
	background-color: #CEDEF2;
	color: black;
}

.booking_time .btn {
	text-align: center;
	padding: 8px;
	border: 1px solid #ccc;
	padding: 10px;
	width: 250px;
	margin: 0px 0px 0px;
}

.booking_time .disabled {
	border: 0px;
	text-align: center;
	padding: 17px;
	width: 250px;
	font-weight: bold;
	color: #212529;
	margin: 0px 0px 0px;
}

.staff .btn {
	height: 150px;
	width: 49%;
	margin-right: 0.7%;
	margin-top: 20px;
	text-align: left;
	padding: 1.375rem 1rem !important; /* 컨텐트 세로 가운데 정렬 */
	border: 1px solid #ccc;
}

.day th:first-child {
	color: #ff0000; /* 일요일 텍스트 색상 설정 */
}

.day th:last-child {
	color: #0000ff; /* 토요일 텍스트 색상 설정 */
}

.btn {
	display: inline-block;
}

.booking_time .btn {
	text-align: center;
	padding: 8px;
	border: 1px solid #ccc;
	padding: 10px;
	width: 250px;
	margin: 0px 0px 0px;
	color: black;
}

/* 로고이미지 */
.image {
	position: relative;
}

/* 로고이미지 내부 글씨 */
.image .img_text {
	position: absolute;
	bottom: 30px;
	left: 100px;
	color: #FFF;
	font-size: 80px;
}

/* 로고이미지 사이즈 조절 */
.local {
	width: 100%;
	height: 500px;
	object-fit: cover;
	object-position: left 0px;
	/* position: relative; */
}
/* style="font-weight: bold;" */
.booking_time th {
	margin-top: 8%;
	text-align: center;
}

.container-fluid {
	width: 1400px !important;
}
</style>

<body>
	<c:import url="../studentHeader.jsp" />
	<div class="form-group image">
		<img class="local" id="main_img" src="/images/img_sub01.png">
		<div class="img_text container" id="img_text">
			<span><p>${counselType.counsel_typename}</p></span> <span><h5
					style="color: #fff; font-size: 24px;">${counselType.counsel_typedetail}</h5></span>
		</div>
	</div>
	<div class="container-fluid">
		<form method="post" action="counselContent">
			<input type="hidden" id="student_no" name="student_no"
				value="${student_no}"> <input type="hidden"
				id="counsel_typeno" name="counsel_typeno"
				value="${counselType.counsel_typeno}"> <input type="hidden"
				id="booking_dt" name="booking_dt" value=""> <input
				type="hidden" id="staff_no" name="staff_no" value=""> <input
				type="hidden" id="staff_name" name="staff_name" value=""> <br>
			<br>

			<%-- <div class="card">
				<div class="card-body">
					<h2 class="card-title" style="color: black;">${counselType.counsel_typename}</h2>
					<h5 class="card-text" style="color: black;">${counselType.counsel_typedetail}</h5>
				</div>
			</div> --%>
			<br> <br>
			<h3>상담사</h3>

			<!-- 교직원 프로필 -->
			<div class="d-flex justify-content-center">
				<div class="btn-group-toggle staff" data-toggle="buttons">
					<c:forEach items="${staffList}" var="s">
						<label class="btn" for="staff_no_${s.staff_no}">

							<div class="row">
								<div class="col-3" style="margin-left: 5%;">
									<img src="/images/6735382.png" width="100px">
								</div>
								<div class="col-6" style="color: black;">
									<input class="btn" type="radio" id="staff_no_${s.staff_no}"
										name="staff_no" value="${s.staff_no}">
									<h5 class="card-title text-dark">${s.staff_name}</h5>
									<p class="card-text text-dark">${s.staff_tel}</p>
									<p class="card-text text-dark">${s.staff_email}</p>
								</div>
								<div class="col-2">
									<img style="margin-left: 50%; margin-top: 70%;"
										src="/images/hand-index-thumb.svg" width="40%">
								</div>
							</div>
						</label>
					</c:forEach>
				</div>
			</div>

			<br> <br> <br>
			<!-- Calendar -->
			<h3>일정선택</h3>
			<div class="calendar-container row">
				<div class="calendar col-9">
					<table>
						<thead>
							<tr>
								<th class="prev"><img src="/images/caret-left-fill.svg"
									width="30px"></th>
								<th colspan="5" class="month-year"></th>
								<th class="next"><img src="/images/caret-right-fill.svg"
									width="30px"></th>
							</tr>
							<tr class="day">
								<th><h5>일</h5></th>
								<th><h5>월</h5></th>
								<th><h5>화</h5></th>
								<th><h5>수</h5></th>
								<th><h5>목</h5></th>
								<th><h5>금</h5></th>
								<th><h5>토</h5></th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>

				<!-- BOOKING_TIME -->
				<div class="btn-group-vertical booking_time col-3">
					<label class="disabled"> &nbsp; </label> <label class="disabled">
						<h5>예약시간</h5>
					</label> <label class="btn btn-outline-secondary"> <input
						type="radio" name="booking_time" id="booking_time_0100"
						value="0100"> 9:00
					</label> <label class="btn btn-outline-secondary"> <input
						type="radio" name="booking_time" id="booking_time_0200"
						value="0200"> 10:00
					</label> <label class="btn btn-outline-secondary"> <input
						type="radio" name="booking_time" id="booking_time_0300"
						value="0300"> 11:00
					</label> <label class="btn btn-outline-secondary"> <input
						type="radio" name="booking_time" id="booking_time_0400"
						value="0400"> 12:00
					</label> <label class="btn btn-outline-secondary"> <input
						type="radio" name="booking_time" id="booking_time_0500"
						value="0500"> 13:00
					</label> <label class="btn btn-outline-secondary"> <input
						type="radio" name="booking_time" id="booking_time_0600"
						value="0600"> 14:00
					</label> <label class="btn btn-outline-secondary"> <input
						type="radio" name="booking_time" id="booking_time_0700"
						value="0700"> 15:00
					</label> <label class="btn btn-outline-secondary"> <input
						type="radio" name="booking_time" id="booking_time_0800"
						value="0800"> 16:00
					</label> <label class="btn btn-outline-secondary"> <input
						type="radio" name="booking_time" id="booking_time_0900"
						value="0900"> 17:00
					</label>
				</div>
			</div>



			<script>
	var booking_dt = ''; // 예약 날짜를 담을 변수

	// 달력 업데이트 함수
	function updateCalendar(year, month) {
	  var calendarBody = document.querySelector('.calendar tbody');
	  calendarBody.innerHTML = '';

	  var currentDate = new Date(year, month);
	  var currentYear = currentDate.getFullYear();
	  var currentMonth = currentDate.getMonth();
	  var firstDay = new Date(currentYear, currentMonth, 1).getDay();
	  var lastDay = new Date(currentYear, currentMonth + 1, 0).getDate();

	  var date = 1;
	  for (var i = 0; i < 6; i++) {
	    var row = document.createElement('tr');

	    for (var j = 0; j < 7; j++) {
	      var cell = document.createElement('td');
	      if (i === 0 && j < firstDay) {
	        // 빈 셀 추가
	      } else if (date > lastDay) {
	        // 날짜 범위를 초과한 경우 종료
	        break;
	      } else {
	        cell.textContent = date;

	        // 주말인 경우 클래스 추가하여 스타일링
	        if (isWeekend(currentYear, currentMonth, date)) {
	          cell.classList.add('weekend');
	        } else {
	          // 선택 가능한 날짜에 클릭 이벤트 리스너 추가
	          cell.addEventListener('click', selectDate);
	        }
	        date++;
	      }
	      row.appendChild(cell);
	    }
	    calendarBody.appendChild(row);
	  }

	  var monthYearLabel = document.querySelector('.calendar .month-year');
	  monthYearLabel.textContent = getFormattedMonthYear(currentMonth, currentYear);
	}

	// 주말인지 확인하는 함수
	function isWeekend(year, month, date) {
	  var day = new Date(year, month, date).getDay();
	  return day === 0 || day === 6; // 일요일(0)이나 토요일(6)인 경우 주말로 판단
	}

	// 선택된 날짜 처리 함수
	function selectDate() {
		
		
	  var calendarCells = document.querySelectorAll('.calendar td');
	  calendarCells.forEach(function(cell) {
	    cell.classList.remove('selected');
	  });
	  this.classList.add('selected');
	  var selectedDate = this.textContent;
	  var selectedYearMonth = currentYear + (currentMonth + 1).toString().padStart(2, '0');
	  var selectedDateFull = selectedYearMonth + selectedDate.toString().padStart(2, '0');

	  var currentDt = new Date();
	  var selectedDt = new Date(currentYear, currentMonth, this.textContent);
	  
	  if (selectedDt < currentDt) {
		removeSelectedClass(); // 날짜 초기화  
	    alert('예약날짜는 현재날짜 이후로 선택해주세요.');
	    return;
	  }
		
	  booking_dt = selectedDateFull; // 선택된 날짜를 booking_dt 변수에 할당
	  
	  console.log('booking_dt:', booking_dt);
	  
	  var staff_no;
	  var staff_name;
	  var activeBtns = document.querySelectorAll('.btn.active');
	  
	  activeBtns.forEach(function(btn) {
		  var divs = btn.querySelectorAll('div.col-6');
		  if (divs.length > 0) {
		    divs.forEach(function(div) {
		      var nameElement = div.querySelector('h5.card-title');
			  if (nameElement) {
			    staff_name = nameElement.textContent;
			  }
			  
		      var input = div.querySelector('input');
		      if (input) {
		      	staff_no = input.value;
		      }
		    });
		  }
		});
	  
	  if (typeof staff_no === 'undefined') { // 상담사 값이 없을 때
		  removeSelectedClass(); // 확정날짜 초기화
		  alert('상담사를 선택해주세요.');
		  return;
		}
	  
	  clearSelectedRadioButtons(); // 확정시간 초기화
	  
	  console.log("staff_no: "+staff_no);
	  getConfirmTime(booking_dt, staff_no);
	  /* document.write(booking_dt); // 웹페이지에 변수 값 출력 */

	  $("#booking_dt").val(booking_dt); // booking_dt 변수에 저장
	  $("#staff_no").val(staff_no); // staff_no 변수에 저장 */
	  $("#staff_name").val(staff_name); // staff_name 변수에 저장 */
	}
	
	/* 확정날짜 초기화 */
	function removeSelectedClass() {
		  var selectedElements = document.querySelectorAll('.selected'); // class가 'selected'인 요소들을 선택합니다.
		  
		  selectedElements.forEach(function(element) {
		    element.classList.remove('selected'); // 선택된 요소의 'selected' 클래스를 제거합니다.
		  });
		}
	
	/* 확정시간(라디오버튼) 초기화 */
	function clearSelectedRadioButtons() {
		  var radioButtons = document.querySelectorAll('input[type="radio"]:checked'); // 선택된 라디오 버튼을 선택합니다.
		  
		  radioButtons.forEach(function(radioButton) {
		    radioButton.checked = false; // 선택된 라디오 버튼의 상태를 해제합니다.
		  });
		}

	// 월과 연도를 포맷팅하는 함수
	function getFormattedMonthYear(month, year) {
	  var monthNames = ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'];
	  return monthNames[month] + ' ' + year;
	}

	var currentDate = new Date();
	var currentYear = currentDate.getFullYear();
	var currentMonth = currentDate.getMonth();

	updateCalendar(currentYear, currentMonth);

	var prevButton = document.querySelector('.calendar .prev');
	var nextButton = document.querySelector('.calendar .next');

	prevButton.addEventListener('click', function() {
	  currentMonth--;
	  if (currentMonth < 0) {
	    currentMonth = 11;
	    currentYear--;
	  }
	  updateCalendar(currentYear, currentMonth);
	});

	nextButton.addEventListener('click', function() {
	  currentMonth++;
	  if (currentMonth > 11) {
	    currentMonth = 0;
	    currentYear++;
	  }
	  updateCalendar(currentYear, currentMonth);
	});

	// 라디오 버튼 활성화
	function activateRadioButton() {
		const radioBtns = document.querySelectorAll('input[type="radio"][name="booking_time"]');
		
		radioBtns.forEach((radioBtn) => {
		  radioBtn.disabled = false;
		});
	}
	
	// 예약 날짜와 상담사 번호에 해당하는 예약 가능한 시간대를 가져와서 라디오 버튼 활성화, 비활성화 처리
 	function getConfirmTime(booking_dt, staff_no){ 		
		// jQuery를 이용한 AJAX 요청
		$.ajax({
		  url: "getDt",
		  method: "GET",
		  dataType: "json",
		  data: { 
			  booking_dt: booking_dt,
			  staff_no: staff_no
		  },
		  success: function(response) {	    
			  activateRadioButton()

		    response.forEach((booking) => {
		    	  var radioId = "booking_time_"+ booking.confirm_time;
		    	  const radioBtn = document.getElementById(radioId);
		    	  radioBtn.disabled = true;
		    	  
		    });
		  },
		  error: function(xhr, status, error) {
		    console.log(error);
		    // 에러 처리를 합니다.
		  }
		});
 	}
		</script>
			<br>
			<div align="center">
			<button type="submit" class="btn btn-warning" >다음</button>
			</div>
		</form>
	</div>
			<br>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>