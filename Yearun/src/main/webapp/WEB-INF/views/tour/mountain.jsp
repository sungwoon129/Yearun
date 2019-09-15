<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행지 소개</title>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<link
	href="${pageContext.request.contextPath}/resources/css/tourlistSlide.css"
	rel="stylesheet" type="text/css"> 
<link
	href="${pageContext.request.contextPath}/resources/css/tourlist.css"
	rel="stylesheet" type="text/css">
<script>
window.onload = function(){
	active1();
}
function active1(){
	$('#rectangle1').css("backgroundColor","rgb(102,102,102)");
	$('#a').css("color","white");
	$('#rectangle2').css("backgroundColor","");
	$('#rectangle3').css("backgroundColor","");
	$('#c').css("color","black");
	$('#b').css("color","black");
}
function active2(){
	$('#rectangle2').css("backgroundColor","rgb(102,102,102)");
	$('#b').css("color","white");
	$('#rectangle1').css("backgroundColor","");
	$('#rectangle3').css("backgroundColor","");
	$('#a').css("color","black");
	$('#c').css("color","black");
}
function active3(){
	$('#rectangle3').css("backgroundColor","rgb(102,102,102)");
	$('#c').css("color","white");
	$('#rectangle2').css("backgroundColor","");
	$('#rectangle1').css("backgroundColor","");
	$('#b').css("color","black");
	$('#a').css("color","black");
}
</script>
</head>

<body>

