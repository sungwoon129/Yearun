<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <jsp:include page="../navi.jsp" flush="true" /> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여운_여행지등록</title>
<style>
#sitemap{
margin-top:100px;}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/map.css" type="text/css"> 
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
      
    	
    	
        $('#spot').hide();
	
   /*      $('#shopBtn').click(function() {
        	shopBtn('hotel');
        	shopBtn('food');
        });
         */
    
    });
 </script>
<script>
    window.onload = function(){
    	//쿠키 테스트
        var setCookie = function(name, value, day) {
        var date = new Date();
        date.setTime(date.getTime() + day * 60 * 60 * 24 * 1000);
        document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
    };
     
    var getCookie = function(name) {
        var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
        return value? value[2] : null;
    };
    setCookie("test", "test1234", 1);
    alert(getCookie("test"));
    
    alert(getCookie("test"));

    }
    </script>


<script>


   var map;
   var AreaUri = "AreaSelect";
   
   function initMap() {
      
      var uluru = {lat: 35.87111, lng:128.6028};
      
      map = new google.maps.Map(document.getElementById('map'), {
      zoom: 6,
      center: uluru,
      mapTypeId: 'roadmap'

      });
   }
   
   
   //DB에서 지역 정보 가져오기
    window.onload = function(){
	   
      // 지역목록에합치기(지역목록, 위경도목록, 호텔목록)
       function combineData(areas, locations, hotels,foods) {
         for (var i = 0; i < areas.length; i++) {
           var area = areas[i];
           var location = locations[i];
           // 지역에 위경도 정보를 묶고
           area.location = location;
           // 지역안의 호텔목록이 들어갈 자리도 준비해 둡니다.
           area.hotels = [];
           for (var j = 0; j < hotels.length; j++) {
             var hotel = hotels[j];
             // 지역번호로 해당지역 소속의 호텔임을 확인하고
             if (hotel.areaNo === area.areaNo) {
               // 준비해둔 자리에 호텔 정보를 추가합니다.
               area.hotels.push(hotel);
             }
           }//호텔반복문
           
           //식당이 들어갈 자리 준비
           area.foods = [];
           for (var j = 0; j < foods.length; j++) {
                var food = foods[j];
                // 지역번호로 해당지역 소속의 식당 확인
                if (food.areaNo === area.areaNo) {
                  // 준비해둔 자리에 식당 정보를 추가합니다.
                  area.foods.push(food);
                }
              }//호텔반복문
              
              
         }//지역 반복문
         return areas;
       }
       // 마커표시하기(지역)
       function addMarker(area) {
         var marker = new google.maps.Marker({
           position: new google.maps.LatLng(area.location),
           map: map,
           title: area.areaName,     
         });
         marker.addListener('click', function() {
            
            $('#spot').show();
           
            //클릭 했을때 지역 번호를 담아준다.
             document.getElementById('areaCode').value =area.areaNo;
            //위경도 값을 변수에 담아준다.
            var lat = area.location.lat;
            var lon = area.location.lng;
            map.setZoom(15);
            map.setCenter(area.location);
            //날씨 api ajax
            var apiURI = "http://api.openweathermap.org/data/2.5/weather?lat="+lat+"&lon="+lon+"&appid="+"1254b065f9f175f1ee70751f903dde1d";
              $.ajax({
                  url: apiURI,
                  dataType: "json",
                  type: "GET",
                  async: "false",
                  success: function(resp) {
                     var imgURL = "http://openweathermap.org/img/w/" + resp.weather[0].icon + ".png"
//                       console.log(resp);
//                       console.log("현재온도 : "+ (resp.main.temp- 273.15) );
//                       console.log("현재습도 : "+ resp.main.humidity);
//                       console.log("날씨 : "+ resp.weather[0].main );
//                       console.log("상세날씨설명 : "+ resp.weather[0].description );
//                       console.log("날씨 이미지 : "+ resp.weather[0].icon );
//                       console.log("바람   : "+ resp.wind.speed );
//                       console.log("나라   : "+ resp.sys.country );
//                       console.log("도시이름  : "+ resp.name );
//                       console.log("구름  : "+ (resp.clouds.all) +"%" );
                      var item = Math.floor(resp.main.temp- 273.15)+"℃";
             document.getElementById('weather_temp').innerHTML = "<Strong>"+item+"</Strong>";
             $("#weather").attr("src", imgURL);
                  }
              });
          
          
          //지역
          document.getElementById('areaName').innerHTML = area.areaName;
          document.getElementById('contentString').innerHTML =area.areaInfo;
         //지역사진추가
          $('#areaPhoto').attr('src','${pageContext.request.contextPath}/resources/images/map/'+area.areaPhoto);
          
          
        	//마커 새로 클릭하면 기존에 선택창에 있던 값  다 지우기 
          document.getElementById('hotelName').innerHTML ="";
          document.getElementById('foodName').innerHTML = "";
          //마커 새로 클릭하면 기존에 장바구니에 있던 값  다 지우기 
          document.getElementById('shop').innerHTML ="";
          for (var hotel of area.hotels) {
         
              document.getElementById('hotelName').innerHTML += "</br><div class='hotel_index'><div class='hotelstring'><h3 class='hotelh'>"+hotel.hotelName+"</h3><input type=checkbox id='"+ hotel.hotelName +"' class=hotel value=" + hotel.hotelNo + " name=hotelNo onchange='hotelSelect(this.value,this.id, this);'><br><span id= HAddress"+ hotel.hotelNo +">"+hotel.hotelAddress
              +"</span></div><img src=${pageContext.request.contextPath}/resources/images/map/"+hotel.hotelPhoto+" id=HPhoto"+ hotel.hotelNo +" class=partimg></div> </br> ";
              
           }//호텔 반복문 끝

           for (var food of area.foods) {
        	   console.log(food);
          document.getElementById('foodName').innerHTML += "</br><div class='hotel_index'><div class='hotelstring'><h3 class='hotelh'>"+food.restaurantName+"</h3><input type=checkbox id='"+ food.restaurantName +"' class=food value=" + food.restaurantNo + " name=restaurantNo onchange='foodSelect(this.value,this.id, this);'><br><span id= RAddress"+ food.restaurantNo +">"+food.restaurantAddress
          +"</span></div><img src=${pageContext.request.contextPath}/resources/images/map/"+food.restaurantPhoto+" id=RPhoto"+ food.restaurantNo +" class=partimg> </div></br> ";
             
          
          }//식당 반복문 끝
          
         });//클릭했을때
       }

       $.ajax({
         type:"GET",
         url:AreaUri,
         dataType:"json",
         async:false,
         success:function(response){
           // 지역중심으로 데이터를 가공한다.
           var areas = combineData(response.area, response.list, response.hotel, response.food);
           // 지역(area)마다 각각 마커를 표시한다.
           for (var area of areas) {
             addMarker(area);
           }
         }
       });
       if(document.all.spot.style.visibility=="hidden") {
               document.all.spot.style.visibility="visible";
//                return false; 
             }//if문 끝
   
   }//window.onload 내부
   
      function hotelSelect(hotelCode,hotelName, checkbox){      
	     var user = '${sessionScope.user}';
	     var admin = '${sessionScope.admin}';
	     var hotelC = 'h'+hotelCode;
	     var HAddress = 'HAddress'+hotelCode;
	     var hotelAddress = document.getElementById(HAddress).innerHTML;//p태그에 클래스 주고 해당 클래스로 주소 값 가져오기 수정해야함.
	   
	     var HPhoto = 'HPhoto'+hotelCode;
	     var hotelPhoto = $('#'+HPhoto).attr('src');//사진값 가져오기
 		 console.log(hotelPhoto);
      
	     
	     var HModalCode = 'Hm'+hotelCode;
		      if(!user == ""){
		      	
		      }else if(!admin == ""){
		      	
		      }else{
		      	
		         alert('로그인을 해주세요');
		         window.location.href="/login";
		      }
                     
            if(checkbox.checked) {                              
//                var content = '<li id="'+ hotelCode +'" class="' + hotelC + '">'+hotelName+'</li>';
               var content = 
		       		'<tr id="'+ hotelCode +'" class="' + hotelC + '" name="hotelName">'+
		       		'<td><img src="'+hotelPhoto+'" class="allimg"></td>'+
		       		'<td>'+hotelName+'</td>'+
		    		'<td>'+hotelAddress+'</td>'+
		    		'<td class="modalClick"><a id="modal" onclick=modal(1'+ hotelCode +')>상세보기</a></td>'+
		    		'</tr>';
               $('#shop').append(content);   
            } else {
               
                  var parent = document.getElementById("shop");
                  var child = document.getElementsByClassName(hotelC);
                  
                  console.dir(parent);
                  console.dir(child[0]);
                  
                  parent.removeChild(child[0]);
            }         
         }
      
   
      function foodSelect(foodCode,foodName, checkbox){
    	  var user = '${sessionScope.user}';
          var admin = '${sessionScope.admin}';
          var foodC = 'f'+foodCode;
          var RAddress = 'RAddress'+foodCode;
          var RPhoto = 'RPhoto'+foodCode;
          
          
      	  var restaurantAddress = document.getElementById(RAddress).innerHTML;//p태그에 아이디 주고  값 가져오기.
      	  var restaurantPhoto = $('#'+RPhoto).attr('src');//사진값 가져오기
//      		 console.log(restaurantPhoto);
            if(!user == ""){
            	
            }else if(!admin == ""){
            	
            }else{
            	
               alert('로그인을 해주세요');
               window.location.href="/login";
            }
            //체크박스를 선택했을때 버킷에 담아주는 코드
         if(checkbox.checked) {                              
//             var content = '<li id="'+ foodCode +'" class="' + foodC + '">'+foodName+'</li>';
       		var content = 
       		'<tr id="'+ foodCode +'" class="' + foodC + '">'+
       		'<td><img src="'+restaurantPhoto+'" class="allimg"></td>'+
       		'<td>'+foodName+'</td>'+
    		'<td>'+restaurantAddress+'</td>'+
    		'<td class="modalClick" ><a id="modal" onclick=modal('+ foodCode +')>상세보기</a></td>'+
    		'</tr>';
            $('#shop').append(content);   
         } else {
            
               var parent = document.getElementById("shop");
               var child = document.getElementsByClassName(foodC);
               
               console.dir(parent);
               console.dir(child[0]);
               
               parent.removeChild(child[0]);
         }   

      }
     
