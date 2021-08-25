<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <title>Joson</title>


  <!-- bootstrap core css -->
<!--   <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
  fonts style
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700|Poppins:400,600,700&display=swap" rel="stylesheet" />
  Custom styles for this template
  <link href="css/style.css" rel="stylesheet" />
  responsive style
  <link href="css/responsive.css" rel="stylesheet" /> -->
  <style type="text/css">
	.profilePic{width:200px; height:200px}
	.info-title{width:760px; height:200px}
	.new-info{margin:0; padding:0; width:650px; height:60px;
					margin-left:12px;}
	.info-head{margin:0; padding:0; width:650px; height:60px;
					margin-left:12px}
	.head{margin:0; padding:0; width:650px; height:60px;
			margin-left:12px}
			
	.select-heart{width:40px;height:40px; margin-left:250px;}
	
	.stitle{margin:0; padding:0; width:500px; height:30px;
			margin-left:12px; }
	.sstitle{margin:0; padding:0; width:500px; height:30px;
			margin-left:12px;}
	
    .usp{width:20px;height:20px; margin-left:10px;}
	
	.review{margin:0; padding:0; width:250px; height:24px;
			margin-left:10px}
	.star1{margin:0; padding:0; width:250px; height:24px;
			margin-left:0px}
	.emptystar{width:20px;height:20px;}
	.stars{ list-style:none; float:left;}
	
	.detail-box{width:960px; height:100px; margin:0px; padding:0; margin-top:50px;}
	
	.menus{width:960px;height:100px;margin:0px; padding:0;list-style-type: none; }
	.d-d{width:215px;height:60px;margin:0px; padding:0;
		 list-style:none; float:left;
	   	font-size:15px;
		padding: 0; 
		}

	
  </style>
</head>

