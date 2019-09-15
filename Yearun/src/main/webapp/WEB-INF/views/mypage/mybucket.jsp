<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 일정표</title>
<%@ include file="../sessionCheck.jsp"%>
<link href='/resources/fullcalendar-3.9.0/fullcalendar.min.css'
	rel='stylesheet' />
<link href='/resources/fullcalendar-3.9.0/fullcalendar.print.min.css'
	rel='stylesheet' media='print' />
<script src='/resources/fullcalendar-3.9.0/lib/moment.min.js'></script>
<script src='/resources/fullcalendar-3.9.0/lib/jquery.min.js'></script>
<script src='/resources/fullcalendar-3.9.0/lib/jquery-ui.min.js'></script>
<script src='/resources/fullcalendar-3.9.0/fullcalendar.min.js'></script>

<script>
	var plannerCode = '${plannerCode}';

	$(document)
			.ready(
					function() {

						/* initialize the external events
						-----------------------------------------------------------------*/

						$('#external-events .fc-event').each(function() {

							// store data so the calendar knows to render an event upon drop
							$(this).data('event', {
								title : $.trim($(this).text()), // use the element's text as the event title
								stick : true
							// maintain when user navigates (see docs on the renderEvent method)
							});

							// make the event draggable using jQuery UI
							$(this).draggable({
								zIndex : 999,
								revert : false, // will cause the event to go back to its
								revertDuration : 0
							//  original position after the drag
							});

						});

						/* initialize the calendar
						-----------------------------------------------------------------*/

						$('#calendar')
								.fullCalendar(
										{

											events : function(start, end,
													timezone, callback) {

												$
														.ajax({
															url : '/myPlan',
															data : {
																"plannerCode" : plannerCode
															},
															dataType : 'json',
															success : function(
																	plan) {
																console
																		.log(plan.plan[0].date);
																//선택한 지역의 이름 뽑아와서 넣어주기
																document
																		.getElementById("areaName").innerHTML = plan.plan[0].areaName;
																var events = [];
																console
																		.log(plan);

																for (var i = 0; i < plan.plan.length; i++) {
																	events
																			.push({
																				title : plan.plan[i].title,
																				start : plan.plan[i].date,
																			});
																}
																callback(events);
															}
														}); //ajax 끝
											},

											header : {
												left : 'prev,next today',
												center : 'title',
												right : 'month,agendaWeek,agendaDay'
											},
											editable : false,//일정짠거 변경 불가능하게 만들기
											droppable : false, // this allows things to be dropped onto the calendar
											drop : function() {
												// is the "remove after drop" checkbox checked?
												if ($('#drop-remove').is(
														':checked')) {
													// if so, remove the element from the "Draggable Events" list
													$(this).remove();
												}
											}
										});

					});
</script>
<style>
body {
	font-size: 14px;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
}

#wrap {
	width: 1024px;
	margin: 0 auto;
}

#calendar {
	margin: 0 auto;
	width: 900px;
}

#areaName {
	margin-top: 150px;
	text-align: center;
	margin-bottom: 50px;
}

.btnBox {
	text-align: center;
	margin: 0 auto;
	margin-top: 30px;
	margin-bottom: 30px;
}

.btnList {
	display: inline-block;
	width: 90px;
	height: 30px;
	background: #414141;
	color: white;
	padding-top: 10px;
	border-radius: 3em;
}

a {
	cursor: pointer;
	color: white;
	font-size: 18px;
}
</style>
</head>
<body>
	<jsp:include page="../gnb/GNB.jsp" flush="true" />
	<div class="currentaddress">
		<div class="addressContents">

			<img
				src="${pageContext.request.contextPath}/resources/images/home.png"
				class="home">
			<p>&nbsp;&nbsp;&nbsp;&nbsp;> &nbsp;&nbsp;&nbsp;&nbsp;MyPage
				&nbsp;&nbsp;&nbsp;&nbsp;> &nbsp;&nbsp;&nbsp;&nbsp;나만의 플랜</p>
		</div>
	</div>
	<h1 id="areaName"></h1>
	<div id='wrap'>
		<div id='calendar'></div>

		<div style='clear: both'></div>
		<div class="btnBox">
			<div class="btnList">
				<a
					href="/myBucketDelete?plannerCode=${plannerCode}&myPhoto=${myPhoto}">삭제</a>
			</div>
			<div class="btnList">
				<a href="/upload/${myPhoto}" download="yearun.png">다운로드</a>
			</div>
			<div class="btnList">
				<a href="/mybucket">목록</a>
			</div>
		</div>
	</div>


	<jsp:include page="../gnb/footer.jsp" flush="true" />
	<jsp:include page="../chatting/openchat.jsp" flush="true" />
</body>
</html>