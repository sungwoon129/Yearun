<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link href="${pageContext.request.contextPath}/resources/css/userinfo.css" rel="stylesheet" type="text/css">
<title>MyPage</title>
<script src="https://code.jquery.com/jquery-latest.js"></script> 
<%@ include file="../sessionCheck.jsp"%>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>

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
           
           document.getElementById('address1_input').value = fullRoadAddr;
//            document.getElementById('address2_input').value = fullRoadAddr;
           
       
           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open();
}
</script>

<script>
	function nameChk(){
		   //닉네임 공백 사용하지 않기   
		   var name = document.getElementById('nn_input').value;
		   if (name.indexOf(" ") >= 0) {
		        alert("닉네임에 공백을 사용할 수 없습니다.")
		        return false;
		        
		   }else{
		      $.ajax({
		         url:'nameChk',
		         type:'post',
		         data:{
		            'name':name,
		            
		         },
		         success:function(data){
		            if(data == 0){
		               nn_doublecheck = 1;
		               alert('사용 가능한 닉네임 입니다.');
		               document.add.nn_input.readOnly = true;
		            }else{
		               alert('이미 사용중인 닉네임 입니다.');
		               return;
		            }
		         }
		      });
		   }
		   
		}

</script>
<jsp:include page="../gnb/GNB.jsp" flush="true" />
</head>
 <body>
          <div class="currentaddress">
      <div class="addressContents">
         
                  <img src="${pageContext.request.contextPath}/resources/images/home.png" class="home">
                   <p>&nbsp;&nbsp;&nbsp;&nbsp;> &nbsp;&nbsp;&nbsp;&nbsp;MyPage&nbsp;&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;&nbsp;내정보(회원정보)</p>
           
            </div>
 </div>   
 <div class="fullbody">
         <form name="mypageUpdate" id="signup_form" action="mypageUpdate" method="post">
                <div id="signup_box">
                    <div id="signup_title">내정보(회원정보)</div>
<!--                     
                    <div class="signup_index">        
                        <ul>
                        
                            <div id="rectangle1"><ol id="r_text1">약관동의</ol></div>
                            <div id="rectangle2"><ol id="r_text2">회원정보입력</ol></div>
                            <div id="rectangle3"><ol id="r_text3">가입완료</ol></div>
                        </ul>
                    </div> -->
             		<table class="mypageIndex">
             		<thead>
             		<tr>
             		<th>마이페이지</th>
             		</tr>
             		</thead>
             		<tbody>
             		<tr><td><a href="myArticle">내가 쓴 게시글</a></td></tr>
             		<tr><td><a href="myComment">내가 쓴 댓글</a></td></tr>
             		<tr><td><a href="mybucket">나의 버킷리스트</a></td></tr>
             		<tr><td class="current"><a href="#" id="modal" onclick="goodbye()">내정보(회원정보)</a></td></tr>
             		<tr><td><a href="goodbye">회원 탈퇴</a></td></tr>
             		</tbody>
             		</table>       
                
                    
                    <table id="innerinfo">
                        <tr class="info1">
                    
                            <td colspan="5"><div id="info1_title"><div id="info1_title_text">이름</div></div><input id="name_input" name="name" type="text" value="${userinfo.name}" readonly="readonly" /></td>
                        </tr>
                        <tr class="info2">
                            
                            <td colspan="5">
                            <div id="info2_title">
                               <div id="info2_title_text">생년월일</div>
                            </div>
                                <div id="birthinput_box">
                                <input id="birth_input1" class="datepicker" name="birth_input1" type="text" readonly="readonly" value="${userinfo.age}" />
                               </div>
                            </td>
                        </tr>
                        <tr class="info3">
                            
                            <td colspan="5"><div id="info3_title"><div id="info3_title_text">성별</div></div>
                               
                                <label><div class="male"><input type="radio" name="gender" value="male" >남</div></label>
                                <label><div class="female"><input type="radio" name="gender" value="female">여</div></label>
                               
                            </td>
                        </tr>
                        
                        <tr class="info4">
                            
                            <td colspan="2">
                                
                                <div id="info4_title"><div id="info4_title_text">아이디</div></div>
                                
                                <div id="idinput_box">
                                    <li id="id_height"><input id="id_input" name="id" type="text" value="${userinfo.id}" readonly="readonly" /></li>
                                   <!--  <li class="id_text">* 최소 5 ~13 까지 아이디로 생성해주세요</li> -->
                                </div>
                               
                                <div id="id_btn"><!-- <button type="button" id="id_doublecheck" onclick="idChk();"><div id="iddc_text">중복확인</div> --></button></div>
                                
                                <div id="info4_title2"><div id="info4-1_title_text">닉네임</div></div><input id="nn_input" name="nickname" type="text"/><button type="button" onclick="nameChk();" id="nn_doublecheck">중복확인</button>
                            </td>
                        </tr>
                        
                        <tr class="info5">
                            
                            <td colspan="4">
                                <div id="info5_title"><div id="info5_title_text">비밀번호</div></div>
                                <div id="pwinput_box">
                                    <li><input id="pw_input" name="pw" type="password"/></li>
                                    <li class="pw_text">* 최소 8~36자리 비밀번호로 생성해주세요</li>
                                </div>
                            </td>
                        </tr>
                        
                        <tr class="info6">
                            
                            <td colspan="4">
                                <div id="info6_title"><div id="info6_title_text">비밀번호 확인</div></div>
                                <div id="pwiinput_box">
                                    <input id="pwi_input" name="repw" type="password"/>
                                </div>
                            </td>
                        </tr>
                        
                        <tr class="info7">
                            
                            <td colspan="4">
                            <div id="info7_title">
                               <div id="info7_title_text">
                                  휴대전화
                               </div>
                            </div>
                            <div id="phone_box">
                            <select id="phone1_input" name="phone1_input">
	                        <option value="010" selected="selected">010</option>
	                        <option value="011">011</option>
	                        <option value="016">016</option>
	                        <option value="019">019</option>                            
                            </select>
