<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
	<c:if test="${sessionScope.user == null}">
	
	<script>
	alert("로그인 하신 후에 사용해주세요");
	location.href="${pageContext.request.contextPath}/login";
	</script>
	</c:if>	
</head>
<body>

</body>
</html>