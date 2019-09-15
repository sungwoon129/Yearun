<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보입력</title>
  <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/complete.css" rel="stylesheet" type="text/css">
<jsp:include page="../gnb/GNB.jsp" flush="true" />

</head>

<body>



	<form id="signup_form">
		<div id="signup_box">
			<div id="signup_title">회원가입</div>

			<div class="signup_index">
				<ul>
					<div id="rectangle1">
						<ol id="r_text1">약관동의
						</ol>
					</div>
					<div id="rectangle2">
						<ol id="r_text2">회원정보입력
						</ol>
					</div>
					<div id="rectangle3">
						<ol id="r_text3">가입완료
						</ol>
					</div>
				</ul>
			</div>

			<div class="complete_text1">여운 회원가입이 완료되었습니다.</div>
			<div class="complete_text2">여운에서 다양한 정보와 서비스를 만나보세요.</div>

			<li>
				<div class="IDalertbox">
					<div class="complete_img">
						<img src="${pageContext.request.contextPath}/resources/images/complete_icon.png" />
					</div>
					<div class="complete_text3">환영합니다! 가입완료가 되었습니다.</div>
				</div>
			</li>

			<hr class="complete_btline">

		   <!-- <div class="homeBtn"><button id="confirm_btn" onclick="homeButton();" >홈으로</button></div> -->
			<INPUT TYPE="button" onClick="location.href='/'" id="confirm_btn" value="홈으로">
		</div>
	</form>

 <jsp:include page="../gnb/footer.jsp" flush="true" />
</body>

</html>