<body class="sub_page">
  <div class="hero_area">
   <c:import url="/WEB-INF/views/common/menubar.jsp" />
  </div>

  <!-- about section -->
  <section class="about_section layout_padding">
    <div class="side_img">
      <img src="${ pageContext.servletContext.contextPath }/resources/images/side-img.png" alt="" />
    </div>
    <div class="container">
      <div class="row">
      <div class="pic">
          <img src="${ pageContext.servletContext.contextPath }/resources/images/c-3.jpg" class="profilePic" >
          </div>
         <div class="info-title">
        
        	<div class="info-head">
        		<div class="head" style="font-size:30px; text-align:center; margin-top:10px">
        		
                      영어과외 or 선생님이름
                      <img src="${ pageContext.servletContext.contextPath }/resources/images/select.png" class="select-heart" >
          		</div>
          		
             <div class="stitle">
             	<div class="sstitle">
             <img src="${ pageContext.servletContext.contextPath }/resources/images/uni.png" class="usp" >
             <span class="uni" style="width:30px; height:30px; margin-left:10px; ">
                           학교
             	</span>
             	</div>
              </div>
              
             <div class="stitle">
             <div class="sstitle">
             <img src="${ pageContext.servletContext.contextPath }/resources/images/sub.jpg" class="usp" >
              <span class="sub" style="width:30px; height:30px; margin-left:10px;">
                           과목
             	</span>
             </div>
             </div>
             
             <div class="stitle">
             <div class="sstitle">
             <img src="${ pageContext.servletContext.contextPath }/resources/images/place.png" class="usp" >
              <span class="place" style="width:30px; height:30px; margin-left:10px;">
                           지역
             	</span>
             	<button style="margin:0;width:100px;height:50px;margin-left:525px; border: none;border-radius:10px;text-decoration: none;background-color:#20c997; color:white">채팅하기</button>
              
             </div>
             </div>
          
             <div class="stitle">
               <div class="sstitle">
             <div class="review">
                <ul class="star1">
                	<li class="stars"><img src="${ pageContext.servletContext.contextPath }/resources/images/star.png" class="emptystar"></li>
                	<li class="stars"><img src="${ pageContext.servletContext.contextPath }/resources/images/star.png" class="emptystar"></li>
                	<li class="stars"><img src="${ pageContext.servletContext.contextPath }/resources/images/star.png" class="emptystar"></li>
                	<li class="stars"><img src="${ pageContext.servletContext.contextPath }/resources/images/star.png" class="emptystar"></li>
                	<li class="stars"><img src="${ pageContext.servletContext.contextPath }/resources/images/star.png" class="emptystar"></li>
                	  &nbsp;  <span class="point" style="font-size:18px"> 0.0</span>
                	  <span calss="reviewcount" style="font-size:13px;">(갯수)</span>
                	 
                </ul>
                
             </div>
               </div>
             </div>
        </div>
        </div>
        
        
          <div class="detail-box">
        
                <ul class="menus">
                	<li class="d-d" ><a href="#" style="border-top:0px;border-left:0px;border-right:0px;background:white; display:block; text-align:center;color:black;">프로필</a></li>
                	<li class="d-d" ><a href="#" style="border-top:0px;border-left:0px;border-right:0px;background:white; display:block; text-align:center;color:black">사진</a></li>
                	<li class="d-d" ><a href="#" style="border-top:0px;border-left:0px;border-right:0px;background:white; display:block; text-align:center;color:black" >리뷰</a></li>
                	<li class="d-d" ><a href="#" style="border-top:0px;border-left:0px;border-right:0px;background:white; display:block; text-align:center;color:black;">질문/답변</a></li>
                
                  </ul>
      
             </div>
            <div class="heading_container">
            
             <section class="tutor-info" style="width:960px; height:1800px; margin:0px; padding:0px">
             <form>
              <h5>한줄소개</h5>
              <Br>
              <table class="intro" style="width:960px;height:50px; margin:0px; padding:0px;">
               	<tr><td>내용</td></tr>
              </table>
               <hr>
               <br>
               
              <h5>학교</h5>
              <Br>
              <table class="intro" style="width:960px;height:50px; margin:0px; padding:0px;">
               	<tr><td>내용</td></tr>
              </table>
              <hr>
              <br>
              
              <h5>거주지</h5>
              <Br>
              <table class="intro" style="width:960px;height:50px; margin:0px; padding:0px;">
               	<tr><td>내용</td></tr>
              </table>
              <hr>
              <br>
              
              <h5>과외가능지역</h5>
              <Br>
              <table class="intro" style="width:960px;height:50px; margin:0px; padding:0px;">
               	<tr><td>내용</td></tr>
              </table>
              <hr>
              <br>
              
              <h5>성격</h5>
              <Br>
              <table class="intro" style="width:960px;height:50px; margin:0px; padding:0px;">
               	<tr><td>내용</td></tr>
              </table>
              <hr>
              <br>
              
              <h5>과목</h5>
              <Br>
              <table class="intro" style="width:960px;height:50px; margin:0px; padding:0px;">
               	<tr><td>내용</td></tr>
              </table>
              <hr>
              <br>
              
              <h5>수업료</h5>
              <Br>
              <table class="intro" style="width:960px;height:50px; margin:0px; padding:0px;">
               	<tr><td>내용</td></tr>
              </table>
              <hr>
              <br>
              
              <h5>수업내용</h5>
              <Br>
              <table class="intro" style="width:960px;height:50px; margin:0px; padding:0px;">
               	<tr><td>내용</td></tr>
              </table>
              <hr>
              <br>
              
              <h5>수업방식</h5>
              <Br>
              <table class="intro" style="width:960px;height:50px; margin:0px; padding:0px;">
               	<tr><td>내용</td></tr>
              </table>
              <hr>
              <br>
              
              <h5>과외가능 시간/요일</h5>
              <Br>
              <table class="intro" style="width:960px;height:50px; margin:0px; padding:0px;">
               	<tr><td>내용</td></tr>
              </table>
              <hr>
              <br>
              
              <h5>나이</h5>
              <Br>
              <table class="intro" style="width:960px;height:50px; margin:0px; padding:0px;">
               	<tr><td>내용</td></tr>
              </table>
              <hr>
              <br>
              </form>
              
             </section>
             
              <Br><Br>
            
		 <section class="pic_video" style="width:960px; height:200px; margin:0px; padding:0px">
        	
        	     <form>
              <h5>사진</h5>
              <Br>
              <table class="intro" style="width:960px;height:50px; margin:0px; padding:0px;">
               	<tr><td>내용</td></tr>
              </table>
               <hr>
               <br>
               
              
              </form>
              
             </section>
             
              <section class="dreview" style="width:960px; height:1800px; margin:0px; padding:0px">
        	
        	
             <div class="reviews">
             <h5>리뷰</h5>
                <ul class="star1">
                
                	<li class="stars"><img src="${ pageContext.servletContext.contextPath }/resources/images/star.png" class="emptystar"></li>
                	<li class="stars"><img src="${ pageContext.servletContext.contextPath }/resources/images/star.png" class="emptystar"></li>
                	<li class="stars"><img src="${ pageContext.servletContext.contextPath }/resources/images/star.png" class="emptystar"></li>
                	<li class="stars"><img src="${ pageContext.servletContext.contextPath }/resources/images/star.png" class="emptystar"></li>
                	<li class="stars"><img src="${ pageContext.servletContext.contextPath }/resources/iimages/star.png" class="emptystar"></li>
                	  &nbsp;  <span class="point" style="font-size:18px"> 0.0</span>
                	  <span calss="reviewcount" style="font-size:13px;">(갯수)</span>
                	 
                </ul>
                
            
             </div>
             
        	     
              <div class="">
              <Br><Br>
              <ul style="list-style:none; marign:0px;padding:0px; margin-right:10px;">
              		<li class="">
              			<table class="intro" style="width:990px;height:50px; margin:0px; padding:0px;" >
              			  <tr><td>이름</td></tr>
              			  <tr><td>작성날짜</td></tr>
              			  <tr><td> 
              			  <ul class="star1">
                	<li class="stars"><img src="${ pageContext.servletContext.contextPath }/resources/iimages/star.png" class="emptystar"></li>
                	<li class="stars"><img src="${ pageContext.servletContext.contextPath }/resources/iimages/star.png" class="emptystar"></li>
                	<li class="stars"><img src="${ pageContext.servletContext.contextPath }/resources/iimages/star.png" class="emptystar"></li>
                	<li class="stars"><img src="${ pageContext.servletContext.contextPath }/resources/iimages/star.png" class="emptystar"></li>
                	<li class="stars"><img src="${ pageContext.servletContext.contextPath }/resources/iimages/star.png" class="emptystar"></li>
                	  &nbsp;  <span class="point" style="font-size:18px"> 0.0</span>
                	 </ul>
                	 <br>
                		<tr><td>내용</td></tr>
                		
                			
              			</table>
              		</li>
               </ul>
               <button style="margin:0;width:80px;height:30px;margin-left:525px; border: none;border-radius:10px;text-decoration: none;background-color:#fff; color:#20c997; font-size:15px;">더보기</button>	
              </div>
               <hr>
               <br>
               <button style="margin:0;width:150px;height:50px;margin-left:40%; border: none;border-radius:20px;text-decoration: none;background-color:#20c997; color:white">리뷰 더보기</button>
              
              
            
              
             </section>
             
            </div>
          </div>
        </div>
     
  </section>

  <!-- end about section -->

   <c:import url="/WEB-INF/views/common/footer.jsp" />
  <!-- footer section -->
<!-- 
  <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
  <script type="text/javascript" src="js/bootstrap.js"></script>
 -->
</body>

</html>