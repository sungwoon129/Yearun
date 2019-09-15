<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <jsp:include page="navi.jsp" flush="true" /> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여운_로그인</title>
<link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet" type="text/css">
 <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script> 
<script type="text/javascript">
$(document).ready(function() { 
	$("#login_btn").click(function(){
		login();
	
	});	
}); 
	


function enterkey(){
	   if(window.event.keyCode ==13){
	      login();
	   }
	}

function login(){
	var id = document.getElementById('id').value;
	var pw= document.getElementById('pw').value;

	if(id==""){
		alert('아이디를 입력해 주세요');
		form.id.focus();
	}else if(pw==""){
		alert('비밀번호를 입력해 주세요');
		form.pw.focus();
	}else{
		var id = document.getElementById('id').value;
		var pw= document.getElementById('pw').value;
		$.ajax({
			url:'loginChk',
			type:'post',
			data:{
				'id':id,
				'pw':pw
			},
			success:function(data){
				if(data == true){
					alert('환영합니다.');
					window.location.href="/";
				}else{
					alert('아이디나 비밀번호를 확인하세요.');
					return;
				}
// 				form.submit();
			}
		});
	
	}
}
</script>
</head>
<body>
<jsp:include page="./gnb/GNB.jsp" flush="true" />
<div class="currentaddress">
		<div class="addressContents">
			
           		 <img src="${pageContext.request.contextPath}/resources/images/home.png" class="home">
           		  <p>&nbsp;&nbsp;&nbsp;&nbsp;> &nbsp;&nbsp;&nbsp;&nbsp;로그인</p>
           
            </div>
 </div>
<form name="login" id="login">
 	<div class="allBox">
                <div class="loginbox">
                    <li><img id="pagetitle" src="${pageContext.request.contextPath}/resources/images/logo_shadow.png"/></li>
                    <li><input class="innertext" type="text" id="id" name="id" placeholder="ID"/></li>
                    <li><input class="innertext"  type="password" id="pw" name="id" placeholder="Password" onkeyup="enterkey();")/></li>
                    <li><div id="login_btn"><div class="btn_text" >로그인</div></div></li>
                    <li>
                    <a id="find_id" href="#" type="hidden"></a>
                        
                    <a id="find_pw" href="#" type="hidden"></a>
                        
                    <a id="sign_up"  href="${pageContext.request.contextPath}/acceptTerms" >회원가입</a>
                    </li>
                    </div>
                   <div id="naver_id_login" style="text-align:center"><a href="${url}">
					<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
                   
                </div>
            
            </form>
<jsp:include page="./gnb/footer.jsp" flush="true" />
</body>
</html>