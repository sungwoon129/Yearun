<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행지 소개</title>
<link
	href="${pageContext.request.contextPath}/resources/css/tourlistSlide.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/css/tourlist.css"
	rel="stylesheet" type="text/css">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<jsp:include page="../gnb/GNB.jsp" flush="true" />
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
<div class="currentaddress">
      <div class="addressContents">
         
                  <img src="${pageContext.request.contextPath}/resources/images/home.png" class="home">
                   <p>&nbsp;&nbsp;&nbsp;&nbsp;> &nbsp;&nbsp;&nbsp;&nbsp;WATER</p>
           
            </div>
 </div>


	<div id="tourlist_form">
		<div class="tab-wrap">
			<div id="signup_box">
				<div id="signup_title">물놀이 여행</div>

				<div class="signup_index">
					<ul>
						<div id="rectangle1">
							<li id="r_text1"><a href="#tab1"  onclick="active1()" id="a">가평계곡</a></li>
						</div>
						<div id="rectangle2">
							<li id="r_text2"><a href="#tab2" onclick="active2()" id="b">사천진해수욕장</a></li>
						</div>
						<div id="rectangle3">
							<li id="r_text3"><a href="#tab3" onclick="active3()" id="c">해운대</a></li>
						</div>
					</ul>
				</div>





				<article id="tab1">
					<div class="tabBox">
						<div class="titleBox">
							<hr
								style="width: 384.5px; border: solid 1.2px rgb(153, 153, 153); display: inline-block; margin-bottom: 10px;">
							<p class="waterTitle"
								style="display: inline-block; color: rgb(161, 161, 161); font-size: 20pt; padding: 0px 45px 0px 45px;">물놀이여행</p>
							<hr
								style="width: 384.5px; border: solid 1.2px rgb(153, 153, 153); display: inline-block; margin-bottom: 10px;">
						</div>

						<table class="table1">
							<tr>
								<td class="imageBox1"><img
									src="${pageContext.request.contextPath}/resources/images/water/gapyeong/image1-1.png"></td>
							</tr>
							<tr>
								<td class="imageBox2"><img
									src="${pageContext.request.contextPath}/resources/images/water/gapyeong/image1-2.png"></td>
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
									src="${pageContext.request.contextPath}/resources/images/water/gapyeong/image1-3.png"></td>
								<td class="textBox">
									<p class="detailInfoTitle">행사소개</p>
									<p class="detailInfoText">무더운 여름엔 시원하고 즐길거리가 많은 가평근교 계곡으로 떠나보세요.</p>

								</td>
							</tr>
							<tr>
								<td class="textBox">
									<p class="detailInfoTitle">행사내용</p>
									<p class="detailInfoText">용추계곡</p>
									<p class="detailInfoText">경기도 가평군 가평읍 승안리에 위치한 계곡으로</p>
									<p class="detailInfoText">묽이 맑고 산지가 잘 형성돼 가평에서 가장 유명한 계곡입니다.</p>
									<p class="detailInfoText">※ 더 자세한 정보는 가평계곡  키워드 검색을 통하여 알 수 있습니다.</p>
								</td>
								<td class="aimageBox" colspan="2"><img
									src="${pageContext.request.contextPath}/resources/images/water/gapyeong/image1-4.png"></td>
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
                            <td class="imageBox"><img src="/resources/images/water/food/21015_1490801298818540.jpg"></td>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/water/food/189680_1421570079626.jpg"></td>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/water/food/1002750_1523534251598778.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                        <table class="table4" name='slide2'>
                        <tr>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/water/food/239821_1492091535154527.jpg"></td>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/water/food/113339_1482400369111_40206.jpg"></td>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/water/food/447263_1487843434546697.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                         <table class="table4" name='slide3'>
                        <tr>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/water/food/231718_1499007567496168.jpg"></td>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/water/food/485853_1469081884813_56050.jpg"></td>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/water/food/895244_1537791674477488.jpg"></td>
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
                            <td class="imageBox"><img src="/resources/images/water/hotel/HI534095449.jpg"></td>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/water/hotel/2.jpg"></td>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/water/hotel/01_01.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                        <table class="table4" name='slide2'>
                        <tr>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/water/hotel/30e64083449d44128f377f4d3e14e2f3.jpg"></td>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/water/hotel/HI408753175.jpg"></td>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/water/hotel/1448418435127_6896_SUB_2.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                         <table class="table4" name='slide3'>
                        <tr>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/water/hotel/1N2A9012.jpg"></td>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/water/hotel/89046d55d2954b7fa508e649556060fb.jpg"></td>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/water/hotel/HI515159181.jpg"></td>
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
								style="display: inline-block; color: rgb(161, 161, 161); font-size: 20pt; padding: 0px 45px 0px 45px;">물놀이여행</p>
							<hr
								style="width: 384.5px; border: solid 1.2px rgb(153, 153, 153); display: inline-block; margin-bottom: 10px;">
						</div>

						<table class="table1">
							<tr>
								<td class="imageBox1"><img
									src="${pageContext.request.contextPath}/resources/images/water/sichuan/image1-1.png"></td>
							</tr>
							<tr>
								<td class="imageBox2"><img
									src="${pageContext.request.contextPath}/resources/images/water/sichuan/image1-2.png"></td>
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
									src="${pageContext.request.contextPath}/resources/images/water/sichuan/image1-3.png"></td>
								<td class="textBox">
									<p class="detailInfoTitle">행사소개</p>
									<p class="detailInfoText">무더운 여름엔 강릉에 위치한 이국적인 느낌의 사천진해수욕장으로 떠나보세요</p>

								</td>
							</tr>
							<tr>
								<td class="textBox">
									<p class="detailInfoTitle">행사내용</p>
									<p class="detailInfoText">위치 : 강원도 강릉시 사천면 진리해변길 111</p>
									<p class="detailInfoText">바닷물이 얕고 조용하고 아름다운 곳으로 깨끗한</p>
									<p class="detailInfoText">민박집이 있어 며칠동안 지내기에도 좋은 곳이다.</p>
									<p class="detailInfoText">※ 이용가능 시간과 문의사항은 사천진해변 키워드로 검색하여 확인 하실 수 있습니다.</p>
								</td>
								<td class="imageBox" colspan="2"><img
									src="${pageContext.request.contextPath}/resources/images/water/sichuan/image1-4.png"></td>
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
                            <td class="imageBox"><img src="/resources/images/water/food/465100_1502281899043032.jpg"></td>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/water/food/588987_1517760707139793.jpg"></td>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/water/food/49400_1468566787025_31551.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                        <table class="table4" name='slide2'>
                        <tr>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/water/food/471840_1525403923202350.jpg"></td>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/water/food/506779_1462629709965612.jpg"></td>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/water/food/629093_1481015909967_6103.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                         <table class="table4" name='slide3'>
                        <tr>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/water/food/442121_1470758174448_30250.jpg"></td>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/water/food/306463_1463237854790_3167.jpg"></td>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/water/food/77406_14295440332269251.jpg"></td>
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
                            <td class="imageBox"><img src="/resources/images/water/hotel/HI521770469.jpg"></td>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/water/hotel/HI534714198.jpg"></td>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/water/hotel/HI508889735.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                        <table class="table4" name='slide2'>
                        <tr>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/water/hotel/HI513387986.jpg"></td>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/water/hotel/HI522332616.jpg"></td>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/water/hotel/HI405467640.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                         <table class="table4" name='slide3'>
                        <tr>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/water/hotel/HI229059538.jpg"></td>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/water/hotel/HI512987096.jpg"></td>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/water/hotel/HI509098288.jpg"></td>
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
								style="display: inline-block; color: rgb(161, 161, 161); font-size: 20pt; padding: 0px 45px 0px 45px;">물놀이여행</p>
							<hr
								style="width: 384.5px; border: solid 1.2px rgb(153, 153, 153); display: inline-block; margin-bottom: 10px;">
						</div>

						<table class="table1">
							<tr>
								<td class="imageBox1"><img
									src="${pageContext.request.contextPath}/resources/images/water/haeundae/image1-1.png"></td>
							</tr>
							<tr>
								<td class="imageBox2"><img
									src="${pageContext.request.contextPath}/resources/images/water/haeundae/image1-2.png"></td>
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
									src="${pageContext.request.contextPath}/resources/images/water/haeundae/image1-3.png"></td>
								<td class="textBox">
									<p class="detailInfoTitle">행사소개</p>
									<p class="detailInfoText">부산 & 해수욕장 하면 가장 먼저 떠오르는 한국의 샌프란 시스코  해운대로 떠나보세요.</p>

								</td>
							</tr>
							<tr>
								<td class="textBox">
									<p class="detailInfoTitle">행사내용</p>
									<p class="detailInfoText">예로부터 명승지로 유명했다. 해운대라는 이름은</p>
									<p class="detailInfoText">통일신라시대의 문인 최치원이 소나무와 백사장이 어우</p>
									<p class="detailInfoText">러진 경치에 감탄해 자신의 호인 해운에서 따서 붙인것이다.</p>
									<p class="detailInfoText">※ 해운대에 관하여 자세한 정보를 아시고 싶으시면 해운대 키워드로 검색 해보세요.</p>
								</td>
								<td class="imageBox" colspan="2"><img
									src="${pageContext.request.contextPath}/resources/images/water/haeundae/image1-4.png"></td>
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
                            <td class="imageBox"><img src="/resources/images/water/food/uk-4u7kwkli13p.jpg"></td>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/water/food/351536_1446898001163_45242.jpg"></td>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/water/food/27597_1532674591429530.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                        <table class="table4" name='slide2'>
                        <tr>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/water/food/32479_1430091230949.jpg"></td>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/water/food/9388_1446795591887.jpg"></td>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/water/food/1146797_1541270669174171.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                         <table class="table4" name='slide3'>
                        <tr>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/water/food/s.jpg"></td>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/water/food/236197_1458602494861215.jpg"></td>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/water/food/736026_1488703499069_61163.jpg"></td>
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
                            <td class="imageBox"><img src="/resources/images/water/hotel/HI258893927.jpg"></td>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/water/hotel/HI383792930.jpg"></td>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/water/hotel/01_1216x608_20170822161502.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                        <table class="table4" name='slide2'>
                        <tr>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/water/hotel/mosa1URBER.jpeg"></td>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/water/hotel/room_im01.jpg"></td>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/water/hotel/hihihi.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                         <table class="table4" name='slide3'>
                        <tr>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/water/hotel/HI508890192.jpg"></td>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/water/hotel/afafaf.jpg"></td>
                            <td class="infoBox">
                                
                               
                                
                                
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/water/hotel/36491556.jpg"></td>
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