//끝 308 
      //담기버튼 클릭시  요기부터
        function shopBtn(){
           
           var areaCode  = document.getElementById('areaCode').value;
           var hotelCode = []; 
               
            
            var chk = document.getElementsByClassName( "hotel" ); // 체크박스객체를 담는다
            var len = chk.length;    //체크박스의 전체 개수
            var checkRow = '';      //체크된 체크박스의 value를 담기위한 변수
            var checkCnt = 0;        //체크된 체크박스의 개수
            var checkLast = '';      //체크된 체크박스 중 마지막 체크박스의 인덱스를 담기위한 변수
            var rowid = '';             //체크된 체크박스의 모든 value 값을 담는다
            var cnt = 0;                 

            for(var i=0; i<len; i++){

            if(chk[i].checked == true){   
               checkCnt++;        //체크된 체크박스의 개수   
               checkLast = i;     //체크된 체크박스의 인덱스
               }

            } 

            for(var i=0; i<len; i++){

               if(chk[i].checked == true){  //체크가 되어있는 값 구분
                  checkRow = chk[i].value;
                    
               if(checkCnt == 1){                            //체크된 체크박스의 개수가 한 개 일때,
                  rowid += "'"+checkRow+"'";        //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
               }else{                                            //체크된 체크박스의 개수가 여러 개 일때,
   
                  if(i == checkLast){                     //체크된 체크박스 중 마지막 체크박스일 때,
                  rowid += "'"+checkRow+"'";  //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
                  }else{
                  rowid += "'"+checkRow+"',";    //'value',의 형태 (뒤에 ,(콤마)가 붙게)                  
                  
                  }
                        
               }
               hotelCode.push(checkRow);//수정해야함      
            cnt++;
//             checkRow = '';    //checkRow초기화.
            
            }
   //'value1', 'value2', 'value3' 의 형태로 출력된다.
            
            }

//          alert(hotelCode+"호텔");
            
            
            
            var Fchk = document.getElementsByClassName( "food" ); // 체크박스객체를 담는다
            var foodCode = []; 
            var Flen = Fchk.length;    //체크박스의 전체 개수
            var FcheckRow = '';      //체크된 체크박스의 value를 담기위한 변수
            var FcheckCnt = 0;        //체크된 체크박스의 개수
            var FcheckLast = '';      //체크된 체크박스 중 마지막 체크박스의 인덱스를 담기위한 변수
            var Frowid = '';             //체크된 체크박스의 모든 value 값을 담는다
            var Fcnt = 0;                 

            for(var i=0; i<Flen; i++){

            if(Fchk[i].checked == true){
               
               FcheckCnt++;        //체크된 체크박스의 개수   
               FcheckLast = i;     //체크된 체크박스의 인덱스
               }

            } 

            for(var i=0; i<Flen; i++){

               if(Fchk[i].checked == true){  //체크가 되어있는 값 구분
                  FcheckRow = Fchk[i].value;
                    
               if(FcheckCnt == 1){                            //체크된 체크박스의 개수가 한 개 일때,
                  Frowid += "'"+FcheckRow+"'";        //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
               }else{                                            //체크된 체크박스의 개수가 여러 개 일때,
   
                  if(i == FcheckLast){                     //체크된 체크박스 중 마지막 체크박스일 때,
                  Frowid += "'"+FcheckRow+"'";  //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
                  }else{
                  Frowid += "'"+FcheckRow+"',";    //'value',의 형태 (뒤에 ,(콤마)가 붙게)                  
      
                  }
                           
               }
               foodCode.push(FcheckRow);
            Fcnt++;
//             FcheckRow = '';    //checkRow초기화.
            }
    //'value1', 'value2', 'value3' 의 형태로 출력된다.
            }
// 끝 211
	if(checkCnt == 0){
		alert('최소 1개 이상의 숙박시설을 선택 하세요. 현재 선택한 개수는'+checkCnt+'개 입니다.');
	}else if(FcheckCnt == 0){
		alert('최소 1개 이상의 음식점을 선택 하세요. 현재 선택한 개수는'+FcheckCnt+'개 입니다.');
	}else{
		
      var param = {}
      var leg;
      
      if(hotelCode.length > foodCode.length){
    	  leg = hotelCode.length;
    	  console.log(leg + "선택한 호텔 개수" + hotelCode.length);
      }else if(foodCode.length > hotelCode.length){
    	  leg = foodCode.length;
    	  console.log(leg + "선택한 호텔 개수" + foodCode.length);
      }else if(foodCode.length == hotelCode.length){
    	  leg = foodCode.length;
      }
      var userid = '${sessionScope.user}';
      
      for(var i=0; i<leg; i++){   
    	  param['bucketList['+i+'].restaurantNo'] =foodCode[i];	 
          param['bucketList['+i+'].hotelNo'] =hotelCode[i];  
          param['bucketList['+i+'].areaNo']=areaCode;
          param['bucketList['+i+'].id'] =userid;
      }
      
       	console.log(param);
       	
       	var conFirm = confirm("플랜을 작성하시겠습니까?");
        
        if(conFirm == true){
            $.ajax({
                url:'BucketAdd',
                type:'post',
                traditional : true,
                data: param,
                success : function(){
//                 console.log('통신성공');
                window.location.href="external-dragging";
                }
             });
        	
      	  
        }else{
      	  window.location.reload();
        }

		}//체크박스 유효성검사 if문 끝 
      }//담기버튼 클릭시 끝