<!--                                <input id="phone1_input" name="phone1_input" type="text"/>  -->
                               <input id="phone2_input" name="phone2_input" type="text" maxlength="4" /> 
                               <input id="phone3_input" name="phone3_input" type="text" maxlength="4"/>
                            </div>
                            </td>
                        </tr>
                        
                        <tr class="info8">
                            
                            <td colspan="4"><div id="info8_title"><div id="info8_title_text">주소</div></div>
                                <div id="address_box1"><input id="address1_input" name="address1_input" type="text" readonly="readonly"/><button type="button" id="find_address" onclick="execPostCode();"><div class="find_addressText">주소선택</div></button></div>
                                <label id="address_box2">상세주소<input id="address2_input" name="address2_input" type="text"/></label>
                            </td>
                        </tr>
                        
<!--                         <tr class="info9"> -->
                            
<!--                             <td colspan="4"><div id="info9_title"><div id="info9_title_text">이메일</div></div> -->
<!--                                 <div id="mail_box"> -->
<!--                                     <input id="mail_input" type="text"/> @ <input id="mail_input" type="text"/> -->
<!--                                 </div> -->
<!--                             </td> -->
<!--                         </tr> -->
                    </table>
                    
                    
                    <div class="confirmBtnBox">
                    <button id="confirm_btn" type="button" id="modal" onclick="update()"><div id="confirm_text">수정</div></button>
                    </div>
                </div>
            </form>
            

    </div>        

 
    </div>
        <!--End Modal-->
 
 
    <script type="text/javascript">
      
        function update() {
     
        	
        		
        		  
        		   var form = document.mypageUpdate;
        		   var formChk = false;
        		   var pw = form.pw.value;
        		   var repw = form.repw.value;
        	
        		   
        			if(!form.birth_input1.value){
        		      alert('생년월일을 입력해 주세요');
        		      form.birth_input1.focus();
        		      
        		   }else if(!form.nickname.value){
        		      alert('닉네임을 입력해 주세요');
        		      form.nickname.focus();
        		      
        		   }else if(nn_doublecheck == 0){
        		      alert('닉네임 중복 확인을 해주세요');
        		      
        		   }else if(!form.pw.value){
        		      alert('비밀번호를 입력해 주세요');
        		      form.pw.focus();   
        		   
        		   //비밀번호 공백 사용하지 않기   
        		   }else if (form.pw.value.indexOf(" ") >= 0) {
        		        alert("비밀번호에 공백을 사용할 수 없습니다.")
        		        return false;
        		        
        		    //비밀번호 길이 체크 (4~12자)
        		    }else if (form.pw.value.length<8 || form.pw.value.length>36) {
        		            alert("비밀번호를 8~36자까지 입력해주세요.")
        		            return false;
        		    }else if(!form.repw.value){
        		      
        		      alert('비밀번호를 다시 입력해 주세요');
        		      form.repw.focus();
        		      
        		   }else if(pw!==repw){
        		      
        		      alert('비밀번호가 일치하지 않습니다.');
        		      form.repw.focus();
        		      
        		   //핸드폰번호2 공백 사용하지 않기   
        		   }else if (form.phone2_input.value.indexOf(" ") >= 0 || !form.phone2_input.value) {
        		       alert("핸드폰번호에 공백을 사용할 수 없습니다.")
        		       form.phone2_input.focus();
        		       
        		       
        		   //핸드폰번호3 공백 사용하지 않기   
        		   }else if (form.phone3_input.value.indexOf(" ") >= 0 || !form.phone3_input.value) {
        		       alert("핸드폰번호에 공백을 사용할 수 없습니다.")
        		       form.phone3_input.focus();
        		       
        		    
        		   }else if(!form.address2_input.value){
        		      
        		      alert('주소를 입력해 주세요');
        		      form.address1_input.focus();
        		      
        		   }else{
        		      
        		      formChk= true;
        		      
        		       if(formChk){
//        		           alert('성공');
						document.getElementById('signup_form').submit();
							
        		         
        		         
        		       }else{
//        		           alert('실패');
        		         
        		       }
        		      
        		   }
        		

               
        };

      </script>

    
        <jsp:include page="../gnb/footer.jsp" flush="true" />     
        <jsp:include page="../chatting/openchat.jsp" flush="true" />
        </body>
</html>