<jsp:include page="../gnb/GNB.jsp" flush="true" />
<div class="currentaddress">
      <div class="addressContents">
         
                  <img src="${pageContext.request.contextPath}/resources/images/home.png" class="home">
                   <p>&nbsp;&nbsp;&nbsp;&nbsp;> &nbsp;&nbsp;&nbsp;&nbsp;MOUNTAIN</p>
           
            </div>
 </div>
	<div id="tourlist_form">
		<div class="tab-wrap">
			<div id="signup_box">
				<div id="signup_title">산 여행</div>

				<div class="signup_index">
					<ul>
						<div id="rectangle1">
							<li id="r_text1"><a href="#tab1" onclick="active1()" id="a">관악산 연주대</a></li>
						</div>
						<div id="rectangle2">
							<li id="r_text2"><a href="#tab2" onclick="active2()" id="b">대관령 양떼목장</a></li>
						</div>
						<div id="rectangle3">
							<li id="r_text3"><a href="#tab3" onclick="active3()" id="c">북한산</a></li>
						</div>
					</ul>
				</div>





				<article id="tab1">
					<div class="tabBox">
						<div class="titleBox">
							<hr
								style="width: 384.5px; border: solid 1.2px rgb(153, 153, 153); display: inline-block; margin-bottom: 10px;">
							<p class="waterTitle"
								style="display: inline-block; color: rgb(161, 161, 161); font-size: 20pt; padding: 0px 45px 0px 45px;">&nbsp 산 여 행 &nbsp</p>
							<hr
								style="width: 384.5px; border: solid 1.2px rgb(153, 153, 153); display: inline-block; margin-bottom: 10px;">
						</div>

						<table class="table1">
							<tr>
								<td class="imageBox1"><img
									src="${pageContext.request.contextPath}/resources/images/mountain/governmental/image1-1.png"></td>
							</tr>
							<tr>
								<td class="imageBox2"><img
									src="${pageContext.request.contextPath}/resources/images/mountain/governmental/image1-2.png"></td>
							</tr>
						</table>


						<div class="titleBox">
							<hr
								style="width: 356.5px; border: solid 1.2px rgb(153, 153, 153); display: inline-block; margin-bottom: 10px;">
							<p class="introductionTitle"
								style="display: inline-block; color: rgb(161, 161, 161); font-size: 20pt; padding: 0px 45px 0px 45px;">여행지
								세부소개</p>
							<hr
								style="width: 356.5px; border: solid 1.2px rgb(153, 153, 153); display: inline-block; margin-bottom: 10px;">
						</div>

						<table class="table2">
							<tr>
								<td class="aimageBox" colspan="2"><img
									src="${pageContext.request.contextPath}/resources/images/mountain/governmental/image1-3.png"></td>
								<td class="textBox">
									<p class="detailInfoTitle">행사소개</p>
									<p class="detailInfoText">1973년 7월 10일 경기도기념물 제20호로 지정되었다. 보광사에서 소유하고 있다. 관악산 최고봉인 연주봉에는 여러 개의 크고 작은 절벽이 솟아 있는데, 깎아지른 듯한 절벽 위에 약간의 석축을 쌓아 올린 곳에 연주대가 있다. </p>

								</td>
							</tr>
							<tr>
								<td class="textBox">
									<p class="detailInfoTitle">행사내용</p>
									<p class="detailInfoText">추천코스</p>
									<p class="detailInfoText">서울대입구 ~ 호수공원(좌측길) ~제4야영장(왼쪽)~</p>
									<p class="detailInfoText">깔딱고개~관악산(정상)~연주대~깔딱고개~서울대(공대)</p>
									<p class="detailInfoText">※ 더 자세한 추천코스는 관악산  키워드 검색을 통하여 알 수 있습니다.</p>
								</td>
								<td class="aimageBox" colspan="2"><img
									src="${pageContext.request.contextPath}/resources/images/mountain/governmental/image1-4.png"></td>
							</tr>
						</table>

						<div class="titleBox">
							<hr
								style="width: 423px; border: solid 1.2px rgb(153, 153, 153); display: inline-block; margin-bottom: 10px;">
							<p
								style="display: inline-block; color: rgb(161, 161, 161); font-size: 20pt; padding: 0px 45px 0px 45px;">맛집</p>
							<hr
								style="width: 423px; border: solid 1.2px rgb(153, 153, 153); display: inline-block; margin-bottom: 10px;">
						</div>


						
												 <!--슬라이드 시작-->
                                         
                <div id="contain">
                    <div class="slider">
                    <figure>
                       <div>
                        <table class="table4" name='slide1'>
                        <tr>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/mountain/food/440982_1533304703129820.jpg"></td>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/mountain/food/677963_1505745125607_131973.jpg"></td>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/mountain/food/523864_1487832188866915.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                        <table class="table4" name='slide2'>
                        <tr>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/mountain/food/622083_1514681171456_64884.jpg"></td>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/mountain/food/612217_1472625710469931.jpg"></td>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/mountain/food/123432_1484873130047033.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                         <table class="table4" name='slide3'>
                        <tr>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/mountain/food/795564_1538757963609_70108.jpg"></td>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/mountain/food/253892_1465200001365_2656.jpg"></td>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/mountain/food/653227_1504794921664402.jpg"></td>
                        </tr>
                    </table>
                        </div>
                    </figure>
                    </div>
                </div>
                <!--슬라이드 끝-->




						<div>

							<div class="titleBox">
								<hr
									style="width: 423px; border: solid 1.2px rgb(153, 153, 153); display: inline-block; margin-bottom: 10px;">
								<p
									style="display: inline-block; color: rgb(161, 161, 161); font-size: 20pt; padding: 0px 45px 0px 45px;">호텔</p>
								<hr
									style="width: 423px; border: solid 1.2px rgb(153, 153, 153); display: inline-block; margin-bottom: 10px;">
							</div>


									  <div id="contain">
                    <div class="slider">
                    <figure>
                        <div>
                        <table class="table4" name='slide1'>
                        <tr>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/mountain/hotel/1IMG_3103.jpg"></td>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/mountain/hotel/2016615112823.jpg"></td>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/mountain/hotel/HI358679551.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                        <table class="table4" name='slide2'>
                        <tr>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/mountain/hotel/R0000000AGGQ_KR.jpg"></td>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/mountain/hotel/HI299213806.jpg"></td>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/mountain/hotel/HI132728687.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                         <table class="table4" name='slide3'>
                        <tr>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/mountain/hotel/mosaGx4TPa.jpeg"></td>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/mountain/hotel/Deluxe-701-1101-03.jpg"></td>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/mountain/hotel/deluxe_double.jpg"></td>
                        </tr>
                    </table>
                        </div>
                    </figure>
                    </div>
                </div>
                <!--슬라이드 끝-->

						</div>
					</div>
				</article>


				<article id="tab2">
					<div class="tabBox">
						<div class="titleBox">
							<hr
								style="width: 384.5px; border: solid 1.2px rgb(153, 153, 153); display: inline-block; margin-bottom: 10px;">
							<p class="waterTitle"
								style="display: inline-block; color: rgb(161, 161, 161); font-size: 20pt; padding: 0px 45px 0px 45px;">&nbsp 산 여 행 &nbsp</p>
							<hr
								style="width: 384.5px; border: solid 1.2px rgb(153, 153, 153); display: inline-block; margin-bottom: 10px;">
						</div>

						<table class="table1">
							<tr>
								<td class="imageBox1"><img
									src="${pageContext.request.contextPath}/resources/images/mountain/daegwallyeong/image1-1.png"></td>
							</tr>
							<tr>
								<td class="imageBox2"><img
									src="${pageContext.request.contextPath}/resources/images/mountain/daegwallyeong/image1-2.png"></td>
							</tr>
						</table>


						<div class="titleBox">
							<hr
								style="width: 356.5px; border: solid 1.2px rgb(153, 153, 153); display: inline-block; margin-bottom: 10px;">
							<p class="introductionTitle"
								style="display: inline-block; color: rgb(161, 161, 161); font-size: 20pt; padding: 0px 45px 0px 45px;">여행지
								세부소개</p>
							<hr
								style="width: 356.5px; border: solid 1.2px rgb(153, 153, 153); display: inline-block; margin-bottom: 10px;">
						</div>

						<table class="table2">
							<tr>
								<td class="imageBox" colspan="2"><img
									src="${pageContext.request.contextPath}/resources/images/mountain/daegwallyeong/image1-3.png"></td>
								<td class="textBox">
									<p class="detailInfoTitle">행사소개</p>
									<p class="detailInfoText">한국의 알프스 대관령 양떼목장 푸른 풀밭, 향긋한 풀 내음을 옮기는 상쾌한 바람</p>

								</td>
							</tr>
							<tr>
								<td class="textBox">
									<p class="detailInfoTitle">행사내용</p>
									<p class="detailInfoText">귀여운 양들이 초지 위에서 뛰어노는 모습을 보며</p>
									<p class="detailInfoText">목장 둘레를 따라 만들어진 산책로를 걸어보세요.</p>
									<p class="detailInfoText">먹이주기 체험을 통해 아이들에게 즐거운 추억을 남겨주세요.</p>
									<p class="detailInfoText">※ 관람 시간 및 입장료는 대관령 양떼목장 홈페이지를 통하여 알 수 있습니다.</p>
								</td>
								<td class="imageBox" colspan="2"><img
									src="${pageContext.request.contextPath}/resources/images/mountain/daegwallyeong/image1-4.png"></td>
							</tr>
						</table>

						<div class="titleBox">
							<hr
								style="width: 423px; border: solid 1.2px rgb(153, 153, 153); display: inline-block; margin-bottom: 10px;">
							<p
								style="display: inline-block; color: rgb(161, 161, 161); font-size: 20pt; padding: 0px 45px 0px 45px;">맛집</p>
							<hr
								style="width: 423px; border: solid 1.2px rgb(153, 153, 153); display: inline-block; margin-bottom: 10px;">
						</div>


						
												 <!--슬라이드 시작-->
                                         
                <div id="contain">
                    <div class="slider">
                    <figure>
                       <div>
                        <table class="table4" name='slide1'>
                        <tr>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/mountain/food2/lppwzxcpb-d7kg.jpg"></td>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/mountain/food2/59_1440777110675106202.jpg"></td>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/mountain/food2/59_1440777110675106201.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                        <table class="table4" name='slide2'>
                        <tr>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/mountain/food2/452159_1451441900395_97059.jpg"></td>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/mountain/food2/442121_1470758174448_30250.jpg"></td>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/mountain/food2/1021151_1532874407142594.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                         <table class="table4" name='slide3'>
                        <tr>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/mountain/food2/546843_1502868217043256.jpg"></td>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/mountain/food2/75225_14353201419526076.jpg"></td>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/mountain/food2/55376_1446268992411.jpg"></td>
                        </tr>
                    </table>
                        </div>
                    </figure>
                    </div>
                </div>
                <!--슬라이드 끝-->




						<div>

							<div class="titleBox">
								<hr
									style="width: 423px; border: solid 1.2px rgb(153, 153, 153); display: inline-block; margin-bottom: 10px;">
								<p
									style="display: inline-block; color: rgb(161, 161, 161); font-size: 20pt; padding: 0px 45px 0px 45px;">호텔</p>
								<hr
									style="width: 423px; border: solid 1.2px rgb(153, 153, 153); display: inline-block; margin-bottom: 10px;">
							</div>


								  <div id="contain">
                    <div class="slider">
                    <figure>
                        <div>
                        <table class="table4" name='slide1'>
                        <tr>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/mountain/hotel2/HI532751184.jpg"></td>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/mountain/hotel2/HI505090603.jpg"></td>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/mountain/hotel2/HI511835373.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                        <table class="table4" name='slide2'>
                        <tr>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/mountain/hotel2/HI342834693.jpg"></td>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/mountain/hotel2/HI170585386.jpg"></td>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/mountain/hotel2/HI510642802.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                         <table class="table4" name='slide3'>
                        <tr>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/mountain/hotel2/HI505090440.jpg"></td>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/mountain/hotel2/HI510657198.jpg"></td>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/mountain/hotel2/HI183554145.jpg"></td>
                        </tr>
                    </table>
                        </div>
                    </figure>
                    </div>
                </div>
                <!--슬라이드 끝-->

						</div>
					</div>
				</article>


				<article id="tab3">
					<div class="tabBox">
						<div class="titleBox">
							<hr
								style="width: 384.5px; border: solid 1.2px rgb(153, 153, 153); display: inline-block; margin-bottom: 10px;">
							<p class="waterTitle"
								style="display: inline-block; color: rgb(161, 161, 161); font-size: 20pt; padding: 0px 45px 0px 45px;">&nbsp 산 여 행 &nbsp</p>
							<hr
								style="width: 384.5px; border: solid 1.2px rgb(153, 153, 153); display: inline-block; margin-bottom: 10px;">
						</div>

						<table class="table1">
							<tr>
								<td class="imageBox1"><img
									src="${pageContext.request.contextPath}/resources/images/mountain/bukhanMountain/image1-1.png"></td>
							</tr>
							<tr>
								<td class="imageBox2"><img
									src="${pageContext.request.contextPath}/resources/images/mountain/bukhanMountain/image1-2.png"></td>
							</tr>
						</table>


						<div class="titleBox">
							<hr
								style="width: 356.5px; border: solid 1.2px rgb(153, 153, 153); display: inline-block; margin-bottom: 10px;">
							<p class="introductionTitle"
								style="display: inline-block; color: rgb(161, 161, 161); font-size: 20pt; padding: 0px 45px 0px 45px;">여행지
								세부소개</p>
							<hr
								style="width: 356.5px; border: solid 1.2px rgb(153, 153, 153); display: inline-block; margin-bottom: 10px;">
						</div>

						<table class="table2">
							<tr>
								<td class="imageBox" colspan="2"><img
									src="${pageContext.request.contextPath}/resources/images/mountain/bukhanMountain/image1-3.png"></td>
								<td class="textBox">
									<p class="detailInfoTitle">행사소개</p>
									<p class="detailInfoText">북한산은 서울특별시 강북구·도봉구·은평구·성북구·종로구와 경기도 고양시 덕양구·양주시·의정부시의 경계에 있는 높이 835.6m의 산으로, 이름은 조선 후기시대때 한성의 북쪽이라는 뜻에서 유래되었다.</p>

								</td>
							</tr>
							<tr>
								<td class="textBox">
									<p class="detailInfoTitle">행사내용</p>
									<p class="detailInfoText">북한산 둘레길은 기존의 샛길을 연결하고 다듬어서</p>
									<p class="detailInfoText">북한산 자락을 완만하게 걸을 수 있도록 조성한 저지대</p>
									<p class="detailInfoText">수평 산책로 입니다. 전체길이는 71.5km입니다.</p>
									<p class="detailInfoText">※ 자세한 정보는 북한산 국립공원 홈페이지에서 확인하실 수 있습니다.</p>
								</td>
								<td class="imageBox" colspan="2"><img
									src="${pageContext.request.contextPath}/resources/images/mountain/bukhanMountain/image1-4.png"></td>
							</tr>
						</table>

						<div class="titleBox">
							<hr
								style="width: 423px; border: solid 1.2px rgb(153, 153, 153); display: inline-block; margin-bottom: 10px;">
							<p
								style="display: inline-block; color: rgb(161, 161, 161); font-size: 20pt; padding: 0px 45px 0px 45px;">맛집</p>
							<hr
								style="width: 423px; border: solid 1.2px rgb(153, 153, 153); display: inline-block; margin-bottom: 10px;">
						</div>


						
												 <!--슬라이드 시작-->
                                         
                <div id="contain">
                    <div class="slider">
                    <figure>
                       <div>
                        <table class="table4" name='slide1'>
                        <tr>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/mountain/food3/545986_1542033173929134.jpg"></td>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/mountain/food3/1028841_1540307487098388.jpg"></td>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/mountain/food3/188186_1425544322858.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                        <table class="table4" name='slide2'>
                        <tr>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/mountain/food3/1184064_1541259795117296.jpg"></td>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/mountain/food3/259634_1457682871893949.jpg"></td>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/mountain/food3/547506_1462477306477916.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                         <table class="table4" name='slide3'>
                        <tr>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/mountain/food3/179982_1444404130462.jpg"></td>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/mountain/food3/590887_1473137822339482.jpg"></td>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/mountain/food3/930826_1541688485872_82873.jpg"></td>
                        </tr>
                    </table>
                        </div>
                    </figure>
                    </div>
                </div>
                <!--슬라이드 끝-->




						<div>

							<div class="titleBox">
								<hr
									style="width: 423px; border: solid 1.2px rgb(153, 153, 153); display: inline-block; margin-bottom: 10px;">
								<p
									style="display: inline-block; color: rgb(161, 161, 161); font-size: 20pt; padding: 0px 45px 0px 45px;">호텔</p>
								<hr
									style="width: 423px; border: solid 1.2px rgb(153, 153, 153); display: inline-block; margin-bottom: 10px;">
							</div>


									  <div id="contain">
                    <div class="slider">
                    <figure>
                        <div>
                        <table class="table4" name='slide1'>
                        <tr>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/mountain/hotel3/HI530455872.jpg"></td>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/mountain/hotel3/HI153688272.jpg"></td>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/mountain/hotel3/HI543657369.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                        <table class="table4" name='slide2'>
                        <tr>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/mountain/hotel3/HI509928676.jpg"></td>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/mountain/hotel3/HI193013392.jpg"></td>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/mountain/hotel3/HI510660296.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                         <table class="table4" name='slide3'>
                        <tr>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/mountain/hotel3/HI512203777.jpg"></td>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/mountain/hotel3/HI260968277.jpg"></td>
                            <td class="infoBox">
                                
                                
                                
                                 
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/mountain/hotel3/HI501879201.jpg"></td>
                        </tr>
                    </table>
                        </div>
                    </figure>
                    </div>
                </div>
                <!--슬라이드 끝-->

						</div>
					</div>
				</article>
			</div>
		</div>
	</div>



	<jsp:include page="../gnb/footer.jsp" flush="true" />
	<jsp:include page="../chatting/openchat.jsp" flush="true" />
</body>
</html>