</script>

<script>
function cookieRead(){
	alert('쿠기쿠기');
	var allcookies = document.cookie;
	var testCookies = request.getCookies();
	alert("모든 쿠기값" + testCookies);
	
	cookiearray = allcookies.split(';');
	
	for(var i=0; i<cookiearray; i++){
		name = cookiearray[i].split('=')[0];
		value = cookiearray[i].split('=')[0];
	
		alert("키 : "+ name + "값 : " + value);
	}
   
}
</script>


</head>
<body>
<jsp:include page="../gnb/GNB.jsp" flush="true" />
<div class="currentaddress">
      <div class="addressContents">
         
                  <img src="${pageContext.request.contextPath}/resources/images/home.png" class="home">
                   <p>&nbsp;&nbsp;&nbsp;&nbsp;> &nbsp;&nbsp;&nbsp;&nbsp;여행지등록</p>
           
            </div>
 </div>
<div class="allcontents">
	<div id="area_box">
	<div class="area_box2">
	<div id="area_title">여행지플래너</div>
		<div class="area_index">
				<ul>
					<div id="area_rectangle1">
						<ol id="area_r_text1">
						버킷
						</ol>
					</div>
					<div id="area_rectangle2">
						<ol id="area_r_text2">
						플래너
						</ol>
					</div>
				</ul>
			</div>
		
   <!-- 지도 -->
   <div id="map"></div>
   <div id="infowindow-content">
      <span id="place-name" class="title"></span><br> Place ID <span
         id="place-id"></span><br> <span id="place-address"></span>
   </div>
