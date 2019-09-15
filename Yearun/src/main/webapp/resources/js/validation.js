
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

var iddc_text = 0;
var nn_doublecheck = 0;

//아이디 중복체크
function idChk(){
   var id = document.getElementById('id_input').value;
   
    //아이디 유효성 검사 (영문소문자, 숫자만 허용)
    for (i = 0; i < id.length; i++) {
        ch = id.charAt(i)
        if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')&&!(ch >= 'A' && ch <= 'Z')) {
            alert("아이디는 대소문자, 숫자만 입력가능합니다.")
            return false;
        }
    }
    
    //아이디에 공백 사용하지 않기
    if (id.indexOf(" ") >= 0) {
        alert("아이디에 공백을 사용할 수 없습니다.")
        return false;
      //아이디 길이 체크 (4~12자)
    }else if (id.length<5 || id.length>13) {
            alert("아이디를 5~13자까지 입력해주세요.")
            return false;
    }else{
       $.ajax({
          url:'idChk',
          type:'post',
          data:{
             'id':id,
             
          },
          success:function(data){
             if(data == 0){
                alert('사용 가능한 아이디 입니다.');
                iddc_text = 1;
                document.add.id_input.readOnly = true;
             }else{
                alert('이미 사용중인 아이디 입니다.');
                return;
             }
          }
       });   
    }


}

//닉네임 중복체크
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

function MemberAdd(){
   
   var form = document.add;
   var formChk = false;
   var pw = form.pw.value;
   var repw = form.repw.value;
   var deny_char = /^[가-힣\*]+$/;

   if(!form.name.value){
      
      alert('이름을 입력해 주세요');
      form.name.focus();
      
   //이름에 공백 사용하지 않기   
   }else if (form.name.value.indexOf(" ") >= 0) {
        alert("이름에 공백을 사용할 수 없습니다.")
        return false;
        
   }else if(!deny_char.test(form.name.value)){
	alert('이름은 2자이상의 정상적인 한글로 입력해야합니다.');
	
   }else if((form.name.value.length > 20)){
		alert('20자 이하로 입력해주세요.');
		
   }else if(!form.birth_input1.value){
      alert('생년월일을 입력해 주세요');
      form.birth_input1.focus();
      
   }else if(!form.id.value){
      
      alert('아이디를 입력해 주세요');
      form.id.focus();
      
   }else if(iddc_text == 0){
      alert('아이디 중복 확인을 해주세요');
      
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
       alert("핸드폰번호는 4자리의 숫자로 입력해야 합니다")
       form.phone2_input.focus();
       
   }else if (form.phone2_input.value.length > 4 ||form.phone2_input.value.length < 3) {
	   alert('핸드폰번호는 3~4자리로 입력하셔야 합니다.');
	   form.phone2_input.value = form.phone2_input.value.slice(0,4);       
       
   //핸드폰번호3 공백 사용하지 않기   
   }else if (form.phone3_input.value.length > 4 ||form.phone3_input.value.length < 3) {
	   alert('핸드폰번호는 3~4자리로 입력하셔야 합니다.');
	   form.phone3_input.value = form.phone3_input.value.slice(0,4); 
	       
   }else if (form.phone3_input.value.indexOf(" ") >= 0 || !form.phone3_input.value) {
       alert("핸드폰번호는 4자리의 숫자로 입력해야 합니다")
       form.phone3_input.focus();
       
    
   }else if(!form.address2_input.value){
      
      alert('주소를 입력해 주세요');
      form.address1_input.focus();
      
   }else{
      
      formChk= true;
      
       if(formChk){
//           alert('성공');   
          document.getElementById('signup_form').submit();
         
       }else{
//           alert('실패');
         
       }
      
   }
}

