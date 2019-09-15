	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




<html>
<head>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>
  
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/view.css" type="text/css">  
<title>등록</title>
 <jsp:include page="../gnb/GNB.jsp" flush="true" />
<script>
$(document).ready(function() {
	var reviewCode = ${item.reviewCode};
	var id = '${sessionScope.user}';
	var recommendImage = $('.recommendChange');
	
	$.ajax({
		url: '/reviewboard/checkRecommend',
		type: 'POST',
		data: {'reviewCode':reviewCode,'id':id},
		success:function(data){
			if(data == 1){
				$('.recommendChange').attr('src','${pageContext.request.contextPath}/resources/images/yesrecommend.png')
				
			}
			
		}	
	});
	
	
});

function enterkey(){
	   if(window.event.keyCode ==13){
		   var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
		    commentInsert(insertData); //Insert 함수호출(아래)
	   }
	}
	
function deleteBtn(){
    result = confirm('정말 삭제 하시겠습니까?');
    if(result == true){
        location.href = 'delete?reviewCode=${item.reviewCode}';
    }else{
    return false;
    }
}



</script>
</head>
<body>
<div class="fullBody">
<div class="currentaddress">
		<div class="addressContents">
			
           		 <img src="${pageContext.request.contextPath}/resources/images/home.png" class="home" >
           		  <p>&nbsp;&nbsp;&nbsp;&nbsp;> &nbsp;&nbsp;&nbsp;&nbsp;후기게시판</p>
           
            </div>
 </div>
 	<div class="contentsArea">
	   <h2 class="title">후기게시판</h2>
	   
	   

	 
		<div class="line_one"><span class="freeTitle">${item.reviewTitle}</span> <span class="temper">후기게시판</span> <span class="regDate"><fmt:formatDate
					value="${item.regDate}" pattern="yyyy-MM-dd hh:mm" /></span>
		</div>
		<div class="line_two">
			 
			 <span class="writer_el">${item.id}</span><span class="recommendBtn">
			<%--  <c:choose>
			 	<c:when test="${countRecommend == 1}">
			 <button class="recommendLink"><img src="${pageContext.request.contextPath}/resources/images/yesrecommend.jpg"></button>
			 </c:when>
			 <c:otherwise>
			 <button class="recommendLink"><img src="${pageContext.request.contextPath}/resources/images/norecommend.jpg"></button>
			 </c:otherwise>
			 </c:choose> --%>
			 <button class="recommendLink"><img src="${pageContext.request.contextPath}/resources/images/norecommend.jpg" class="recommendChange"></button>
			</span>
		</div>
	
		<div class="freeContents">${item.reviewContext}</div>

		
		<div class="attach">
			<span class="attachText">첨부파일:</span> <span><a href="${pageContext.request.contextPath}/upload/${item.reviewPhotoA}" target="_blank">${item.reviewPhotoA}</a></span>
		</div>
	 	<script>
		$('.recommendLink').click(function(){
		var reviewCode = ${item.reviewCode};
		var id = '${sessionScope.user}';
		var recommendImage = $('.recommendChange');
		
		$.ajax({
			url: '/reviewboard/recommend',
			type: 'POST',
			data: {'reviewCode':reviewCode,'id':id},
			success:function(data2){
				if(data2 == 1){
					alert('이미 추천한 게시글입니다.')
					return;
				}
				else{
					
				
// 					$('.recommendChange').attr('src','${pageContext.request.contextPath}/resources/images/yesrecommend.png');
				
					window.location.reload(true);
				}	
			}	
		});
		});
		
		</script>
		 
		
		<div class="line_three">
			<span>댓글</span><span class="totalComment">${item.totalComment}</span><span class="ref">조회수</span> <span class="ref_el">${item.ref}</span><span class="recommend">추천</span> <span class="recommend_el">${item.recommend}</span>
		</div>
	

		
	</div>
	
		

<div class="commentBox">
	
<div class="commentList"></div>
	
<div class="container">
       
        <form name="commentInsertForm">
            <div class="input-group">
               <input type="hidden" name="reviewCode" value="${item.reviewCode}"/>
         <c:if test="${sessionScope.user != null}">
               <script>
			    $(document).ready(function(){
					$('input[name="content"]').removeAttr('disabled','disabled');
					$('input[name="content"]').removeAttr('placeholder','로그인 후 이용하실 수 있습니다.');
			
			   
		
			  });
				
			    
				</script>
				</c:if>
				
               <input type="text" class="form-control" id="content" name="content" placeholder="로그인 후 이용하실 수 있습니다." disabled="disabled" onkeydown="enterkey()">
               <span class="input-group-btn">
                    <button class="commentBtn" type="button" name="commentInsertBtn">등록</button>
               </span>
              </div>
        </form>
    </div>
     
    <div class="container">
       
    </div>

