<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>자주묻는 질문</title>
  <style>

  </style>
<link href="${pageContext.request.contextPath}/resources/css/question.css" rel="stylesheet" type="text/css">      
 <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script> 
 <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/question.js"></script>     
  </head>
  
  <body>
<jsp:include page="./gnb/GNB.jsp" flush="true" />   
 <div class="currentaddress">
		<div class="addressContents">
			
           		 <img src="${pageContext.request.contextPath}/resources/images/home.png" class="home">
           		  <p>&nbsp;&nbsp;&nbsp;&nbsp;> &nbsp;&nbsp;&nbsp;&nbsp;FAQ</p>
           
         </div>
 </div>  
      <div class="fullBody">
            <h2 class="title">FAQ</h2>
          
        <div class="questionBox">
            <div class="mark">
            Q
            </div><div class="questionContent">
        	   <span class="qtext"> 여행 플랜은 어떻게 짜면 되나요?</span>
            <span class="more">
        	    <span class="blind">더보기 V</span>
            </span> 
           </div>
            <table class="board">
<!--   <div class="list"> -->
<tbody class="answerColor">
  <tr><th class="answer">A.
  </th>
  <th class="answerContent">
먼저 홈페이지에서 로그인 하시고 '여행지 등록'탭에 가셔서 원하시는 여행지를 클릭하신후 마음에 드시는 호텔,음식점등을 선택하시면 됩니다.
</th>
</tr>
</tbody>
</table>
</div>   

        <div class="questionBox">
            <div class="mark">
            Q
            </div><div class="questionContent">
        	    <span class="qtext">회원탈퇴를 하고싶어요.</span>
            <span class="more2">
        	    <span class="blind2">더보기 V</span>
            </span> 
           </div>
            <table class="board2">
<!--   <div class="list"> -->
<tbody class="answerColor">
  <tr><th class="answer">A.
  </th>
  <th class="answerContent">
로그인 하신 후, 상단에 Mypage에 가셔서 본인인증절차를 거친후에 왼쪽탭에서 회원탈퇴신청을 하시면, 관리자가 심사를 거쳐 승인해드립니다.	
</th>
</tr>
</tbody>
</table>
</div>

        <div class="questionBox">
            <div class="mark">
            Q
            </div><div class="questionContent">
        	   <span class="qtext">  내가 다녀온 플랜을 다른 사람들과 공유하고 싶어요.</span>
            <span class="more3">
        	    <span class="blind3">더보기 V</span>
            </span> 
           </div>
            <table class="board3">
<!--   <div class="list"> -->
<tbody class="answerColor">
  <tr><th class="answer">A.
  </th>
  <th class="answerContent">
여행지 등록탭에 가셔서 원하시는 여행지와 호텔,식당을 선택하신 후에 버킷리스트에 담아 등록버튼을 누르게 되면 나만의 플랜을 만든 후에 저장할 수 있습니다. 그 후에 후기게시판에
사진을 첨부하셔서 회원님의 플랜을 공유할 수 있습니다.
</th>
</tr>
</tbody>
</table>
</div>

        <div class="questionBox">
            <div class="mark">
            Q
            </div><div class="questionContent">
        	    <span class="qtext"> 사진이 정상적으로 첨부가 되지 않아요</span>
            <span class="more4">
        	    <span class="blind4">더보기 V</span>
            </span> 
           </div>
            <table class="board4">
<!--   <div class="list"> -->
<tbody class="answerColor">
  <tr><th class="answer">A.
  </th>
  <th class="answerContent">
죄송합니다. 저희 사진업로드 시스템에 작은 버그가 있어서 게시글에 단일 사진만 등록하게 되면 정상적으로 사진이 출력되지 않는 버그가 있습니다. 대단히 죄송하지만 사진 앞,뒤로 텍스트를 추가해서 등록해주시면 감사하겠습니다.
</th>
</tr>
</tbody>
</table>
</div>

        <div class="questionBox">
            <div class="mark">
            Q
            </div><div class="questionContent">
        	   <span class="qtext">   아이디와 비밀번호를 잊어버렸어요.</span>
            <span class="more5">
        	    <span class="blind5">더보기 V</span>
            </span> 
           </div>
            <table class="board5">
<!--   <div class="list"> -->
<tbody class="answerColor">
  <tr><th class="answer">A.
  </th>
  <th class="answerContent">
로그인 창에서 아이디와 비밀번호 찾기를 누르신 후 적합한 본인인증절차후에 안내해드리고있습니다.
</th>
</tr>
</tbody>
</table>
</div>



           
        </div>

     
  <jsp:include page="./gnb/footer.jsp" flush="true" />  
  <jsp:include page="./chatting/openchat.jsp" flush="true" />
  </body>
    
</html>