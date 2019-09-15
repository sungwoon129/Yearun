<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보입력</title>
 <link href="${pageContext.request.contextPath}/resources/css/signup.css" rel="stylesheet" type="text/css">
<%-- <jsp:include page="../gnb/GNB.jsp" flush="true" /> --%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    
    $(".datepicker").datepicker({

          showOn: "both", // 버튼과 텍스트 필드 모두 캘린더를 보여준다.
//           buttonImage: "images/calendar.gif",// 버튼 이미지
//           buttonImageOnly: true, // 버튼에 있는 이미지만 표시한다.
          changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
          changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
          minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.
          nextText: '다음 달', // next 아이콘의 툴팁.
          prevText: '이전 달', // prev 아이콘의 툴팁.
          numberOfMonths: [1,1], // 한번에 얼마나 많은 월을 표시할것인가. [2,3] 일 경우, 2(행) x 3(열) = 6개의 월을 표시한다.
          stepMonths: 3, // next, prev 버튼을 클릭했을때 얼마나 많은 월을 이동하여 표시하는가. 
          yearRange: 'c-100:c+0', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
          showButtonPanel: true, // 캘린더 하단에 버튼 패널을 표시한다. ( ...으로 표시되는부분이다.) 
          currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널
          closeText: '닫기',  // 닫기 버튼 패널
          dateFormat: "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
          showAnim: "slide", //애니메이션을 적용한다.  
          showMonthAfterYear: true , // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
          dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], // 요일의 한글 형식.
          monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] // 월의 한글 형식.

     });

});

</script>
<script src="/resources/js/validation.js"></script>
<jsp:include page="../gnb/GNB.jsp" flush="true" />
</head>
        <body>
          <div class="currentaddress">
      <div class="addressContents">
         
                  <img src="${pageContext.request.contextPath}/resources/images/home.png" class="home">
                   <p>&nbsp;&nbsp;&nbsp;&nbsp;> &nbsp;&nbsp;&nbsp;&nbsp;회원가입</p>
           
            </div>
 </div>   
         <form name="add" id="signup_form" action="memberadd" method="post">
                <div id="signup_box">
                    <div id="signup_title">회원가입</div>
                    
                    <div class="signup_index">        
                        <ul>
                        
                            <div id="rectangle1"><ol id="r_text1">약관동의</ol></div>
                            <div id="rectangle2"><ol id="r_text2">회원정보입력</ol></div>
                            <div id="rectangle3"><ol id="r_text3">가입완료</ol></div>
                        </ul>
                    </div>
                    
                
                    
                    <table id="innerinfo">
                        <tr class="info1">
                    
                            <td colspan="5"><div id="info1_title"><div id="info1_title_text">이름</div></div><input id="name_input" name="name" type="text" minlength="2" /></td>
                        </tr>
                        <tr class="info2">
                            
                            <td colspan="5">
                            <div id="info2_title">
                               <div id="info2_title_text">생년월일</div>
                            </div>
                                <div id="birthinput_box">
                                <input id="birth_input1" class="datepicker" name="birth_input1" type="text" readonly="readonly"/>클릭해서 선택하세요
                               </div>
                            </td>
                        </tr>
                        <tr class="info3">
                            
                            <td colspan="5"><div id="info3_title"><div id="info3_title_text">성별</div></div>
                               
                                <label><div class="male"><input type="radio" name="gender" value="male">남</div></label>
                                <label><div class="female"><input type="radio" name="gender" value="female">여</div></label>
                               
                            </td>
                        </tr>
                        
                        <tr class="info4">
                            
                            <td colspan="2">
                                
                                <div id="info4_title"><div id="info4_title_text">아이디</div></div>
                                
                                <div id="idinput_box">
                                    <li id="id_height"><input id="id_input" name="id" type="text"/></li>
                                    <li class="id_text">* 최소 5 ~13 까지 아이디로 생성해주세요</li>
                                </div>
                               
                                <div id="id_btn"><button type="button" id="id_doublecheck" onclick="idChk();"><div id="iddc_text">중복확인</div></button></div>
                                
                                <div id="info4_title2"><div id="info4-1_title_text">닉네임</div></div><input id="nn_input" name="nickname" type="text" maxlength="20"/><button type="button" onclick="nameChk();" id="nn_doublecheck">중복확인</button>
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
                               <input id="phone2_input" name="phone2_input" type="number" max="9999"/> 
                               <input id="phone3_input" name="phone3_input" type="number" max="9999"/>
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
                    <button id="confirm_btn" type="button" onclick="MemberAdd();"><div id="confirm_text">가입완료</div></button>
                    </div>
                </div>
            </form>
            

            
         
        <jsp:include page="../gnb/footer.jsp" flush="true" />     
        </body>
</html>