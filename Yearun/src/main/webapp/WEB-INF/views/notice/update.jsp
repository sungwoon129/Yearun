<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org"
	xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout"
	data-layout-decorate="~{sample/layout/sampleLayout}"
	>
	
<head>
	
<meta charset="UTF-8">
<title>글쓰기</title>
<%@ include file="sessionCheck.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/addArticle.css" type="text/css">  
 <jsp:include page="../gnb/GNB.jsp" flush="true" />

  
  
 <!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
<script src="${pageContext.request.contextPath}/resources/dist/lang/summernote-ko-KR.js"></script>
<script>
$(document).ready(function(){
   var fileTarget = $('.filebox .upload-hidden');

    fileTarget.on('change', function(){
        if(window.FileReader){
            // 파일명 추출
            var filename = $(this)[0].files[0].name;
        } 

        else {
            // Old IE 파일명 추출
            var filename = $(this).val().split('/').pop().split('\\').pop();
        };

        $(this).siblings('.upload-name').val(filename);
    });

    //preview image 
    var imgTarget = $('.preview-image .upload-hidden');

    imgTarget.on('change', function(){
        var parent = $(this).parent();
        parent.children('.upload-display').remove();

        if(window.FileReader){
            //image 파일만
            if (!$(this)[0].files[0].type.match(/image\//)) return;
            
            var reader = new FileReader();
            reader.onload = function(e){
                var src = e.target.result;
                parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
            }
            reader.readAsDataURL($(this)[0].files[0]);
        }

        else {
            $(this)[0].select();
            $(this)[0].blur();
            var imgSrc = document.selection.createRange().text;
            parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

            var img = $(this).siblings('.upload-display').find('img');
            img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
        }
    });
});
  
  
function chkword(obj, maxByte) {
	 
    var strValue = obj.value;
    var strLen = strValue.length;
    var totalByte = 0;
    var len = 0;
    var oneChar = "";
    var str2 = "";

    for (var i = 0; i < strLen; i++) {
        oneChar = strValue.charAt(i);
        if (escape(oneChar).length > 39) {
            totalByte += 2;
        } else {
            totalByte++;
        }

        // 입력한 문자 길이보다 넘치면 잘라내기 위해 저장
        if (totalByte <= maxByte) {
            len = i + 1;
        }
    }

    // 넘어가는 글자는 자른다.
    if (totalByte > maxByte) {
        alert(maxByte + "자를 초과 입력 할 수 없습니다.");
        str2 = strValue.substr(0, len);
        obj.value = str2;
        chkword(obj, 4000);
    }
}  
</script>



<script >
$(document).ready(function(){
    $("#btnSubmit").click(function(){ 
var noticeTitle = document.form1.noticeTitle.value;
var noticeContext = document.form1.noticeContext.value;

if(noticeTitle == ""){
alert("제목을 입력하세요.");
document.form1.noticeTitle.focus();
return;
};

document.form1.submit();
});

});


</script>

<style>


</style>
</head>
<body>
<div class="currentaddress">
		<div class="addressContents">
			
           		 <img src="${pageContext.request.contextPath}/resources/images/home.png" class="home">
           		  <p>&nbsp;&nbsp;&nbsp;&nbsp;> &nbsp;&nbsp;&nbsp;&nbsp;공지사항&nbsp;&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;&nbsp;글쓰기</p>
           
            </div>
 </div>

 <div class="allContents">
	<div class="addform"> 
	
	<h3 class="title">글수정</h3>
	<!-- action : 에디터에 입력한 html 코드를 전달받을 Controller페이지 URL -->
	<form action="update" method="post" name="form1" enctype="multipart/form-data">
	<input type="hidden" name="noticeCode" value="${item.noticeCode}">

		<div class="freeTitle">
			<label>제목 &nbsp;&nbsp;</label> <input type="text" name="noticeTitle" placeholder="게시글 제목을 입력해주세요." style="width:620px" value="${item.noticeTitle}" onkeyup="chkword(this,40)">
	
		</div>
		<textarea name="noticeContext" id="summernote" placeholder="이미지만 업로드시 이미지만 업로드하지마시고 텍스트도 함께 추가해주세요.">${item.noticeContext}</textarea>
			<script th:inline="javascript">
			$(function(){
				$('#summernote').summernote({
					height: 462,
					width: 666,
					lang: 'ko-KR' ,
					fontNames : [  '바탕','굴림','궁서','Nanum Gothic','맑은고딕', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', 'Impact', 'Times New Roman' ],
					fontNamesIgnoreCheck : [ 'Nanum Gothic' ],
					focus: true,
					
					callbacks: {
						onImageUpload: function(files, editor, welEditable) {
				            for (var i = files.length - 1; i >= 0; i--) {
				            	sendFile(files[i], this);
				            }
				        }
					}
					
				});

			})
    function sendFile(file, el) {
		var form_data = new FormData();
      	form_data.append('file', file);
      	$.ajax({
        	data: form_data,
        	type: "POST",
        	url: '/notice/imageUpload',
        	cache: false,
        	contentType: false,
        	enctype: 'multipart/form-data',
        	processData: false,
        	success: function(data) {
        		if(checkImageType(data)){
					str = "<div>"
						+ "<a href='/sample/upload/displayFile?fileName=" + getImageLink(data) + "'>"
						+ "<img src='/sample/upload/displayFile?fileName=" + data + "'/>"
						+ "</a>"
						+ "<small data-src='" + data + "'></small></div>";
				}else {
					str = "<div>"
						+ "<a href='/sample/upload/displayFile?fileName=" + data + "'>"
						+ getOriginalName(data) + "</a>"
						+ "<small data-src='" + data + "'></small></div>";
				}//else
        		
        		
//           		$(el).summernote('editor.insertImage', data);         
          		$(".note-editable").append(str);
//                 $('#summernote').summernote("insertNode", img_name[0]);
          		
        	}
      	});
    }
			
			/* 컨트롤러로 부터 전송받은 파일이 이미지 파일인지 확인하는 함수 */
			function checkImageType(fileName){
				var pattern = /jpg$|gif$|png$|jpeg$/i;
				return fileName.match(pattern);
			}//checkImageType
			
			//파일 이름 처리 : UUID 가짜 이름 제거
			function getOriginalName(fileName){
				if(checkImageType(fileName)){
					return;
			}
				
				var idx = fileName.indexOf("_") + 1;
				return fileName.substr(idx);
					
			}//getOriginalName
			
			//이미지 원본 링크 제공
			function getImageLink(fileName){
				
				if(!checkImageType(fileName)){
					return;
				}//if
				
				var front = fileName.substr(0, 14);
				var end = fileName.substr(14);
				
				return front + end;
				
			}//getImageLink
					
			

</script>



	

			<div class="filebox bs3-primary preview-image">
			<label for="input_file">파일 선택</label> 
                            <input class="upload-name" value="${item.upFilename}" readonly="readonly" style="width: 200px;">

                            
                          <input type="file" id="input_file" class="upload-hidden" name="uploadFile"> 
                        </div>


</form>
 		
		<div class="alarm-box"><p class="alarm">첨부파일은 최대 1개, 10mb까지 등록이 가능하며 <br>파일 형식은 jpg,gif,psd,png,tif,zop,ms office,아래한글(hwp),pdf만 가능합니다.</div>
	</div>
		
	
		<div class="Btn">
			<button type="button" id="btnSubmit" class="regiserBtn">등록</button>
			
			</div>
		
		</div>
	</div>
	 <jsp:include page="../gnb/footer.jsp" flush="true" />
	 <jsp:include page="../chatting/openchat.jsp" flush="true" />
</body>
</html>