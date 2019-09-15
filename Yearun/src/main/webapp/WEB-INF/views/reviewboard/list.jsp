<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reviewboard.css" type="text/css">  
<style>



</style>
<meta charset="UTF-8">
<title>여운_후기게시판</title>
<jsp:include page="../gnb/GNB.jsp" flush="true" />
</head>
<body>
	
	<div class="currentaddress">
		<div class="addressContents">
			
           		 <img src="${pageContext.request.contextPath}/resources/images/home.png" class="home" >
           		  <p>&nbsp;&nbsp;&nbsp;&nbsp;> &nbsp;&nbsp;&nbsp;&nbsp;후기게시판</p>
           
            </div>
 </div>
 <div class="fullBody">
             <h2 class="title">후기게시판</h2>
            <div class="countArticle">
	새 글<span class="newArticle"> ${pager.todayTotal}</span><span>/${pager.vTotal}</span>
	</div>
	<div class="searchArea">
		<form> 
			<select name="search" class="category">
				<option value="review_title">제목</option>
				<option value="review_context">내용</option>
				<option value="id">작성자</option>
				<option value="all">제목+내용</option>
			</select>
				<input type="text" name="keyword" class="keywordArea">
			<input type="submit" class="submitBtn" value="검색">
		</form>
		
	</div> 
	<c:set var="i" value="0" />
	<c:set var="j" value="4"/>
	<table class="contentsTable">
	<c:choose>
				<c:when test="${list.size()>0}">
						<c:forEach var="item" items="${list}" varStatus="status" >
						<c:if test="{i%j == 0}">
						<tr>
						</c:if>
							<td><div class="articleBox"><div class="articleImage"><a href="view?reviewCode=${item.reviewCode}">
<%-- 							<c:choose>
								<c:when test="${item.reviewPhotoA != null}">
							<img src="/upload/${item.reviewPhotoA}" class="reviewimage" onError="javascript:this.src='/resources/images/review/noimage.png'" /></a>
							
							</c:when>
							<c:otherwise>
							<img src="/resources/images/review/noimage.png" class="reviewimage"></a>
							</c:otherwise> --%>
<%-- 							</c:choose> --%>
							<c:choose>
									<c:when test="${item.thumbnail != null and item.thumbnail != 'default'}">
										<img src="${item.thumbnail}">
									</c:when>
									<c:otherwise>
										<img src="/resources/images/review/noimage.png" onError="javascript:this.src='/resources/images/review/noimage.png'" >
									</c:otherwise>
								</c:choose>
							
							</div>
							
							 <div class="articleTitle"><a href="view?reviewCode=${item.reviewCode}"><span class="reviewTitle"> 
							 ${fn:substring(item.reviewTitle,0,10)}<c:if test="${fn:length(item.reviewTitle) > 10}">...</c:if></span>
							 
							  <c:if test="${item.totalComment>0}">
									<span class="comment">[${item.totalComment}]</span> 
									</c:if> 
									
							 </a></div>
							
							 <div class="articleinfo">
							<span>${item.id}</span><span class="articleRec">추천: ${item.recommend}</span>
							<div class="articleDate"><fmt:formatDate value="${item.regDate}" pattern="yyyy-MM-dd"/></div>
							</div>
							</div></td>
							
						<c:if test="${i%j == j-1}">
						</tr>
						</c:if>
						 <c:set var="i" value="${i+1}" />


					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td>게시글이 존재하지 않습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
 	   <div class="addArticle">
            <a href="add"><img src="${pageContext.request.contextPath}/resources/images/add.jpg"></a>
            
        </div> 
		
	</div>
	<div>${pager.pagination}</div> <!--   getPagination 호출 -->
	</div>
	 <jsp:include page="../gnb/footer.jsp" flush="true" />
	 <jsp:include page="../chatting/openchat.jsp" flush="true" />

</body>
</html>