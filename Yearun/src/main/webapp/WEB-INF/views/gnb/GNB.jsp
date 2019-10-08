<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
        <meta charset="utf-8">
        <title>여운test</title>
        <style>
          body{ overflow-y:auto;}
             body, table, div, p, li {font-family: 'Nanum Gothic', sans-serif;}
        *{margin: 0; padding: 0; text-decoration: none;}
            *{
    margin: 0;
    padding: 0;
    text-decoration: none;
    }
            
            .sitemapBox{
            width: 1000px;
            margin: 0 auto;
            }

    #sitemap{
        height:380px;
        width:100%;
        background:  rgb(44,44,44);
    }

    .sitemap1{
        font-size:27px;
        font-weight: bold;
        color:white;
        margin-left:0%; 
    }
    .sitemap2{
        font-size:27px;
        font-weight: bold;
        color:white;
    }

    .sitemap3{
        font-size:27px;
        font-weight: bold;
        color:white;
    }

    .sitemap4{
        font-size:27px;
        font-weight: bold;
        color:white;
        margin-top: 30%;
    }

    .sitemap5{
        font-size:27px;
        font-weight: bold;
        color:white;
    }


    #tour{
        line-height: 60px;
        box-sizing:content-box;
        width:200px;
        height:110px;
        margin-left: 23%;
        padding: 0px;
        float:left;
         margin-top:1.6%
    }


    #board_map{
        line-height: 60px;
        box-sizing:content-box;
        width:200px;
        height:110px;
        margin-left: 3.5%;
        padding: 0px;
        float:left;
         margin-top:1.6%
    }

    #ques_map{
        line-height: 60px;
        box-sizing:content-box;
        width:200px;
        height:110px;
        margin-left: 1%;
        padding: 0px;
        float:left;
         margin-top:1.6%
    }

    #join_map{
        line-height: 60px;
        box-sizing:content-box;
        width:200px;
        height:110px;
        margin-left: 46%;
        padding-right: 0%;
        margin-top:3%;
        float:left;

    }

    #login_map{
        line-height: 60px;
        box-sizing:content-box;
        width:200px;
        height:110px;
        margin-left: 1%;
        padding: 0px;
        margin-top:3%;
        float:left;
    }

    .tourist{
        font-size: 12px;
        margin-left: 2%;
        line-height: 30px;
        color:gray;
        list-style-type: none;
    }
    .board_menu{
        font-size: 12px;
        margin-left: 2%;
        line-height: 30px;
        color:gray;
        list-style-type: none;
    }
    .question{
        font-size: 12px;
        margin-left: 2%;
        line-height: 30px;
        color:gray;
        list-style-type: none;
    }

    .join{
        font-size: 12px;
        margin-left: 2%;
        line-height: 30px;
        color:gray;
        list-style-type: none;
    }

    .login{
        font-size: 12px;
        margin-left: 2%;
        line-height: 30px;
        color:gray;
        list-style-type: none;
    }

                   footer{
        height:270px;
        width:100%;
        background:  rgb(37,36,37);
    }
            
    .footerBox{
    
        width: 1000px;
        margin: 0 auto;
           cursor:default;
    
    }

    #footer_logo{
        margin-top: 50px;
    }

    #footer_address{
        box-sizing:content-box;
        width:619px;
        height:60px;
        line-height: 17px;
        margin-left: 10%;
        margin-top: -1%;
        float:left;

    }

    #footer_call{
        box-sizing:content-box;
        width:170px;
        height:100px;
        line-height: 19px;
        padding-top: 11.5%;
        margin-left: 75%;
        float:left;
        font-size: 12px;
    }
    .address{
        color:white;
        font-size: 12px;
        padding-top: 3px;
    }

    .call{

        color:white;    
        font-size: 12px;
    }

    .add{

        list-style-type: none;
    }

    .cal{
        list-style-type: none;
    }


        </style>
        
        
  
           <body> 
            <div id="sitemap">
             <div>    
                <div class="sitemapBox">
                    
                        <div id="tour">
                            <a class="sitemap1" href="/tour/water#tab1">테마별 여행지</a>
                            <li class="tourist"><a class="tourist" href="/tour/water#tab1">물놀이 여행</a></li>
                            <li class="tourist"><a class="tourist" href="/tour/flower#tab1">꽃구경 여행</a></li>
                            <li class="tourist"><a class="tourist" href="/tour/mountain#tab1">산 여행</a></li>
                            <li class="tourist"><a class="tourist" href="/tour/festival#tab1">페스티벌 여행</a></li>
                        </div>    
                   
                        <div id="board_map">
                             <a class="sitemap2" href="/freeboard/list">게시판</a>
                            <li class="board_menu"><a class="board_menu" href="/freeboard/list">자유게시판</a></li>
                            <li class="board_menu"><a class="board_menu" href="/reviewboard/list">후기게시판</a></li>
                        </div>
                    
                        <div id="ques_map">
                            <a class="sitemap3" href="#">고객센터</a> 
                          
                            <li class="question"><a class="question" href="/question">FAQ</a></li>
                            <li class="question"><a class="question" href="../notice/list">공지사항</a></li>
                        </div>    
                </div>
                <div>    
                    
                        <div id="join_map">
                            <a class="sitemap4" href="/maps/add">여행지등록</a>
                            <li class="join"><a class="join" href="/maps/add">여행지등록</a></li>
                        </div>
                    
                        <div id="login_map">
                            <a class="sitemap5" href="/login" style="visibility: hidden;">로그인</a>
                            <li class="login"><a class="login" href="/login" style="visibility: hidden;">로그인</a></li> 
                            <li class="login"><a class="login" href="/acceptTerms" style="visibility: hidden;">회원가입</a></li>
                            <li class="login"><a class="login" href="#" style="visibility: hidden;">Mypage</a></li>
                        </div>
                </div>
                </div> 
            </div>
               
               
            <footer>
            <div class="footerBox">
                <div id="footer_address">  
                    <img id="footer_logo" src="${pageContext.request.contextPath}/resources/images/footer_logo.png"/>
                    <li class="add"><div class="address">[34503] 대전광역시 동구 우암로 352-21  TEL 010-2741-8822  FAX 010-2741-8822</div></li>
                    <li class="add"><div class="address">COPYRIGHT 2010 BY KOREA POLYTECHNICS. ALL RIGHTS RESERVED.</div></li>
                    <li class="add"><div class="address">본 웹사이트에 게시된 이메일 주소가 전자우편 수집 프로그램이나 그밖의 기술적 장치를 이용하여 무단으로 수집되는 것을</div></li>
                    <li class="add"><div class="address">거부하며, 이를 위반시 정보통신망법에 의해 형사처벌 됨을 유념하시기 바랍니다.</div></li>
                </div>

                <div id="footer_call">
                    <li class="cal"><div class="call">고객센터 예약 및 상담안내</div></li>
                    <li class="cal"><div class="call">평일 (상담시간 9:00 ~ 6:00)</div></li>
                    <li  class="cal"><div class="call">TEL. 1234-1234</div></li>
                    <li class="cal"><div class="call">주말상담</div></li>
                    <li class="cal"><div class="call">TEL. 010-2741-8822</div></li>
                </div>
            </div>
            </footer>
        </body>

</html></html>