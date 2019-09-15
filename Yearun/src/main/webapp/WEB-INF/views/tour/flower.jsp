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
<jsp:include page="../gnb/GNB.jsp" flush="true" />
</head>

<body>
<div class="currentaddress">
      <div class="addressContents">
         
                  <img src="${pageContext.request.contextPath}/resources/images/home.png" class="home">
                   <p>&nbsp;&nbsp;&nbsp;&nbsp;> &nbsp;&nbsp;&nbsp;&nbsp;FLOWER</p>
           
            </div>
 </div>
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

	<div id="tourlist_form">
		<div class="tab-wrap">
			<div id="signup_box">
				<div id="signup_title">꽃놀이 여행</div>

				<div class="signup_index">
					<ul>
						 
						<div id="rectangle1"  class="tab-btn">
							
							<li id="r_text1">
							
							<a href="#tab1" id="a" onclick="active1()">대구 이월드</a></li>
						</div>
						<div id="rectangle2">
							<li id="r_text2">
						
							<a href="#tab2" id="b" onclick="active2()">벽초지 문화 수목원</a></li>
						</div>
						<div id="rectangle3">
							
							<li id="r_text3">
							
							<a href="#tab3" id="c" onclick="active3()">양산 매화</a></li>
						</div>
					</ul>
				</div>





				<article id="tab1">
					<div class="tabBox">
						<div class="titleBox">
							<hr
								style="width: 384.5px; border: solid 1.2px rgb(153, 153, 153); display: inline-block; margin-bottom: 10px;">
							<p class="waterTitle"
								style="display: inline-block; color: rgb(161, 161, 161); font-size: 20pt; padding: 0px 45px 0px 45px;">꽃놀이여행</p>
							<hr
								style="width: 384.5px; border: solid 1.2px rgb(153, 153, 153); display: inline-block; margin-bottom: 10px;">
						</div>

						<table class="table1">
							<tr>
								<td class="imageBox1"><img
									src="${pageContext.request.contextPath}/resources/images/flower/eworld/image1-1.jpg"></td>
							</tr>
							<tr>
								<td class="imageBox2"><img
									src="${pageContext.request.contextPath}/resources/images/flower/eworld/image1-2.jpg"></td>
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
									src="${pageContext.request.contextPath}/resources/images/flower/eworld/image1-3.jpg"></td>
								<td class="textBox">
									<p class="detailInfoTitle">행사소개</p>
									<p class="detailInfoText">전국 유일의 대구 야간벚꽃축제 "별빛벚꽃축제"는 올해로 제
										7회를 맞이한다. 전국에서는 제일 먼저 시작되는 벚꽃 행사로 두류산 일대를 중심으로 진행한다. 아이 주먹만한
										왕벚꽃으로 이루어진 이월드 벚꽃들은 특히 야간에 조명불빛을 받아 오색영롱한 벚꽃으로 재탄생되어 몽환적인 분위기를
										자아내는 것이 일품이다.</p>

								</td>
							</tr>
							<tr>
								<td class="textBox">
									<p class="detailInfoTitle">행사내용</p>
									<p class="detailInfoText">7회를 맞이하는 별빛벚꽃축제는 "Let's pink
										party"</p>
									<p class="detailInfoText">단순한 벚꽃구경을 넘어 놀거리가 가득한 축제이다.</p>
									<p class="detailInfoText">또한 푸드트럭과 프리마켓이 열리는 핑크프리마켓으로 한층 더
										축제분위기를 만끽 할 수 있다.</p>
									<p class="detailInfoText">※ 수시로 업데이트되는 행사 상세내용은 이월드 홈페이지를
										통해 확인하세요.</p>
								</td>
								<td class="aimageBox" colspan="2"><img
									src="${pageContext.request.contextPath}/resources/images/flower/eworld/image1-4.jpg"></td>
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
                            <td class="imageBox"><img src="/resources/images/flower/food/glasofkrh.jpg"></td>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/flower/food/598215_1471313724887841.jpg"></td>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                            <td class="imageBox"><img src="${pageContext.request.contextPath}/resources/images/flower/food/606733_1492856858334_10771.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                        <table class="table4" name='slide2'>
                        <tr>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                            <td class="imageBox"><img src="/resources/images/flower/food/59_1518767096327_13579.jpg"></td>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="${pageContext.request.contextPath}/resources/images/flower/food/442306_1508331380542_186016.jpg"></td>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                            <td class="imageBox"><img src="/resources/images/flower/food/598215_1471313724887841.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                         <table class="table4" name='slide3'>
                        <tr>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                            <td class="imageBox"><img src="${pageContext.request.contextPath}/resources/images/flower/food/1039799_1528101943300_90096.jpg"></td>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/flower/food/19473_1420523708182.jpg"></td>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                            <td class="imageBox"><img src="/resources/images/flower/food/604554_1471361308659_3464.jpg"></td>
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
                            <td class="imageBox"><img src="/resources/images/flower/hotel/dldnjfghxpf.jpg"></td>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/flower/hotel/ekdhsgkdntm.jpeg"></td>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                            <td class="imageBox"><img src="/resources/images/flower/hotel/HI115102971.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                        <table class="table4" name='slide2'>
                        <tr>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                            <td class="imageBox"><img src="/resources/images/flower/hotel/royalsuite01.jpg"></td>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/flower/hotel/dldnjfghxpf.jpg"></td>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                            <td class="imageBox"><img src="/resources/images/flower/hotel/599e98df9797f6.72619768.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                         <table class="table4" name='slide3'>
                        <tr>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                            <td class="imageBox"><img src="/resources/images/flower/hotel/KakaoTalk_20181105_145347635.png"></td>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/flower/hotel/mosajuB9y5.jpeg"></td>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                            <td class="imageBox"><img src="/resources/images/flower/hotel/5999e8acaec7a9.57958935.jpg"></td>
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
								style="display: inline-block; color: rgb(161, 161, 161); font-size: 20pt; padding: 0px 45px 0px 45px;">꽃놀이여행</p>
							<hr
								style="width: 384.5px; border: solid 1.2px rgb(153, 153, 153); display: inline-block; margin-bottom: 10px;">
						</div>

						<table class="table1">
							<tr>
								<td class="imageBox1"><img
									src="${pageContext.request.contextPath}/resources/images/flower/wallcow/image1-1.png"></td>
							</tr>
							<tr>
								<td class="imageBox2"><img
									src="${pageContext.request.contextPath}/resources/images/flower/wallcow/image1-2.png"></td>
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
									src="${pageContext.request.contextPath}/resources/images/flower/wallcow/image1-3.png"></td>
								<td class="textBox">
									<p class="detailInfoTitle">행사소개</p>
									<p class="detailInfoText">벽  초  지    碧[푸를 벽] 草[풀 초] 池[못 지]  자연이 가져다 주는 아름다움과 인간의 창조력에서 시작되어온
										예술과 문화는 본디 한 뿌리에서 시작된다고 생각합니다. 이런 생각속에서 한국의 미와 자연의 아름다움이 어우러지는
										벽초지문화수목원이 탄생하였습니다.</p>

								</td>
							</tr>
							<tr>
								<td class="textBox">
									<p class="detailInfoTitle">행사내용</p>
									<p class="detailInfoText">4~5월 튤립축제</p>
									<p class="detailInfoText">6~8월 알뿌리축제</p>
									<p class="detailInfoText">10~11월 국화/단풍축제</p>
									<p class="detailInfoText">11~3월 빛축제</p>
									<p class="detailInfoText">※ 수시로 업데이트되는 행사 상세내용은 파주 벽초지문화수목원 홈페이지를
										통해 확인하세요.</p>
								</td>
								<td class="imageBox" colspan="2"><img
									src="${pageContext.request.contextPath}/resources/images/flower/wallcow/image1-4.png"></td>
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
                            <td class="imageBox"><img src="/resources/images/flower/food/515.jpg"></td>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/flower/food/rkfflffl.jpg"></td>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                            <td class="imageBox"><img src="${pageContext.request.contextPath}/resources/images/flower/food/549779_1496077474934572.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                        <table class="table4" name='slide2'>
                        <tr>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                            <td class="imageBox"><img src="/resources/images/flower/food/eogks.jpg"></td>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="${pageContext.request.contextPath}/resources/images/flower/food/qksrnwjd.jpg"></td>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                            <td class="imageBox"><img src="/resources/images/flower/food/tlagkrtks.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                         <table class="table4" name='slide3'>
                        <tr>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                            <td class="imageBox"><img src="${pageContext.request.contextPath}/resources/images/flower/food/dlstmznpdj.jpg"></td>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/flower/food/dltxkffl.jpg"></td>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                            <td class="imageBox"><img src="/resources/images/flower/food/vkwnekfr.jpg"></td>
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
                            <td class="imageBox"><img src="/resources/images/flower/hotel/HI398624432.jpg"></td>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/flower/hotel/HI534260763.jpg"></td>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                            <td class="imageBox"><img src="/resources/images/flower/hotel/HI512602061.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                        <table class="table4" name='slide2'>
                        <tr>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                            <td class="imageBox"><img src="/resources/images/flower/hotel/HI408354684.jpg"></td>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/flower/hotel/HI408759405.jpg"></td>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                            <td class="imageBox"><img src="/resources/images/flower/hotel/HI134991472.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                         <table class="table4" name='slide3'>
                        <tr>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                            <td class="imageBox"><img src="/resources/images/flower/hotel/HI166956666.jpg"></td>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/flower/hotel/HI517145540.jpg"></td>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                            <td class="imageBox"><img src="/resources/images/flower/hotel/HI510672369.jpg"></td>
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
								style="display: inline-block; color: rgb(161, 161, 161); font-size: 20pt; padding: 0px 45px 0px 45px;">꽃놀이여행</p>
							<hr
								style="width: 384.5px; border: solid 1.2px rgb(153, 153, 153); display: inline-block; margin-bottom: 10px;">
						</div>

						<table class="table1">
							<tr>
								<td class="imageBox1"><img
									src="${pageContext.request.contextPath}/resources/images/flower/yangsan/image1-1.png"></td>
							</tr>
							<tr>
								<td class="imageBox2"><img
									src="${pageContext.request.contextPath}/resources/images/flower/yangsan/image1-2.png"></td>
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
									src="${pageContext.request.contextPath}/resources/images/flower/yangsan/image1-3.png"></td>
								<td class="textBox">
									<p class="detailInfoTitle">행사소개</p>
									<p class="detailInfoText">해마다 3월경 원동일대에는 봄의 전령사 매화꽃이
										만발한다.깨끗한 자연과 수려한 자연경관으로 유명하며, 봄이면 매화꽃이 만발하여 양산 지역 인근뿐만 아니라 소문을
										듣고 전국에서 많은 사람들이 낙동강변과 매화꽃이 어우러진 절경에서 사진을 찍거나 가족ㆍ연인들과의 드라이브코스로도
										즐길만하다.</p>

								</td>
							</tr>
							<tr>
								<td class="textBox">
									<p class="detailInfoTitle">행사내용</p>
									<p class="detailInfoText">축제에는 다양한 볼거리 (공연, 전시, 체험프로그램),</p>
									<p class="detailInfoText">먹거리 (원동 특산물 장터, 푸드코트, 푸드트럭) 등</p>
									<p class="detailInfoText">다양한 프로그램들이 진행된다.</p>
									<p class="detailInfoText">※ 수시로 업데이트되는 행사 상세내용은 양산구 홈페이지를
										통해 확인하세요.</p>
								</td>
								<td class="imageBox" colspan="2"><img
									src="${pageContext.request.contextPath}/resources/images/flower/yangsan/image1-4.png"></td>
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
                            <td class="imageBox"><img src="/resources/images/flower/food/rnscla.jpg"></td>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/flower/food/ekath.jpg"></td>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                            <td class="imageBox"><img src="/resources/images/flower/food/EMfkr.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                        <table class="table4" name='slide2'>
                        <tr>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                            <td class="imageBox"><img src="/resources/images/flower/food/tktkdizl.jpg"></td>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/flower/food/thltmxk.jpg"></td>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                            <td class="imageBox"><img src="/resources/images/flower/food/gkagmd.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                         <table class="table4" name='slide3'>
                        <tr>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                            <td class="imageBox"><img src="/resources/images/flower/food/wnrfla.jpg"></td>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/flower/food/cpsxmfh.jpg"></td>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                            <td class="imageBox"><img src="/resources/images/flower/food/gyehs.jpg"></td>
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
                            <td class="imageBox"><img src="/resources/images/flower/hotel/20166217053.jpg"></td>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/flower/hotel/12272116_8.jpg"></td>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                            <td class="imageBox"><img src="/resources/images/flower/hotel/HI512987398.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                        <table class="table4" name='slide2'>
                        <tr>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                            <td class="imageBox"><img src="/resources/images/flower/hotel/HI344492702.jpg"></td>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/flower/hotel/167175553177863_2.jpeg"></td>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                            <td class="imageBox"><img src="/resources/images/flower/hotel/HI258461857.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                         <table class="table4" name='slide3'>
                        <tr>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                            <td class="imageBox"><img src="/resources/images/flower/hotel/HI406530356.jpg"></td>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/flower/hotel/HI405785267.jpg"></td>
                            <td class="infoBox">
                                 
                                
                                 
                                 
                                 
                            </td>
                            <td class="imageBox"><img src="/resources/images/flower/hotel/HI293317340.jpg"></td>
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