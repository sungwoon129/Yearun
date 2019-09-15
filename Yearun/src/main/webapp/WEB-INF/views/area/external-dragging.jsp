<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<title>플래너</title>

<script type="text/javascript"
	src="/resources/html2Canvas/html2canvas.js"></script>
<script type="text/javascript"
	src="/resources/html2Canvas/test.js"></script>

<link href='/resources/fullcalendar-3.9.0/fullcalendar.min.css'
	rel='stylesheet' />
<link href='/resources/fullcalendar-3.9.0/fullcalendar.print.min.css'
	rel='stylesheet' media='print' />
<script src='/resources/fullcalendar-3.9.0/lib/moment.min.js'></script>
<script src='/resources/fullcalendar-3.9.0/lib/jquery.min.js'></script>
<script src='/resources/fullcalendar-3.9.0/lib/jquery-ui.min.js'></script>
<script src='/resources/fullcalendar-3.9.0/fullcalendar.min.js'></script>
<script type='text/javascript'>
	$(document).ready(function() {
// 		if (self.name != 'reload') {
// 	         self.name = 'reload';
// 	         self.location.reload(true);
// 	     }
// 	     else self.name = ''; 
		/* initialize the external events
		-----------------------------------------------------------------*/
		var cart = [];
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
				revert : true, // will cause the event to go back to its
				revertDuration : 0
			//  original position after the drag

			});

		});

		/* initialize the calendar
		-----------------------------------------------------------------*/

		$('#calendar').fullCalendar({
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'month,agendaWeek,agendaDay'
			},

			editable : false,
			droppable : true, // this allows things to be dropped onto the calendar
			drop : function(date) {
				// 						alert(date);
				//div를 드래그해서 드랍했을경우 그 날짜와 값을 배열에 담아준다.
				var day = date.format("YYYY-MM-DD");
				var position = $(this).html();

				cart.push({
					"date" : day,
					"title" : position
				});

				console.log(cart);
				// is the "remove after drop" checkbox checked?
				if ($('#drop-remove').is(':checked')) {
					// if so, remove the element from the "Draggable Events" list
					$(this).remove();
				}
			}
		});

		$("#SAVE").click(function(e) {

			//화면캡쳐
			e.preventDefault();
			var canvas = "";
			html2canvas($('#container').get(0)).then(function(canvas) {
				var base64encodedstring = canvas.toDataURL("image/jpeg", 1);
				// 			      $('#img').attr('src', base64encodedstring);

				// 			      $("#img").val(canvas.toDataURL("image/png"));
				// 			      Canvas2Image.saveAsPNG(canvas, document.body.clientWidth, document.body.clientHeight, "FILENAME");
				//location.href = canvas.toDataURL('image/png').replace(/^data:image\/png/, 'data:application/octet-stream');  
				$('#atag').attr('href', base64encodedstring);
				$('#imgSrc').val(canvas.toDataURL("image/png", 1));
				var areaCode = $('#areaCode').val();
				var imgSave = $("#imgSrc").val();
				var imgData = {
					"imgSrc" : imgSave,
					"areaCode" : areaCode
				};
				console.log(cart);
				//캡쳐파일 서버와 디비에 저장
				$.ajax({
					type : "post",
					data : imgData,
					url : "/maps/imageCreate",
					error : function(a, b, c) {
// 						alert("fail!!");

						//detail 테이블에 담을 객체들 배열로 넣기.
						var param = {};
						
						for(var i=0; i<cart.length; i++){
							param['cart['+i+'].date'] = cart[i].date;
							param['cart['+i+'].title'] = cart[i].title;
						}
						//detail에 일정담기
						$.ajax({
							type:"post",
							traditional : true,
							data:param,
							url:"/maps/planDetailAdd",
							success:function(){
								
// 			 					alert('통신성공');
							},
							error:function(){
								
								window.location.href = "/mybucket";
							}
						});//detail ajax 끝
					
					
					},
					success : function(data) {
// 						alert('통신성공');
						try {

						} catch (e) {
							//                             alert('server Error!!');
						}
					}
				});//캡쳐 ajax 종료

			});//html2 canvus 끝
			
		});//save 버튼(저장하기) 눌렀을때 끝


		/* initialize the external events
		-----------------------------------------------------------------*/

		$('#external-events div.external-event').each(function() {

			// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
			// it doesn't need to have a start or end
			var eventObject = {
				title : $.trim($(this).text())
			// use the element's text as the event title
			};

			// store the Event Object in the DOM element so we can get to it later
			$(this).data('eventObject', eventObject);

			// make the event draggable using jQuery UI
			$(this).draggable({
				zIndex : 999,
				revert : true, // will cause the event to go back to its
				revertDuration : 0
			//  original position after the drag
			});

		});

		/* initialize the calendar
		-----------------------------------------------------------------*/

	});