</div>

<div class="btnList">

	<div class="btnposition">

<c:choose>
		<c:when test="${sessionScope.user == item.id or sessionScope.user == admin}">
			<button class="update"><a href="update?reviewCode=${item.reviewCode}"><img src="${pageContext.request.contextPath}/resources/images/update.jpg"></a></button>	
			<button class="delete" onclick="deleteBtn()"><img src="${pageContext.request.contextPath}/resources/images/delete.jpg"></button>
		</c:when>
		<c:otherwise>
	
		</c:otherwise>

</c:choose>

<button class="list"><a href="list"><img src="${pageContext.request.contextPath}/resources/images/list.jpg"></a></button>
</div>	
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/moment_min.js"></script>
<script>

window.onload = function(){
	var reviewCode = ${item.reviewCode};
	 commentList(reviewCode);
}


var reviewCode = ${item.reviewCode} //게시글 번호
 
$('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
    var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
    commentInsert(insertData); //Insert 함수호출(아래)
});
 
 
 
//댓글 목록 
function commentList(reviewCode){
var session = '${sessionScope.user}';  
var admin = 'admin';
var reviewCode = ${item.reviewCode}
	
    $.ajax({
        url : '/rcomment/list',
        type : 'get',
		 data : {'reviewCode':reviewCode},
		 dataType:'JSON',
        success : function(response){
        	
        	
            var a =''; 
            $.each(response, function(key, value){ 
            	var cRegDate=moment(value.regDate).format('YYYY.MM.DD. HH:mm');
                a += '<div class="commentArea" style="border-bottom:1px dotted gray; margin-bottom: 15px;">';
                a += '<div class="writerLine"><div class="commentInfo'+value.cno+'">'+ '<span class="commentWriter">'+value.id+'</span>';
               
                a += '<span class="cRegDate">'+cRegDate+'</span>';
                if(value.id == session || session == admin){
                	
                a += '<span class="commentcontroller"><a onclick="commentUpdate('+value.cno+',\''+value.content+'\');"> 수정 </a>';
                a += '<a onclick="commentDelete('+value.cno+');"> 삭제 </a></span>';}
                
                a += '</div></div>';
                a += '<div class="allContents"><div class="commentContent'+value.cno+'"> <p>  '+value.content +'</p></div>';
                a += '</div></div>';
            });
            
            $(".commentList").html(a);
        },
        error:function(xhr,status,error){
        	
        	console.log(xhr+status+error);
        }
    });
}
 
//댓글 등록
function commentInsert(insertData){
	var reviewCode = ${item.reviewCode}
	
    $.ajax({
        url : '/rcomment/insert',
        type : 'post',
        data : insertData,
        success : function(){
        	
           
                commentList(reviewCode); //댓글 작성 후 댓글 목록 reload
                $('[name=content]').val('');
            
        }
    });
}
 
 //댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function commentUpdate(cno, content){
	 
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" id="content" name="content_'+cno+'" value="'+content+'"/>';
    a += '<span class="input-group-btn"><button class="commentBtn" id="cUpdateBtn" type="button" onclick="commentUpdateProc('+cno+');">수정</button> </span>';
    a += '</div>';
    
    $('.commentContent'+cno).html(a);
    
}
 
//댓글 수정
function commentUpdateProc(cno){
    var updateContent = $('[name=content_'+cno+']').val();
    
    $.ajax({
        url : '/rcomment/update',
        type : 'post',
        data : {'content' : updateContent, 'cno' : cno},
        success : function(data){
            if(data == 1) commentList(reviewCode); //댓글 수정후 목록 출력 
        }
    });
}
 
//댓글 삭제 
function commentDelete(cno){
    $.ajax({
        url : '/rcomment/delete/'+cno,
        type : 'post',
        success : function(data){
            if(data == 1) commentList(reviewCode); //댓글 삭제후 목록 출력 
        }
    });
}
 
 
 
 
$(document).ready(function(){
    commentList(); //페이지 로딩시 댓글 목록 출력 
});
   
 
 
</script>



 <jsp:include page="../gnb/footer.jsp" flush="true" />
 <jsp:include page="../chatting/openchat.jsp" flush="true" />
</body>
</html>