<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<%@ include file="../sessionCheck.jsp"%>
<link
	href="${pageContext.request.contextPath}/resources/css/goodbye.css"
	rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-latest.js"></script>
   <!-- The Modal -->
    <div id="goodbye" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
        <span class="X"><img src="/resources/images/mypage/X.png"  onClick="close_pop();" class="Ximg"></span>
      			<div class="topLine">
                <p><b><span style="font-size: 21.85pt;">비밀번호 확인</span></b></p> 
              
                <p class="modalText"><span>회원정보를 수정하기 위해 비밀번호를 입력해주세요.</span></p>
               
                </div>
                <div class="modalBox">
                
                <img src="/resources/images/mypage/boot.png" class="bootimg">
             	
                
               
                	<div class="formBox">
                		
           				<div class="idBox"><p><span><b>아이디</b></span></p> <span class="mid">${sessionScope.user}</span></div>     
                		<div class="pwBox"><p><span><b>비밀번호</b></span></p><span><input type="password" name="mpw" id="mpw" onkeyup="menterkey()"></span></div>
                		
                	</div>
                	<div class="checkPwBtn">
                	<button type="button" class="formButton" onclick="passModal()" ">확인</button>
                	</div>  
				    
					      
                </div>
            </div>
      </div>
      
      
      <script>
      function goodbye() {
    	     
     	 $('#goodbye').show();
      }
    //팝업 Close 기능
      function close_pop(flag) {
           $('#goodbye').hide();
      };
      
  
    	

    	function menterkey(){
    		   if(window.event.keyCode == 13){
    		      passModal();
    		   }
    		}

    	function passModal(){
    		var id = '${sessionScope.user}';
    		var pw= document.getElementById('mpw').value;

    		if(pw==""){
    			alert('비밀번호를 입력해 주세요');
    			form.mpw.focus();
    		}else{
    			var id = '${sessionScope.user}';
    			var pw= document.getElementById('mpw').value;
    			$.ajax({
    				url:'loginChk',
    				type:'post',
    				data:{
    					'id':id,
    					'pw':pw
    				},
    				success:function(data){
    					if(data == true){
    						
    						window.location.href="mypage";
    					}else{
    						alert('비밀번호를 확인하세요.');
    						return;
    					}
//    	 				form.submit();
    				}
    			});
    		
    		}
    	}
    	</script>
</head>
<body>
	<jsp:include page="../gnb/GNB.jsp" flush="true" />


	<div class="currentaddress">
		<div class="addressContents">

			<img
				src="${pageContext.request.contextPath}/resources/images/home.png"
				class="home">
			<p>&nbsp;&nbsp;&nbsp;&nbsp;>
				&nbsp;&nbsp;&nbsp;&nbsp;MyPage&nbsp;&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;&nbsp;회원탈퇴</p>

		</div>
	</div>
	<div class="fullbody">
		<div id="signup_title">회원탈퇴</div>
		<table class="mypageIndex">
			<thead>
				<tr>
					<th>마이페이지</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><a href="myArticle">내가 쓴 게시글</a></td>
				</tr>
				<tr>
					<td><a href="myComment">내가 쓴 댓글</a></td>
				</tr>
				<tr>
					<td><a href="mybucket">나의 버킷리스트</a></td>
				</tr>
				<tr>
					<td><a id="modal" onclick="goodbye()">내정보(회원정보)</a></td>
				</tr>
				<tr>
					<td class="current"><a href="goodbye">회원 탈퇴</a></td>
				</tr>
			</tbody>
		</table>
		<div class="goodByeBox">
			<div class="goodByeConfirm">
				<p>정말 여운에서 회원 탈퇴하시겠습니까?</p>
			</div>
			<div class="goodByeBox">
				<a href="/deleteUser"><div class="okay"><div class="okayText">확인</div></div></a><a href="/"><div class="cancel"><div class="cancelText">취소</div></div></a>
			</div>
		</div>
	</div>
	<jsp:include page="../gnb/footer.jsp" flush="true" />
	<jsp:include page="../chatting/openchat.jsp" flush="true" />
</body>
</html>