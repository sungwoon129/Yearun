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
<style>
 @import url('https://fonts.googleapis.com/css?family=Nanum+Gothic');
 @import url(https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css);
 
</style>
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
                   <p>&nbsp;&nbsp;&nbsp;&nbsp;> &nbsp;&nbsp;&nbsp;&nbsp;FESTIVAL</p>
           
            </div>
 </div>


	<div id="tourlist_form">
		<div class="tab-wrap">
			<div id="signup_box">
				<div id="signup_title">페스티벌 여행</div>

				<div class="signup_index">
					<ul>
						<div id="rectangle1">
							<li id="r_text1"><a href="#tab1" onclick="active1()" id="a">공주 백제문화제</a></li>
						</div>
						<div id="rectangle2">
							<li id="r_text2"><a href="#tab2" onclick="active2()" id="b">보령 머드축제</a></li>
						</div>
						<div id="rectangle3">
							<li id="r_text3"><a href="#tab3" onclick="active3()" id="c">자라섬 재즈축제</a></li>
						</div>
					</ul>
				</div>





				<article id="tab1">
					<div class="tabBox">
						<div class="titleBox">
							<hr
								style="width: 384.5px; border: solid 1.2px rgb(153, 153, 153); display: inline-block; margin-bottom: 10px;">
							<p class="waterTitle"
								style="display: inline-block; color: rgb(161, 161, 161); font-size: 20pt; padding: 0px 45px 0px 45px;">페 스 티 벌</p>
							<hr
								style="width: 384.5px; border: solid 1.2px rgb(153, 153, 153); display: inline-block; margin-bottom: 10px;">
						</div>

						<table class="table1">
							<tr>
								<td class="imageBox1"><img
									src="${pageContext.request.contextPath}/resources/images/festival/gongju/image1-1.png"></td>
							</tr>
							<tr>
								<td class="imageBox2"><img
									src="${pageContext.request.contextPath}/resources/images/festival/gongju/image1-2.png"></td>
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
									src="${pageContext.request.contextPath}/resources/images/festival/gongju/image1-3.png"></td>
								<td class="textBox">
									<p class="detailInfoTitle">행사소개</p>
									<p class="detailInfoText">백제문화제는 매년 충청남도 공주시와 부여군이 합동 개최하는 종합예술제 성격의 문화제이다. 1955년 충청남도 부여군에서 처음 개최하였다. 백제문화제는 제천의식으로 시작하였으며 해를 거듭하면서 지역의 종합문화 행사로 성장하였다.</p>

								</td>
							</tr>
							<tr>
								<td class="textBox">
									<p class="detailInfoTitle">행사내용</p>
									<p class="detailInfoText">제전행사(백제혼불채화, 팔충제, 삼산제 등...)</p>
									<p class="detailInfoText">역사재현행사(백제 성황 사비정도축제 등...)</p>
									<p class="detailInfoText">전통민속행사(국제자매도시 민속공연 등...)</p>
									<p class="detailInfoText">※ 수시로 업데이트되는 행사 상세내용은 백제문화제 홈페이지를
										통해 확인하세요.</p>
								</td>
								<td class="aimageBox" colspan="2"><img
									src="${pageContext.request.contextPath}/resources/images/festival/gongju/image1-4.png"></td>
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
                               <!--  <h2 class="slideTitle">제목</h2>
                                
                                
                                
                                 -->
                            </td>
                            <td class="imageBox"><img src="/resources/images/festival/food/rharhf.jpg"></td>
                            <td class="infoBox">
                              <!--   <h2 class="slideTitle">제목</h2>
                                
                                
                                
                                 -->
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/festival/food/rhdtkstjd.jpg"></td>
                            <td class="infoBox">
                           <!--      <h2 class="slideTitle">제목</h2>
                                
                                
                                
                                 -->
                            </td>
                            <td class="imageBox"><img src="/resources/images/festival/food/akrhrtk.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                        <table class="table4" name='slide2'>
                        <tr>
                            <td class="infoBox">
                         <!--        <h2 class="slideTitle">제목</h2>
                                
                                
                                
                                 -->
                            </td>
                            <td class="imageBox"><img src="/resources/images/festival/food/aogid.jpg"></td>
                            <td class="infoBox">
                             <!--    <h2 class="slideTitle">제목</h2>
                                
                                
                                
                                 -->
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/festival/food/qmfkdns.jpg"></td>
                            <td class="infoBox">
                             <!--    <h2 class="slideTitle">제목</h2>
                                
                                
                                
                                 -->
                            </td>
                            <td class="imageBox"><img src="/resources/images/festival/food/todlgkr.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                         <table class="table4" name='slide3'>
                        <tr>
                            <td class="infoBox">
                            <!--     <h2 class="slideTitle">제목</h2>
                                
                                
                                
                                 -->
                            </td>
                            <td class="imageBox"><img src="/resources/images/festival/food/toddhfl.jpg"></td>
                            <td class="infoBox">
                            <!--     <h2 class="slideTitle">제목</h2>
                                
                                
                                
                                 -->
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/festival/food/wjdekdns.jpg"></td>
                            <td class="infoBox">
                         <!--        <h2 class="slideTitle">제목</h2>
                                
                                
                                
                                 -->
                            </td>
                            <td class="imageBox"><img src="/resources/images/festival/food/vlxkdrlaxkd.jpg"></td>
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
                              <!--   <h2 class="slideTitle">제목</h2>
                                
                                
                                
                                 -->
                            </td>
                            <td class="imageBox"><img src="/resources/images/festival/hotel/ink.jpg"></td>
                            <td class="infoBox">
                             <!--    <h2 class="slideTitle">제목</h2>
                                
                                
                                
                                 -->
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/festival/hotel/rPfydtks.jpg"></td>
                            <td class="infoBox">
                            <!--     <h2 class="slideTitle">제목</h2>
                                
                                
                                
                                 -->
                            </td>
                            <td class="imageBox"><img src="/resources/images/festival/hotel/zkfkqks.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                        <table class="table4" name='slide2'>
                        <tr>
                            <td class="infoBox">
                     <!--            <h2 class="slideTitle">제목</h2>
                                
                                
                                
                                 -->
                            </td>
                            <td class="imageBox"><img src="/resources/images/festival/hotel/ejwkwk.jpg"></td>
                            <td class="infoBox">
                               <!--  <h2 class="slideTitle">제목</h2>
                                
                                
                                
                                 -->
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/festival/hotel/qkffl.jpg"></td>
                            <td class="infoBox">
                                
                                
                                
                                
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/festival/hotel/thfqkfka.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                         <table class="table4" name='slide3'>
                        <tr>
                            <td class="infoBox">
                                <h2 class="slideTitle">제목</h2>
                                
                                
                                
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/festival/hotel/dkdls.jpg"></td>
                            <td class="infoBox">
                                <h2 class="slideTitle">제목</h2>
                                
                                
                                
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/festival/hotel/dkdls2.jpg"></td>
                            <td class="infoBox">
                                <h2 class="slideTitle">제목</h2>
                                
                                
                                
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/festival/hotel/zhwlxpak.jpg"></td>
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
								style="display: inline-block; color: rgb(161, 161, 161); font-size: 20pt; padding: 0px 45px 0px 45px;">페 스 티 벌</p>
							<hr
								style="width: 384.5px; border: solid 1.2px rgb(153, 153, 153); display: inline-block; margin-bottom: 10px;">
						</div>

						<table class="table1">
							<tr>
								<td class="imageBox1"><img
									src="${pageContext.request.contextPath}/resources/images/festival/bolyeong/image1-1.png"></td>
							</tr>
							<tr>
								<td class="imageBox2"><img
									src="${pageContext.request.contextPath}/resources/images/festival/bolyeong/image1-2.png"></td>
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
									src="${pageContext.request.contextPath}/resources/images/festival/bolyeong/image1-3.png"></td>
								<td class="textBox">
									<p class="detailInfoTitle">행사소개</p>
									<p class="detailInfoText">보령머드축제(Boryeong Mud festival)는 대한민국 충청남도 보령시 주관으로 대천해수욕장을 기반으로 개최되는 지역 축제이다. 대천해수욕장을 비롯한 지역 관광명소를 홍보코자 충청남도 보령시에서 1998년 7월에 처음으로 축제를 개최하였다.문화체육관광부 선정 '대한민국 글로벌육성 축제'로 지정되었다.</p>

								</td>
							</tr>
							<tr>
								<td class="textBox">
									<p class="detailInfoTitle">행사내용</p>
									<p class="detailInfoText">보령머드축제는 대천해수욕장에서 매년 7월경에 개최</p>
									<p class="detailInfoText"> 머드(진흙)를 이용하여 마사지 등을 즐길수 있다.</p>
									<p class="detailInfoText">머드 불꽃축제, 머드셀프 마사지존</p>
									<p class="detailInfoText"> 머드 바디페인팅, 각종 공연 등이 행해진다.</p>
									<p class="detailInfoText">※ 수시로 업데이트되는 행사 상세내용은 보령시청 홈페이지를
										통해 확인하세요.</p>
								</td>
								<td class="imageBox" colspan="2"><img
									src="${pageContext.request.contextPath}/resources/images/festival/bolyeong/image1-4.png"></td>
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
                                <h2 class="slideTitle">제목</h2>
                                
                                
                                
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/festival/food/eowjsqhsrk.jpg"></td>
                            <td class="infoBox">
                                <h2 class="slideTitle">제목</h2>
                                
                                
                                
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/festival/food/enqkf.jpg"></td>
                            <td class="infoBox">
                                <h2 class="slideTitle">제목</h2>
                                
                                
                                
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/festival/food/ajrqhsp.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                        <table class="table4" name='slide2'>
                        <tr>
                            <td class="infoBox">
                                <h2 class="slideTitle">제목</h2>
                                
                                
                                
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/festival/food/qkdnstm.jpg"></td>
                            <td class="infoBox">
                                <h2 class="slideTitle">제목</h2>
                                
                                
                                
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/festival/food/qhrwhfl.jpg"></td>
                            <td class="infoBox">
                                <h2 class="slideTitle">제목</h2>
                                
                                
                                
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/festival/food/qhddlftlr.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                         <table class="table4" name='slide3'>
                        <tr>
                            <td class="infoBox">
                    
                            </td>
                            <td class="imageBox"><img src="/resources/images/festival/food/tpdud.jpg"></td>
                            <td class="infoBox">
                   
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/festival/food/dhdltl.jpg"></td>
                            <td class="infoBox">
      
                            </td>
                            <td class="imageBox"><img src="/resources/images/festival/food/thsh.jpg"></td>
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
                            <td class="imageBox"><img src="/resources/images/festival/hotel/1820.jpg"></td>
                            <td class="infoBox">
                     
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/festival/hotel/shdmfqkek.jpg"></td>
                            <td class="infoBox">
      
                            </td>
                            <td class="imageBox"><img src="/resources/images/festival/hotel/wpsltm.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                        <table class="table4" name='slide2'>
                        <tr>
                            <td class="infoBox">
        
                            </td>
                            <td class="imageBox"><img src="/resources/images/festival/hotel/epdlsktm.jpg"></td>
                            <td class="infoBox">
    
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/festival/hotel/ajemfls.jpg"></td>
                            <td class="infoBox">
             
                            </td>
                            <td class="imageBox"><img src="/resources/images/festival/hotel/qlcp.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                         <table class="table4" name='slide3'>
                        <tr>
                            <td class="infoBox">
             
                            </td>
                            <td class="imageBox"><img src="/resources/images/festival/hotel/dhtusqb.jpg"></td>
                            <td class="infoBox">
              
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/festival/hotel/dndus.jpg"></td>
                            <td class="infoBox">
               
                            </td>
                            <td class="imageBox"><img src="/resources/images/festival/hotel/vkfhtm.jpg"></td>
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
								style="display: inline-block; color: rgb(161, 161, 161); font-size: 20pt; padding: 0px 45px 0px 45px;">페 스 티 벌</p>
							<hr
								style="width: 384.5px; border: solid 1.2px rgb(153, 153, 153); display: inline-block; margin-bottom: 10px;">
						</div>

						<table class="table1">
							<tr>
								<td class="imageBox1"><img
									src="${pageContext.request.contextPath}/resources/images/festival/jaejeu/image1-1.png"></td>
							</tr>
							<tr>
								<td class="imageBox2"><img
									src="${pageContext.request.contextPath}/resources/images/festival/jaejeu/image1-2.png"></td>
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
									src="${pageContext.request.contextPath}/resources/images/festival/jaejeu/image1-3.png"></td>
								<td class="textBox">
									<p class="detailInfoTitle">행사소개</p>
									<p class="detailInfoText">자라섬은 축제와 환상의 섬 1년에 고작 3일이라는 짧은 기간에 열림에도 불구하고 14회 동안 자라섬재즈의 누적관객수는 약 200만 명이 넘는다.
									잔디밭에 누워, 쏟아지는 별을 맞으며, 사랑하는 사람과 함께 최고의 음악을 듣는 시간. 10월에는 가평, 자라섬으로 떠나보자!</p>

								</td>
							</tr>
							<tr>
								<td class="textBox">
									<p class="detailInfoTitle">행사내용</p>
									<p class="detailInfoText">자라섬재즈축제는 대천해수욕장에서 매년 7월경에 개최</p>
									<p class="detailInfoText"> 머드(진흙)를 이용하여 마사지 등을 즐길수 있다.</p>
									<p class="detailInfoText">머드 불꽃축제, 머드셀프 마사지존</p>
									<p class="detailInfoText"> 머드 바디페인팅, 각종 공연 등이 행해진다.</p>
									<p class="detailInfoText">※ 수시로 업데이트되는 행사 상세내용은 보령시청 홈페이지를
										통해 확인하세요.</p>
								</td>
								<td class="imageBox" colspan="2"><img
									src="${pageContext.request.contextPath}/resources/images/festival/jaejeu/image1-4.png"></td>
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
                            <td class="imageBox"><img src="/resources/images/festival/food/rnlrhr.jpg"></td>
                            <td class="infoBox">
          
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/festival/food/fkvptmxk.jpg"></td>
                            <td class="infoBox">
                     
                            </td>
                            <td class="imageBox"><img src="/resources/images/festival/food/ahlchs.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                        <table class="table4" name='slide2'>
                        <tr>
                            <td class="infoBox">
        
                            </td>
                            <td class="imageBox"><img src="/resources/images/festival/food/tkalrk.jpg"></td>
                            <td class="infoBox">
                   
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/festival/food/tjgh.jpg"></td>
                            <td class="infoBox">
                    
                            </td>
                            <td class="imageBox"><img src="/resources/images/festival/food/tjsdn.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                         <table class="table4" name='slide3'>
                        <tr>
                            <td class="infoBox">
                         
                            </td>
                            <td class="imageBox"><img src="/resources/images/festival/food/dbaudtks.jpg"></td>
                            <td class="infoBox">
               
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/festival/food/dlTps.jpg"></td>
                            <td class="infoBox">
                    
                            </td>
                            <td class="imageBox"><img src="/resources/images/festival/food/codnjs.jpg"></td>
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
                            <td class="imageBox"><img src="/resources/images/festival/hotel/wwldn.jpg"></td>
                            <td class="infoBox">
                       
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/festival/hotel/qorskrwp.jpg"></td>
                            <td class="infoBox">
               
                            </td>
                            <td class="imageBox"><img src="/resources/images/festival/hotel/gksmftkfkd.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                        <table class="table4" name='slide2'>
                        <tr>
                            <td class="infoBox">
                        
                            </td>
                            <td class="imageBox"><img src="/resources/images/festival/hotel/flqpfk.jpg"></td>
                            <td class="infoBox">
                        
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/festival/hotel/qhdwnfm.jpg"></td>
                            <td class="infoBox">
                       
                            </td>
                            <td class="imageBox"><img src="/resources/images/festival/hotel/dkdlflttm.jpg"></td>
                        </tr>
                    </table>
                        </div>
                          <div>
                         <table class="table4" name='slide3'>
                        <tr>
                            <td class="infoBox">
                      
                            </td>
                            <td class="imageBox"><img src="/resources/images/festival/hotel/rptmxm.jpg"></td>
                            <td class="infoBox">
                            
                        
                            </td>
                        </tr>
                        <tr>
                            <td class="imageBox"><img src="/resources/images/festival/hotel/wndjffl.jpg"></td>
                            <td class="infoBox">
                                
                            </td>
                            <td class="imageBox"><img src="/resources/images/festival/hotel/zpdlvkq.jpg"></td>
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