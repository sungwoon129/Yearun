<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <jsp:include page="navi.jsp" flush="true" /> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style type="text/css">
.layer{
  position:absolute;
  top:0;right:0;bottom:0;left:0;
  display:-webkit-box;
  display:-moz-box;
  display:-ms-flexbox;
  display:-webkit-flex;
  display:flex;
	 
  align-items:center;
  justify-content:center;
  -webkit-align-items:center;
  -webkit-justify-content:center;
 
  -webkit-box-pack:center;
  -webkit-box-align:center;
  -moz-box-pack:center;
  -moz-box-align:center;
  -ms-box-pack:center;
  -ms-box-align:center;
   
}
.layer .content{background:skyblue}
ol{
list-style: none;
}
input:focus {
  outline: none;
}
.btn {
    width:400px;
    background-color: black;
    border: none;
    color:white;
    padding: 10px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    cursor: pointer;
    border-radius:20px;
}
input{
  width:400px;
  text-align: left;
  border-bottom-style:solid;
  border-bottom-width:2px;
  border-left: hidden;
  border-right: hidden;
  border-top: hidden;
  font-size:20px;
  margin:10px;
  
}
label{
font-size:20px;
}
</style>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           document.getElementById('addr1').value = data.zonecode;
           document.getElementById('addr2').value = fullRoadAddr;
           
//            $("[name=addr1]").val(data.zonecode);
//            $("[name=addr2]").val(fullRoadAddr);
           
           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open();
}
</script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
function MemberAdd(){
	var form = document.add;
	
	var pw = form.pw.value;
	var repw = form.repw.value;
	

	if(!form.id.value){
		swal('아이디를 입력해 주세요');
		form.id.focus();
	}else if(!form.pw.value){
		swal('비밀번호를 입력해 주세요');
		form.pw.focus();
	}else if(!form.repw.value){
		swal('비밀번호를 다시 입력해 주세요');
		form.repw.focus();
	}else if(pw!==repw){
		swal('비밀번호가 일치하지 않습니다.');
		form.repw.focus();
	}else if(!form.name.value){
		swal('이름을 입력해 주세요');
		form.name.focus();

	}else if(!form.age.value){
		swal('생년월일을 입력해 주세요');
		form.age.focus();

	}else if(!form.nickname.value){
		swal('닉네임을 입력해 주세요');
		form.nickname.focus();
	}else if(!form.addr1.value){
		swal('주소를 입력해 주세요');
		form.address.focus();
	}else if(!form.phone.value){
		alert('전화번호를 입력해 주세요');
		form.phone.focus();

	}else{
	form.submit();
	}
}
</script>
</head>
<body>
<div class="layer">
	<img src="${pageContext.request.contextPath}resources/images/memberadd.png">
	<form name="add" action="memberadd" method="post">
		
		<ol>
		<li><label>아이디</label></li>
		<li><input type="text" name="id"></li>
		
		<li><label>비밀번호</label></li>
		<li><input type="password" name="pw"></li>
		
		<li><label>비밀번호 재확인</label></li>
		<li><input type="password" name="repw"></li>
		
		<li><label>이름</label></li>
		<li><input type="text" name="name"></li>
		
		<li><label>생년월일</label></li>
		<li><input type="date" name="age"></li>
		
		<li><label>닉네임</label></li>
		<li><input type="text" name="nickname"></li>
		
		<li><label>주소</label></li>
		<li><input class="form-control" placeholder="우편번호" name="addr1" id="addr1" type="text" readonly="readonly" ></li>
    	<li><button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button></li>
		<li>
		<div>
    	<input class="form-control" placeholder="도로명 주소" name="addr2" id="addr2" type="text" readonly="readonly" />
		</div>
		</li>
		<li>
		<div class="form-group">
    	<input class="form-control" placeholder="상세주소" name="addr3" id="addr3" type="text"  />
		</div>
		</li>
		
		<li><label>휴대전화</label></li>
		<li><input type="text" name="phone"></li>
		
		<li><input type="button" class="btn" value="가입하기" onclick="MemberAdd()"></li>
		</ol>
	</form>
</div>
</body>
</html>