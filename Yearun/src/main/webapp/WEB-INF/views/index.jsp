<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>여운</title>
        <link href="resources/css/index.css" rel="stylesheet" type="text/css">
        <link href="resources/css/slide.css" rel="stylesheet" type="text/css">
    <script
            src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" 
                crossorigin="anonymous"></script>
        
           <jsp:include page="gnb/GNB.jsp" flush="true" /> 
   
    </head>
        <body>
             
            <div id="contain">
                <div class="slider">
                <figure>
                    <div>
                    <img id="mainimage" src="resources/images/train.png" alt="메인이미지"/>
                    </div>
                      <div>
                    <img id="mainimage" src="resources/images/slide1.png" alt="메인이미지"/>
                    </div>
                      <div>
                    <img id="mainimage" src="resources/images/slide2.png" alt="메인이미지"/>
                    </div>
                      <div>
                    <img id="mainimage" src="resources/images/slide3.png" alt="메인이미지"/>
                    </div>
                      <div>
                    <img id="mainimage" src="resources/images/train.png" alt="메인이미지"/>
                    </div>
                </figure>
                </div>
            </div>
            
           
            
        <div class="bannerdiv">
            <li>
                <div id="banner1">
                     <a href="tour/flower#tab1">
                    <div class="bannerBox1">
                        
                        <h1 id="b_text1">FLOWER</h1>
                        <div class="small_text_l">따스한 햇볕을 쬐며 꽃놀이 여행를 원한다면 이곳을</div>
                        <div class="small_text_l">선택해보세요.</div>
                        <img class="banner_l" src="resources/images/flower.png" alt="flower">
                    </div>
                </a>
             </div>
            
            
            
                <div id="banner2">
                    <a href="tour/water#tab1">
                    <div class="bannerBox2">
                        
                        <h1 id="b_text2">WATER</h1>
                        <div class="small_text_r">뜨거운 햇볕 아래 물놀이를 떠나기를 원한다면 이곳을</div>
                        <div class="small_text_r">선택해보세요.</div>
                        <img class="banner_r" src="resources/images/water.png" alt="water">
                    </div>
                    </a>    
                </div>
            </li>
                
            <li>
                <div id="banner3">
                    <a href="tour/mountain#tab1">
                    <div class="bannerBox3">
                        
                        <h1 id="b_text3">MOUNTAIN</h1>
                        <div class="small_text_l">자연과 함께 걷고 멋진 풍경을 감상하는 멋진 여행을</div>
                        <div class="small_text_l">원한다면 이곳을 선택해보세요.</div>
                        <img class="banner_l" src="resources/images/mountain.png" alt="mountain">
                    </div>
                    </a>
                </div>
            
            
            
                <div id="banner4">
                    <a href="tour/festival#tab1">
                    <div class="bannerBox4">
                        
                        <h1 id="b_text4">FESTIVAL</h1>
                        <div class="small_text_r">신나는 공연을 보며 여행을 떠나기를 원한다면 이곳을 </div>
                        <div class="small_text_r">선택해보세요.</div>
                        <img class="banner_r" src="resources/images/festival.png" alt="festival">
                    </div>
                    </a>
                </div>
            </li>
            </div>
            
            
            
            
            
           <div id="review">
                <div class="rv_title">후기게시판</div>
                <div id="rv_text1">당신의 여행을 공유 해보세요.</div>
               
                
               <div class="reviewContentBox">   
            <c:choose>
               <c:when test="${rlist.size() > 0 }">
                  <c:forEach var="ritem" items="${rlist}">
                  <div class="reviewBox">
                     <a class="rv_image" href="${pageContext.request.contextPath}/reviewboard/view?reviewCode=${ritem.reviewCode}">
                     <c:choose>
                        <c:when test="${ritem.thumbnail != null and ritem.thumbnail != 'default'}">
                           <img class="circle1" src="${ritem.thumbnail}" onError="javascript:this.src='/resources/images/review/noimage.png'" />
                        </c:when>
                        <c:otherwise>
                           <img src="/resources/images/review/noimage.png" onError="javascript:this.src='/resources/images/review/noimage.png'" class="circle1" >
                        </c:otherwise>
                     </c:choose>   
                        </a>
                        <div class="rv_titleBox">
                     
                           <a class="rv_cstitle" href="${pageContext.request.contextPath}/reviewboard/view?reviewCode=${ritem.reviewCode}">
                            ${fn:substring(ritem.reviewTitle,0,7)}<c:if test="${fn:length(ritem.reviewTitle) > 7}">...</c:if>
                           </a>
                        
                        </div>
                        <div class="rv_contentsBox">
                        <a class="rv_csContents1" href="${pageContext.request.contextPath}/reviewboard/view?reviewCode=${ritem.reviewCode}">
                        ${fn:substring(ritem.reviewContext,0,10)}<c:if test="${fn:length(ritem.reviewContext) > 10}">...</c:if>
                        </a>
                        </div>
                     
                  </div>
                  
                  </c:forEach>
               </c:when>
               <c:otherwise>
               등록된 후기가 없습니다.
               </c:otherwise>
            </c:choose>
               
                
                </div>
           
            </div>
        
            <div id="board">
                
                <div class="boardBox">    
                <h1 class="board_1">공지사항</h1> <a class="more" href="notice/list">자세히보기</a><h1 class="board_2">자유게시판</h1><a class="more" href="/freeboard/list">자세히보기</a>
                    <div id="board_1_block">
                       <c:choose>
               <c:when test="${nlist.size() > 0 }">
                  <c:forEach var="nitem" items="${nlist}">
                  <div class="narticle">
                        <a href="${pageContext.request.contextPath}/notice/view?noticeCode=${nitem.noticeCode}">   
                         <span>${fn:substring(nitem.noticeTitle,0,20)}<c:if test="${fn:length(nitem.noticeTitle) > 20}">...</c:if></span>
                         <br>
                        </a>      
                  </div>
                  </c:forEach>
                  </c:when>
                  <c:otherwise>
                  
                  <p>등록 된 게시물이 없습니다</p>
                  
               </c:otherwise>
            </c:choose>      
                        </div>
                        <div id="board_2_block">
                      <c:choose>
               <c:when test="${flist.size() > 0 }">
                  <c:forEach var="fitem" items="${flist}">
                  <div class="farticle">
                        <a href="${pageContext.request.contextPath}/freeboard/view?freeCode=${fitem.freeCode}">   
                         <span>${fn:substring(fitem.freeTitle,0,25)}<c:if test="${fn:length(fitem.freeTitle) > 25}">...</c:if></sapn> 
                         <br>
                        </a>      
                     </div>   
                  </c:forEach>
                  </c:when>
                  <c:otherwise>
                  
                  <p>등록 된 게시물이 없습니다</p>
                  
               </c:otherwise>
               
            </c:choose>      
                        </div>
                    </div>
                </div>
        
            
            <div id="list">
                <div class="listContent">
                <img id="icon" src="resources/images/list.png"/>
                <a href="#">
                <a href="/maps/add"><img id="button" src="resources/images/button.png"/></a>
                </a>
                <div class="list_title"><p class="tq">여행 계획 리스트 만들기</p></div>
                <div class="list_text">여행을 가고싶은 여행지 숙박 맛집등등 계획을 짜보세요</div>
                    </div>
            </div>
            
    <jsp:include page="gnb/footer.jsp" flush="true" />
    <jsp:include page="chatting/openchat.jsp" flush="true" />
        </body>

</html>