</script>


<style type='text/css'>
body {
	
	font-size: 14px;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
}

.total_wrap {
    margin: 0 auto;
    margin-top: 60px;
    width: 1000px;
    height: 550px;
}

#container {
	float: left;
	margin: 0 0 0 200px;
	width: 500px;
}
/* 목록출력 */
#external-events {
	margin-top: 6%;
	margin-left: 50px;
	display: inline-block;
	padding: 0px;
	width: 140px;
	border: 1px solid #ccc;
	background: white;
}

#external-events h4 {
	font-size: 16px;
	margin-top: 0;
	padding-top: 1em;
}

.external-event { /* try to mimick the look of a real event */
	margin: 10px 0;
	padding: 2px 4px;
	background: #3366CC;
	color: #fff;
	font-size: .85em;
	cursor: pointer;
}

#external-events p {
	margin: 1.5em 0;
	font-size: 11px;
	color: #666;
}

#external-events p input {
	margin: 0;
	vertical-align: middle;
}

#calendar {
	margin-top: 10%;
	display: inline-block;
	width: 500px;
}

.fc-header {
	margin-bottom: 20px;
}

.fc-header span {
	background-color: white;
	border: none;
}

.fc-view table {
	border: none;
}

.fc-sun {
	color: red;
}

.fc-sat {
	color: blue;
}

.SAVE {
	float: right;
	display: inline-block;
	margin-right: 105px;
}

.SAVE button {
	cursor: pointer;
	font-weight: bold;
	border: none;
	margin-top: 10px;
	padding: 2px;
	background-color: white;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="../gnb/GNB.jsp" flush="true" />
	</header>
	<div class="currentaddress">
      <div class="addressContents">
         
                  <img src="${pageContext.request.contextPath}/resources/images/home.png" class="home">
                   <p>&nbsp;&nbsp;&nbsp;&nbsp;> &nbsp;&nbsp;&nbsp;&nbsp;나만의 플랜</p>
           
            </div>
 </div>
	<div class="total_wrap">
		<div id="container">


			<div id='calendar'></div>


			<div style='clear: both'></div>
		</div>

		
		<div id='external-events'>
			<c:choose>
				<c:when test="${restaurantList.size() >0}">
					<c:forEach var="item" items="${restaurantList}" end="0">
						<input type="hidden" id="areaCode" value="${item.areaNo}">	
					</c:forEach>
				</c:when>
			</c:choose>
			
			<h4>호텔목록</h4>
			<c:choose>
				<c:when test="${hotelList.size() >0}">
					<c:forEach var="item" items="${hotelList}">
						<div class='fc-event'>${item.hotelName}</div>
					</c:forEach>
				</c:when>
			</c:choose>
			<h4>식당목록</h4>
			<c:choose>
				<c:when test="${restaurantList.size() >0}">
					<c:forEach var="item" items="${restaurantList}">
						<div class='fc-event'>${item.restaurantName}</div>
					</c:forEach>
				</c:when>
			</c:choose>
			<p>
				<input type='checkbox' id='drop-remove' checked /> <label
					for='drop-remove'>remove after drop</label>
			</p>

		</div>
		<div class="SAVE">
			<button id="SAVE">저장하기</button>
			<input type="hidden" name="imgSrc" id="imgSrc" value="" />
		</div>
	</div>
</body>
<footer>
	<jsp:include page="../gnb/footer.jsp" flush="true" />
	<jsp:include page="../chatting/openchat.jsp" flush="true" />
</footer>
</html>
