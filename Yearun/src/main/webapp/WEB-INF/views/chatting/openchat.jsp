<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%-- <%@ include file="sessionCheck.jsp"%> --%>
<style>
   		#gochat{
   		position: fixed;
   		right:10px; bottom:10px;
   		}
   </style>

</head>
<body>
	 <div id="gochat">
            	<a href ="#" onclick="gochat()"> <img id ="chaticon" src="${pageContext.request.contextPath}/resources/images/chat.png"/></a>
       </div>
       <script>
    	function gochat(){
    		var id = '${sessionScope.user}';
    		var popUrl = "/chatting/chat";	//팝업창에 출력될 페이지 URL
    		 var scWidth = screen.availWidth;
    		 var scHeight = screen.availHeight;
			console.o
    		 var left = (parseInt(scWidth)+550)/2;   
    		 var top = (parseInt(scHeight)-440)/2;  
    		var popOption = "width=670, height=680, resizable=no, scrollbars=no, status=no, top="+top+", left="+left+"" ;    //팝업창 옵션(optoin)
    			if(id==''){
    				alert("로그인 후에 이용하세요.");
    				location.href="${pageContext.request.contextPath}/login";
    			}else{
				window.open(popUrl,'chat',popOption);
    			}	
    		};



    	
   </script>
</body>
</html>