<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
  <meta charset="utf=8">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/notice.css" type="text/css">  
<style>

.newArticle{
	color:orange;
	font-weight:bold;
}

</style> 

<title>여운_공지사항</title>
 <jsp:include page="../gnb/GNB.jsp" flush="true" />
</head>
<body>
<div class="currentaddress">
		<div class="addressContents">
			
           		 <img src="${pageContext.request.contextPath}/resources/images/home.png" class="home">
           		  <p>&nbsp;&nbsp;&nbsp;&nbsp;> &nbsp;&nbsp;&nbsp;&nbsp;공지사항</p>
           
            </div>
 </div>
	<div class="fullBody">
            <h2 class="title">공지&nbsp;사항</h2>
            <div class="countArticle">
	새 글<span class="newArticle"> ${pager.todayTotal}</span><span>/${pager.vTotal}</span>
	</div>
	<div class="searchArea">
		<form> 
			<select name="search" class="category">
				<option value="notice_title">제목</option>
				<option value="notice_context">내용</option>
				<option value="id">작성자</option>
				<option value="all">제목+내용</option>
			</select>
				<input type="text" name="keyword" class="keywordArea">
			<input type="submit" class="submitBtn" value="검색">
		</form>
		
	</div>
	
		<table class="articleList">

			<thead>
				<tr>
					<th>번호</th>
					<th class="123">제목</th>
					<th>작성자</th>
					<th>추천</th>
					<th>작성일</th>
					<th>조회</th>
		
				</tr>
			</thead>
			
			<tbody>
				<c:choose>
					<c:when test="${list.size() > 0 }">
						<c:forEach var="item" items="${list}">
							<tr>
								<td><img src="${pageContext.request.contextPath}/resources/images/notice/noticeIcon.jpg"></td>
								
								<td class="ntitle"><a href="view?noticeCode=${item.noticeCode}">
									
								 ${item.noticeTitle}
								 	
								<c:set var="now" value="<%=new java.util.Date()%>" />
								<c:set var="sysDate">
								<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set> 
								<fmt:formatDate var="regDate" value="${item.regDate}" pattern="yyyy-MM-dd"/>
								<c:if test="${sysDate == regDate}">
								<img src="${pageContext.request.contextPath}/resources/images/new.jpg">
								</c:if>
								<c:if test="${item.upFilename != null}">
								<img src="${pageContext.request.contextPath}/resources/images/file.jpg">
								</c:if>
								</a>
								
								</td>
								<td>${item.id}</td>
								<td>${item.recommend}</td>
								<td><fmt:formatDate value="${item.regDate}" pattern="yyyy-MM-dd"/></td>
								<td>${item.ref}</td>
						
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="6">등록 된 게시물이 없습니다</td>
						</tr> 
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		
	   <div class="addArticle">
	   <c:if test="${sessionScope.user == 'admin' }">
            <a href="add"><img src="${pageContext.request.contextPath}/resources/images/add.jpg"></a>
            </c:if>
        </div>
	
	
	
	${pager.pagination}
	
	
	 </div>
	
 <jsp:include page="../gnb/footer.jsp" flush="true" />
 <jsp:include page="../chatting/openchat.jsp" flush="true" />
</body>
</html>