<div class="superwrap">
   <div class="spot" id="spot" style="visibility: hidden;" onclick="addListener(spot);">

      <div id="areaItem">
<div class="stringwrap">
         <h3 id="areaName"></h3>
         <div class="weatherbox">
         <span id="weather_temp"></span>
         <img src="" id="weather" style="width: 70px;">
          </div>
         <div></div><span><p id="contentString"></p></span></div><img src="" id="areaPhoto" class="allimg">
      </div>
      <div></div>
      <div id="hotelItem">
         <div id="hotelName"></div>
      </div>

      <div id="foodItem">
         <div id="foodName"></div>
      </div>

   </div>
  </div> 
   <div id="area_title">버킷</div>
   <div class="shopscroll">
<table class="table">
	<colgroup>
		<col width="350px">
		<col width="350px">
		<col width="400px">
		<col width="100px">
	</colgroup>
	<thead>
	<tr>
		<th>여행지사진</th>
		<th>이름</th>
		<th>주소</th>
		<th>보기</th>
	</tr>
	</thead>
	
	<tbody  id="shop">
	
<!-- 	<tr> -->
<!-- 		<td><img src=""></td> -->
<!-- 		<td id="hotelName">2월 호텔</td> -->
<!-- 		<td id="hotelName">주소: 대구광역시 중구 동일동 27</td> -->
<!-- 		<td>상세보기</td> -->
<!-- 	</tr> -->

	</tbody>
	
