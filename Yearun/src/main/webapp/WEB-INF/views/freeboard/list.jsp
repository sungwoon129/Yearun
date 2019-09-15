<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link href="${pageContext.request.contextPath}/resources/css/userinfo.css" rel="stylesheet" type="text/css">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
  <meta charset="utf=8">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/freeboard.css" type="text/css">  



<title>여운_자유게시판</title>
 <jsp:include page="../gnb/GNB.jsp" flush="true" />
<!--  <script>
function listChange() {
	document.listChange.submit();
}
</script> -->
</head>
<body>
<div class="currentaddress">
		<div class="addressContents">
			
           		 <img src="${pageContext.request.contextPath}/resources/images/home.png" class="home">
           		  <p>&nbsp;&nbsp;&nbsp;&nbsp;> &nbsp;&nbsp;&nbsp;&nbsp;자유게시판</p>
           
            </div>
 </div>
<div class="fullBody">
            <h2 class="title">자유게시판</h2>
            <div class="searchLine">
            <div class="countArticle">
	새 글<span class="newArticle"> ${pager.todayTotal}</span><span>/${pager.vTotal}</span>
	</div>
	
	<div class="searchArea">
		<form> 
			<select name="search" class="category">
				<option value="free_title">제목</option>
				<option value="free_context">내용</option>
				<option value="id">작성자</option>
				<option value="all">제목+내용</option>
			</select>
				<input type="text" name="keyword" class="keywordArea">
			<input type="submit" class="submitBtn" value="검색">
		</form>
		
	</div>
	</div>
	<div class="contentsBox">
		<table class="articleList">
			<thead>
				<tr>
					<th id="code">번호</th>
					<th id="title">제목</th>
					<th id="writer">작성자</th>
					<th id="recommend">추천</th>
					<th id="regdate">작성일</th>
					<th id="ref">조회</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${nlist.size() > 0 }">
						<c:forEach var="nitem" items="${nlist}">
							<tr class="nItem">
								<td><img src="${pageContext.request.contextPath}/resources/images/notice/rednotice.png"></td>
								
								<td class="nTitle"><a href="${pageContext.request.contextPath}/notice/view?noticeCode=${nitem.noticeCode}">
									
								 ${nitem.noticeTitle}
									
								<c:set var="now" value="<%=new java.util.Date()%>" />
								<c:set var="sysDate">
								<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set> 
								<fmt:formatDate var="regDate" value="${nitem.regDate}" pattern="yyyy-MM-dd"/>
							
								<c:if test="${nitem.upFilename != null}">
								<img src="${pageContext.request.contextPath}/resources/images/file.jpg">
								</c:if>
								</a>
								
								</td>
								<td class="admin">${nitem.id}</td>
								<td>${nitem.recommend}</td>
								<td><fmt:formatDate value="${nitem.regDate}" pattern="yyyy-MM-dd"/></td>
								<td>${nitem.ref}</td>
						
							</tr>
						</c:forEach>
						</c:when>
						<c:otherwise>
						<tr>
							<td colspan="6">등록 된 게시물이 없습니다</td>
						</tr> 
					</c:otherwise>
					
				</c:choose>		
				
			
			
				<c:choose>
					<c:when test="${list.size() > 0 }">
						<c:forEach var="item" items="${list}">
				
							<tr>
								<td>${item.freeCode}</td>
								
								<td class="ftitle"><a href="view?freeCode=${item.freeCode}">
								<c:choose>
									<c:when test="${item.thumbnail != null and item.thumbnail != 'default'}">
										<img src="${item.thumbnail}" onError="javascript:this.src='/resources/images/snoimage_03.png'">
									</c:when>
									<c:otherwise>
										<img src="/resources/images/snoimage_03.png">
									</c:otherwise>
								</c:choose>
							<div class="limit"> 
								<c:if test="${item.groupLayer > 0}">
									 <c:forEach begin="1" end="${item.groupLayer}">&emsp;&emsp;&emsp; </c:forEach>
									 ㄴ
								</c:if>			
								 ${fn:substring(item.freeTitle,0,35)}<c:if test="${fn:length(item.freeTitle) > 35}">...</c:if>

								 	
								<c:set var="now" value="<%=new java.util.Date()%>" />
								<c:set var="sysDate">
								<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set> 
								<fmt:formatDate var="regDate" value="${item.regDate}" pattern="yyyy-MM-dd"/>
								<c:if test="${sysDate == regDate}">
								<img src="${pageContext.request.contextPath}/resources/images/new.jpg">
								</c:if>
								<c:if test="${item.freePhotoA != null}">
								<img src="${pageContext.request.contextPath}/resources/images/file.jpg">
								</c:if>
								</a>
									<c:if test="${item.totalComment>0}">
									<span class="commentArea"style="color:orangered;">[${item.totalComment}]</span> 
									</c:if>
									</div>
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
	</div>
		<div class="view_option">
			<form name="listChange"> 
				<select name="perPageOption" class="perPageOption" onchange="perList()">
					<option value="10" ${perPageOption == 10 ? 'selected' : '' }>10개 씩 보기</option>
					<option value="20" ${perPageOption == 20 ? 'selected' : '' }>20개 씩 보기</option>
					<option value="30" ${perPageOption == 30 ? 'selected' : '' }>30개 씩 보기</option>
					<option value="40" ${perPageOption == 40 ? 'selected' : '' }>40개 씩 보기</option>
					<option value="50" ${perPageOption == 50 ? 'selected' : '' }>50개 씩 보기</option>
				</select>
					
			</form>
			<script>
			function perList(){
				document.listChange.submit();
// 				$('.perePageOption').val('20').attr("selected","selected");
			}
			</script>
		</div>
	   <div class="addArticle">
            <a href="add"><img src="${pageContext.request.contextPath}/resources/images/add.jpg"></a>
            
        </div>
	
	
	
	${pager.pagination}
	
	
	 </div>
	
 <jsp:include page="../gnb/footer.jsp" flush="true" />
 <jsp:include page="../chatting/openchat.jsp" flush="true" />
 
</body>
</html>

