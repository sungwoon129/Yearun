<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>채팅</title>
  <style>
    *{
      margin: 0%;
      padding: 0%;
    }
      .moozi{
          width: 100%;
          
              margin:0;
          padding: 0;
      }
  </style>
  <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

    <jsp:include page="gnb/GNB.jsp" flush="true" />
  </head>
  
  <body>
     
   
      
      <div>
        <img src="${pageContext.request.contextPath}/resources/images/404img.jpg" class="moozi">
      </div>
  <jsp:include page="gnb/footer.jsp" flush="true" />
  <jsp:include page="chatting/openchat.jsp" flush="true" />
  </body>
    
</html>