</table>
<div class="shopBtn">
   <button id="shopBtn" onclick="shopBtn()">등록하기</button>
 </div>
</div>

      <div id="planItem">
         <input id="areaCode" type="hidden"> 
      </div>
   </div>
<!-- 	<div> -->
<!-- 		<button onclick="cookieRead();">쿠기</button> -->
<!-- 	</div> -->
	</div>


 
    <!-- 83 그릴 바이 애슐리 Modal -->
    <div id="modal1" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">83 그릴 바이 애슐리</span></b></span></p>
                <p style="text-align: center; line-height: 1.5;"><br /></p>
                <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;">사이트 서버 점검으로</span></p>
                <p style="text-align: center; line-height: 1.5;"><b><span style="color: rgb(255, 0, 0); font-size: 14pt;">10:00 - 18:00 까지</span></b></p>
                <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;">사이트 사용이 중지 됩니다.</span></p>
                <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;"><br /></span></p>
                <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;">이용에 불편을 드린 점 양해를 </span></p>
                <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;">부탁드립니다.</span></p>
                <p style="text-align: center; line-height: 1.5;"><br /></p>
                <p><br /></p>
            <div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop(1);">
                <span class="pop_bt" style="font-size: 13pt;" >
                     닫기
                </span>
            </div>
      </div>
 
    </div>
        <!--End Modal-->
 
     <!-- 송정 초밥 Modal -->
    <div id="modal2" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">송정 초밥</span></b></span></p>
                <p style="text-align: center; line-height: 1.5;"><br /></p>
                <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;">사이트 서버 점검으로</span></p>
                <p style="text-align: center; line-height: 1.5;"><b><span style="color: rgb(255, 0, 0); font-size: 14pt;">10:00 - 18:00 까지</span></b></p>
                <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;">사이트 사용이 중지 됩니다.</span></p>
                <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;"><br /></span></p>
                <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;">이용에 불편을 드린 점 양해를 </span></p>
                <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;">부탁드립니다.</span></p>
                <p style="text-align: center; line-height: 1.5;"><br /></p>
                <p><br /></p>
            <div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop(2);">
                <span class="pop_bt" style="font-size: 13pt;" >
                     닫기
                </span>
            </div>
      </div>
 
    </div>
    
    <!-- 부띠크 호텔 Modal -->
    <div id="modal11" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
          <table class="modal-content-table">
          <th>
          	<div>
	          <h2 class="modal-title">부띠크 호텔</h2>
	          <p class="modal-title-sub">053-521-9560</p>
	           </div>
          	<hr/>
          	</th>
  			<tr class="tr1">
	      		<td>
					<img src="${pageContext.request.contextPath}/resources/images/modal/buhotel1.jpg">
	            	
	            </td>
	  
	            <td class="modal-content-table-p1">
	           		<p>뿌띠끄호텔은 반티지하면서도 세련된 북유럽풍<br/>
	           		디자인이 특징입니다. 프런트에는 수입과자 같<br/>
	           		은 간식과 원두커피 등 구비되어있습니다.</p>
	            </td>
	            
            </tr>
           <tr>
	            <td class="modal-content-table-img2">
	            <img src="${pageContext.request.contextPath}/resources/images/modal/buhotel2.jpg">
	            </td>
	            <td class="modal-content-table-p2">
	               <p>내부 시설물도 다양하게 준비되어 있습니다. 가장 중요하다고<br/>
	               	    할 수 있는 잠자리에는 고급스러운 매트리스와 재사용되지 않<br/>
	               	    는 화이트침구를 깔아두었습니다.</p>
	            </td>
           

            </tr>	          
            <tr>
            <th>
                <h2 class="modal-title">숙박시설</h2>
                <p class="modal-title-sub">상세사진</p>
            <hr/>
            </th>
            
            
	            <td>
	            <img src="${pageContext.request.contextPath}/resources/images/modal/buhotel3.jpg">
	         	</td>
         	
         		<td>
         		<div class="pop_bt_box" style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop(11);">
                	<span class="pop_bt" style="font-size: 13pt;" >  닫기</span>
            	</div>
         		</td>
         	</tr> 	
         </table>
      </div>
 
    </div>
    
     <!-- 2월 호텔 Modal -->
    <div id="modal12" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
				
	           
          <table class="modal-content-table">
          <th>
          	<div>
	          <h2 class="modal-title">2월 호텔</h2>
	          <p class="modal-title-sub">053-626-7001</p>
	           </div>
          	<hr/>
          	</th>
  			<tr class="tr1">
	      		<td>
					<img src="${pageContext.request.contextPath}/resources/images/modal/2month.jpg">
	            	
	            </td>
	  
	            <td class="modal-content-table-p1">
	           		<p>유럽풍 빈티지 인테리어를 갖춘 대구 2월호텔 앞산점은 대구에서 가장<br/>
	              	  경쟁력있는 2월 부티크호텔입니다.</p>
	            </td>
	            
            </tr>
           <tr>
	            <td class="modal-content-table-img2">
	            <img src="${pageContext.request.contextPath}/resources/images/modal/2month-1.jpg">
	            </td>
	            <td class="modal-content-table-p2">
	               <p>매장안에 들어가보면 인테리어 소품 등 국내에서  구하기힘든<br/>
			               빈티지 제품들로 구성되어 있으며 더 고급지고 매력적입니다.<br/>
			               감성,빈티지,천연 오가닉 침구류,파티룸,수영장,카라반 시설까지<br/>
			               만나 보실 수 있습니다.</p>
	            </td>
           

            </tr>	          
            <tr>
            <th>
                <h2 class="modal-title">숙박시설</h2>
                <p class="modal-title-sub">상세사진</p>
            <hr/>
            </th>
            
	            <td>
	            <img src="${pageContext.request.contextPath}/resources/images/modal/2month-2.jpg">
	         	</td>
         	
         		<td>
         		<div class="pop_bt_box" style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop(12);">
                	<span class="pop_bt" style="font-size: 13pt;" >  닫기</span>
            	</div>
         		</td>
         	</tr> 	
         </table>
            
      </div>
 
    </div>
    
     <!-- 크리스탈 호텔 Modal -->
    <div id="modal13" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
        <table class="modal-content-table">
          <th>
          	<div>
	          <h2 class="modal-title">크리스탈 호텔</h2>
	          <p class="modal-title-sub">053-655-7799
	          </p>
	           </div>
          	<hr/>
          	</th>
  			<tr class="tr1">
	      		<td>
					<img src="${pageContext.request.contextPath}/resources/images/modal/crystal1.jpg">
	            	
	            </td>
	  
	            <td class="modal-content-table-p1">
	           		 <p>크리스탈호텔에서 숙박하며 대구의 아름다움을 즐겨보세요.<br/>
	           			비즈니스 여행객과 관광객 모두 호텔의 시설과 서비스를 즐<br/>
	           			길수 있습니다.</p>
	            </td>
	            
            </tr>
           <tr>
	            <td class="modal-content-table-img2">
	            <img src="${pageContext.request.contextPath}/resources/images/modal/crystal2.jpg">
	            </td>
	            <td class="modal-content-table-p2">
	               <p>객실은 아늑하게 디자인되어 있으며, 일부객실은 평면TV,무선인터넷<br/>
	               	    금연객실,에어컨 등의 편의시설을 제공합니다. 호텔의 마사지 등을<br/>
	               	    통해 더욱 만족스러운 시간을 보낼 수 있습니다.</p>
	            </td>
           

            </tr>	          
            <tr>
            <th>
                <h2 class="modal-title">숙박시설</h2>
                <p class="modal-title-sub">상세사진</p>
            <hr/>
            </th>
            
	            <td>
	            <img src="${pageContext.request.contextPath}/resources/images/modal/crystal3.jpg">
	         	</td>
         	
         		<td>
         		<div class="pop_bt_box" style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop(13);">
                	<span class="pop_bt" style="font-size: 13pt;" >  닫기</span>
            	</div>
         		</td>
         	</tr> 	
         </table>
      </div>
 
    </div>
    
      <!-- 다온하우스  Modal -->
    <div id="modal112" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
        <table class="modal-content-table">
          <th>
          	<div>
	          <h2 class="modal-title">다온 하우스</h2>
	          <p class="modal-title-sub">010-2031-5076
	          </p>
	           </div>
          	<hr/>
          	</th>
  			<tr class="tr1">
	      		<td>
					<img src="${pageContext.request.contextPath}/resources/images/modal/daon1.jpg">
	            	
	            </td>
	  
	            <td class="modal-content-table-p1">
	           		 <p>일반가정집처럼 꾸며 익숙하면서도 깔끔하고 들어가서 보이는<br/>
	           		        모습입니다. 생각보다 좁지만 아담하고 아늑합니다.</p>
	            </td>
	            
            </tr>
           <tr>
	            <td class="modal-content-table-img2">
	            <img src="${pageContext.request.contextPath}/resources/images/modal/daon2.jpg">
	            </td>
	            <td class="modal-content-table-p2">
	               <p>편리한 시설 씽크대 냉장고 전자레인지 테이블 깔끔하게<br/>
	               	    정리정돈 되어있고 일회용 면도기,빗,드라이기,휴지등 넉넉<br/>
	               	    하게 구비되어있습니다.</p>
	            </td>
           

            </tr>	          
            <tr>
            <th>
                <h2 class="modal-title">숙박시설</h2>
                <p class="modal-title-sub">상세사진</p>
            <hr/>
            </th>
            
	            <td>
	            <img src="${pageContext.request.contextPath}/resources/images/modal/daon3.jpg">
	         	</td>
         	
         		<td>
         		<div class="pop_bt_box" style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop(112);">
                	<span class="pop_bt" style="font-size: 13pt;" >  닫기</span>
            	</div>
         		</td>
         	</tr> 	
         </table>
      </div>
 
    </div>
    
    
    <!-- 호텔야자  Modal -->
    <div id="modal113" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
        <table class="modal-content-table">
          <th>
          	<div>
	          <h2 class="modal-title">호텔야자</h2>
	          <p class="modal-title-sub">0503-5051-4931
	          </p>
	           </div>
          	<hr/>
          	</th>
  			<tr class="tr1">
	      		<td>
					<img src="${pageContext.request.contextPath}/resources/images/modal/yaja1.jpg">
	            	
	            </td>
	  
	            <td class="modal-content-table-p1">
	           		 <p>호텔야자는 과하지 않은 심플한 마감으로정갈하<br/>
	           		        지만 감각적인 가구와 소품의 조합으로<br/>
	           		        기억에 남는 매력전인 공간을 제공하고 있습니다.</p>
	            </td>
	            
            </tr>
           <tr>
	            <td class="modal-content-table-img2">
	            <img src="${pageContext.request.contextPath}/resources/images/modal/yaja2.jpg">
	            </td>
	            <td class="modal-content-table-p2">
	               <p>방 문을 열고 들어가면 깔끔하고 포근한 느낌의 침대세트<br/>
	               	    와 흰색 침구류 침대가 정면에 보인다. 아늑함이 물씬<br/>
	               	    하고 포근함이 느껴집니다. 화장실에는 비대가 설치<br/>
	               	    되어있어 편하게 이용할수있습니다. </p>
	            </td>
           

            </tr>	          
            <tr>
            <th>
                <h2 class="modal-title">숙박시설</h2>
                <p class="modal-title-sub">상세사진</p>
            <hr/>
            </th>
            
	            <td>
	            <img src="${pageContext.request.contextPath}/resources/images/modal/yaja3.jpg">
	         	</td>
         	
         		<td>
         		<div class="pop_bt_box" style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop(113);">
                	<span class="pop_bt" style="font-size: 13pt;" >  닫기</span>
            	</div>
         		</td>
         	</tr> 	
         </table>
      </div>
 
    </div>
    
    
     <!-- 온도호텔  Modal -->
    <div id="modal114" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
        <table class="modal-content-table">
          <th>
          	<div>
	          <h2 class="modal-title">온도호텔</h2>
	          <p class="modal-title-sub">053-657-3335
	          </p>
	           </div>
          	<hr/>
          	</th>
  			<tr class="tr1">
	      		<td>
					<img src="${pageContext.request.contextPath}/resources/images/modal/ondo1.jpg">
	            	
	            </td>
	  
	            <td class="modal-content-table-p1">
	           		 <p>온도호텔은 생각보다 크진 않지만 아기자기하고 아담한<br/>
	           		       시설로 조리시설과 노래방 시설 공기청정기 등 구비되<br/>
	           		       어 쾌적한 시설을 느낄수있습니다.</p>
	            </td>
	            
            </tr>
           <tr>
	            <td class="modal-content-table-img2">
	            <img src="${pageContext.request.contextPath}/resources/images/modal/ondo2.jpg">
	            </td>
	            <td class="modal-content-table-p2">
	               <p>내부 시설물도 다양하게 준비되어 있습니다. 로비엔 슬러시<br/>
	               	    와 커피 머신이 구비되어있고 빵이랑 딸기잼 삶은계란등 간<br/>
	               	    식거리도 있습니다.</p>
	            </td>
           

            </tr>	          
            <tr>
            <th>
                <h2 class="modal-title">숙박시설</h2>
                <p class="modal-title-sub">상세사진</p>
            <hr/>
            </th>
            
	            <td>
	            <img src="${pageContext.request.contextPath}/resources/images/modal/ondo3.jpg">
	         	</td>
         	
         		<td>
         		<div class="pop_bt_box" style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop(114);">
                	<span class="pop_bt" style="font-size: 13pt;" >  닫기</span>
            	</div>
         		</td>
         	</tr> 	
         </table>
      </div>
 
    </div>
        <!--End Modal-->
    <script type="text/javascript">
    	function modal(id){
    		$('#modal'+id).show();
    	}  
        //팝업 Close 기능
        function close_pop(flag) {
       
             $('#modal'+flag).hide();
        };
        
      </script>


  
   <!-- Replace the value of the key parameter with your own API key. -->
   <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyApZJ20TQte253EUsO-gP0GPyl_uwvoh4s&libraries=places&callback=initMap"
      async defer></script>
   <script
      src="https://maps.googleapis.com/maps/api/place/details/output?parameters"></script>
   <script
      src="https://maps.googleapis.com/maps/api/place/details/json?placeid=ChIJN1t_tDeuEmsRUsoyG83frY4&fields=name,rating,formatted_phone_number&key=AIzaSyApZJ20TQte253EUsO-gP0GPyl_uwvoh4s"></script>
      <jsp:include page="../gnb/footer.jsp" flush="true" />
      <jsp:include page="../chatting/openchat.jsp" flush="true" />
</body>
</html>