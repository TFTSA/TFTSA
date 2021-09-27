<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<style type="text/css">
hr{
	margin-top: 0 !important;
	margin-bottom: 0 !important;
}
div#left{
	/* width: 250px !important; */
	margin: 5px;
	-webkit-box-flex: 0.5;
      -ms-flex: 0.5;
          flex: 0.5;
}
div#right{
	border-left:1px solid #cbcbcb;
	width: 600px;
	margin:5px;
	flex: 1.4;
	padding: 10px 0;
	padding-left: 50px;
	align-items: baseline !important;
}
ul{
	padding-inline-start:0;
}
ul#bar{
	list-style:none;
}
ul#bar li{
	/* float:center; */
	width:170px;
	height:30px;
	padding:2px;
}
ul#bar li a{
	text-decoration:none;
	width:120px;
	height:30px;
	display: block;
	text-align:center;
	margin:0;
	color: #343a40;
}
ul#bar li a:hover{
	width:120px;
	height: 30px;
	text-decoration:none;
	color:white;
	background: #42acae;
	text-align:center;
	margin:0;	
	display: block;
	border-radius:3px;
}
div.box {
	padding-top: 15px; 
	width:900px !important; 
	align:center;
}
.btn2{
	display: inline-block;
    padding: 8px 45px;
    background-color: #133e3f;
    border: 1px solid #133e3f;
    color: #ffffff;
    margin-top: 35px;
}
.btn2:hover{
	display: inline-block;
    padding: 8px 45px;
    background-color: white;
    /* border: 1px solid #133e3f; */
    color: #133e3f;
    margin-top: 35px;
}
.event_section .event_container .box {
	align-items: flex-start !important;
}
img{
	width: 120px;
	height: 120px;
	object-fit: cover;
}
</style>



</head>

<body class="sub_page">
	<div class="hero_area">

		<c:import url="/WEB-INF/views/common/menubar.jsp" />

	</div>
	<!-- event section -->
	<section class="event_section layout_padding">
		<div class="container">
			<div class="heading_container" style="padding-left: 130px;">
				<h3 style="padding-left: 15px;">마이페이지</h3>
			</div>
			<div class="event_container" align="center">
				<div class="box">
					<div id="left">
						<div>
							<c:choose>
								<c:when test="${student.pic ne null}">
									<img alt="" src="${ pageContext.servletContext.contextPath }/resources/images/mypage/studentImg/${student.pic}">
								</c:when>
								<c:when test="${tutor.pic ne null}">
									<img alt="" src="${ pageContext.servletContext.contextPath }/resources/images/mypage/tutorImg/${tutor.pic}">
								</c:when>
								<c:otherwise>
									<img alt="" src="${ pageContext.servletContext.contextPath }/resources/images/member/profileDefault.gif">
								</c:otherwise>
							</c:choose>
						</div>
						<div style="padding-top: 5px;">
							<ul id="bar">
								<li><a href="myPage.do?user_id=${loginMember.user_id }">프로필</a></li>
								<c:if test="${loginMember.user_position eq 'S' }">
								<li><a href="clist.do?user_no=${loginMember.user_no }">채팅목록</a></li>
								<li><a href="wishl.do?user_no=${loginMember.user_no }">찜 목록</a></li>
								</c:if>
								<c:if test="${loginMember.user_position eq 'T' }">
								<li><a href="clist.do?user_no=${loginMember.user_no }">채팅목록</a></li>
								</c:if>
								<li><a href="mclass.do?user_no=${loginMember.user_no }" style="color:white; background: #42acae; border-radius:3px;">내 강의 내역</a></li>
							</ul>
						</div>
			            <br><a style="color:#969ca2;" href="" onclick="deleteuser(); return false;">회원탈퇴</a>
					</div>
					<div id="right">
					<form action="upUser.do" method="post" enctype="multipart/form-data">
						<!-- <div>
						<table>
							<tr>
							</tr>
						</table>
						</div><br> -->
						<div>
							<h4 align="left">내 프로필</h4>
							<input type="hidden" name="origin_userpwd" value="${requestScope.member.user_pwd }">
							<input type="hidden" name="user_no" value="${member.user_no }">
							<table>
								<Tr>
									<td width="150px">이름</td>
									<td><input type="text" name="user_name" value="${member.user_name }" readonly></td>
								</Tr>
								<Tr>
									<td>아이디</td>
									<td><input type="text" name="user_id" value="${member.user_id }" readonly></td>
								</Tr>
								<tr>
									<td>비밀번호</td>
									<td><input type="password" id="user_pwd" name="user_pwd"></td>
								</tr>
								<tr>
									<td>비밀번호 확인</td>
									<td><input type="password" id="userpwd2" onblur="validate();"></td>
								</tr>
								<Tr>
									<td>휴대폰번호</td>
									<td><input type="tel" name="user_phone" value="${member.user_phone }" pattern="\d{3}-\d{4}-\d{4}"></td>
								</Tr>
								<Tr>
									<td>이메일</td>
									<td><input type="email" name="user_email" value="${member.user_email }"></td>
								</Tr>
							<c:if test="${member.user_position eq 'S'}">
								<Tr>
									<td>학년</td>
									<td>
										<select id="stu_job" name="stu_job">
											<c:if test="${student.stu_job eq '유치원생' }">
												<c:set var="selected1" value="selected"/>
											</c:if>
											<c:if test="${student.stu_job eq '초등학생' }">
												<c:set var="selected2" value="selected"/>
											</c:if>
											<c:if test="${student.stu_job eq '중학생' }">
												<c:set var="selected3" value="selected"/>
											</c:if>
											<c:if test="${student.stu_job eq '고등학생' }">
												<c:set var="selected4" value="selected"/>
											</c:if>
											<c:if test="${student.stu_job eq '대학생' }">
												<c:set var="selected5" value="selected"/>
											</c:if>
											<c:if test="${student.stu_job eq '재수생' }">
												<c:set var="selected6" value="selected"/>
											</c:if>
											<c:if test="${student.stu_job eq '직장인' }">
												<c:set var="selected7" value="selected"/>
											</c:if>
											<option value="selectnone">== 선택 ==</option>
											<option value="유치원생" ${selected1 }>유치원생</option>
											<option value="초등학생" ${selected2 }>초등학생</option>
											<option value="중학생" ${selected3 }>중학생</option>
											<option value="고등학생" ${selected4 }>고등학생</option>
											<option value="대학생" ${selected5 }>대학생</option>
											<option value="재수생" ${selected6 }>재수생</option>
											<option value="직장인" ${selected7 }>직장인</option>
										</select>
									</td>
								</Tr>
								<Tr>
									<td>과외 가능 요일</td>
									<td>
									<c:forTokens items="${student.day }" delims="," var="day">
										<c:if test="${day eq '월' }">
											<c:set var="checked0" value="checked"/>
										</c:if>
										<c:if test="${day eq '화' }">
											<c:set var="checked1" value="checked"/>
										</c:if>
										<c:if test="${day eq '수' }">
											<c:set var="checked2" value="checked"/>
										</c:if>
										<c:if test="${day eq '목' }">
											<c:set var="checked3" value="checked"/>
										</c:if>
										<c:if test="${day eq '금' }">
											<c:set var="checked4" value="checked"/>
										</c:if>
										<c:if test="${day eq '토' }">
											<c:set var="checked5" value="checked"/>
										</c:if>
										<c:if test="${day eq '일' }">
											<c:set var="checked6" value="checked"/>
										</c:if>
									</c:forTokens>
										<input type="checkbox" name="day" value="월" ${checked0}> 월요일
										<input type="checkbox" name="day" value="화" ${checked1}> 화요일
										<input type="checkbox" name="day" value="수" ${checked2}> 수요일
										<input type="checkbox" name="day" value="목" ${checked3}> 목요일<br>
										<input type="checkbox" name="day" value="금" ${checked4}> 금요일
										<input type="checkbox" name="day" value="토" ${checked5}> 토요일
										<input type="checkbox" name="day" value="일" ${checked6}> 일요일
									</td>
								</Tr>
								<Tr>
									<td>과외 가능 시간</td>
									<td><input type="text" id="stime" name="stime" value="" class="timePicker" placeholder="00:00">
										 ~ 
										<input type="text" id="etime" name="etime" value="" class="timePicker" placeholder="24:00">
									</td>
								</Tr>
								<Tr>
									<td>선생님께 바라는 점</td>
									<td><textarea name="stu_wish" rows="3" cols="26">${student.stu_wish }</textarea></td>
								</Tr>
							</c:if>
							<c:if test="${member.user_position eq 'T'}">
								<Tr>
									<td>한줄소개</td>
									<td><input type="text" name="intro" value="${tutor.intro }"></td>
								</Tr>
								<Tr>
									<td>학력</td>
									<td><input type="text" name="l_grd" value="${tutor.l_grd }"></td>
								</Tr>
								<Tr>
									<td>과목</td>
									<td>
									<c:forEach items="${requestScope.subjectList }" var="subject">
									
										<c:if test="${ subject.sub_no eq 1}">${subject.category }<br></c:if>
										<c:if test="${ subject.sub_no eq 7}">${subject.category }<br></c:if>
										<c:if test="${ subject.sub_no eq 12}">${subject.category }<br></c:if>
										<c:if test="${ subject.sub_no eq 18}">${subject.category }<br></c:if>
										<c:if test="${ subject.sub_no eq 29}">${subject.category }<br></c:if>
										<c:if test="${ subject.sub_no eq 42}">${subject.category }<br></c:if>
										<c:if test="${ subject.sub_no eq 4}"><br></c:if>
										<c:if test="${ subject.sub_no eq 15}"><br></c:if>
										<c:if test="${ subject.sub_no eq 22}"><br></c:if>
										<c:if test="${ subject.sub_no eq 33}"><br></c:if>
										<c:if test="${ subject.sub_no eq 38}"><br></c:if>
										<c:if test="${ subject.sub_no eq 47}"><br></c:if>
											<input type="checkbox" name="sub_no" value="${subject.sub_no }"
													<c:forTokens items="${tutor.sub_name }" delims=", " var="subject_name">
													<c:if test="${subject.sub_name eq subject_name }">
													checked
													</c:if>
													</c:forTokens>
											>${subject.sub_name }&nbsp;
										<c:if test="${ subject.sub_no eq 6}"><hr></c:if>
										<c:if test="${ subject.sub_no eq 11}"><hr></c:if>
										<c:if test="${ subject.sub_no eq 17}"><hr></c:if>
										<c:if test="${ subject.sub_no eq 28}"><hr></c:if>
										<c:if test="${ subject.sub_no eq 41}"><hr></c:if>
									
									</c:forEach>
									</td>
								</Tr>
								<Tr>
									<td>과외 가능 요일</td>
									<td>
									<c:forTokens items="${tutor.day }" delims="," var="day">
										<c:if test="${day eq '월' }">
											<c:set var="checked0" value="checked"/>
										</c:if>
										<c:if test="${day eq '화' }">
											<c:set var="checked1" value="checked"/>
										</c:if>
										<c:if test="${day eq '수' }">
											<c:set var="checked2" value="checked"/>
										</c:if>
										<c:if test="${day eq '목' }">
											<c:set var="checked3" value="checked"/>
										</c:if>
										<c:if test="${day eq '금' }">
											<c:set var="checked4" value="checked"/>
										</c:if>
										<c:if test="${day eq '토' }">
											<c:set var="checked5" value="checked"/>
										</c:if>
										<c:if test="${day eq '일' }">
											<c:set var="checked6" value="checked"/>
										</c:if>
									</c:forTokens>
										<input type="checkbox" name="day" value="월" ${checked0}> 월요일
										<input type="checkbox" name="day" value="화" ${checked1}> 화요일
										<input type="checkbox" name="day" value="수" ${checked2}> 수요일
										<input type="checkbox" name="day" value="목" ${checked3}> 목요일<br>
										<input type="checkbox" name="day" value="금" ${checked4}> 금요일
										<input type="checkbox" name="day" value="토" ${checked5}> 토요일
										<input type="checkbox" name="day" value="일" ${checked6}> 일요일
									</td>
								</Tr>
								<Tr>
									<td>과외 가능 시간</td>
									<td>
					                     <input type="text" id="stime" name="stime" value="${stime }" class="timePicker">
					                     ~
					                     <input type="text" id="etime" name="etime" value="${etime }" class="timePicker">
									</td>
								</Tr>
								<Tr>
									<td>1회당 수업시간(분)</td>
									<td><input type="number" name="class_min" min="30" max="480" step="10" value="${tutor.class_min }"></td>
								</Tr>
								<Tr>
									<td>수업 횟수(월)</td>
									<td><input type="number" name="class_times" min="1" max="30" step="1" value="${tutor.class_times }"></td>
								</Tr>
								<Tr>
									<td>과외 가능 지역</td>
									<td>
										시/도: 
		                   			<select name='city' onchange="categoryChange(this);" >
				                       <option value=''>전체</option>
				                       <option value="서울">서울특별시</option>
				                       <option value='부산'>부산광역시</option>
				                       <option value='대구'>대구광역시</option>
				                       <option value='인천'>인천광역시</option>
				                       <option value='광주'>광주광역시</option>
				                       <option value='대전'>대전광역시</option>
				                       <option value='울산'>울산광역시</option>
				                       <option value='경기'>경기도</option>
				                       <option value='강원'>강원도</option>
				                       <option value='충북'>충청북도</option>
				                       <option value='충남'>충청남도</option>
				                       <option value='전북'>전라북도</option>
				                       <option value='전남'>전라남도</option>
				                       <option value='경북'>경상북도</option>
				                       <option value='경남'>경상남도</option>
				                       <option value='제주'>제주도</option>
				                    </select>                                                  
		                               구/군: 
				                    <select name='country' id="country">
				                       <option value=''>전체</option>
				                    </select>
									</td>
								</Tr>
								<Tr>
									<td>최소페이${tutor.min_pay }</td>
									<td>
										<select id="min_pay" name="min_pay">
										<c:if test="${tutor.min_pay eq '15만원 이하' }">
											<c:set var="select0" value="selected"/>
										</c:if>
										<c:if test="${tutor.min_pay eq '20만원' }">
											<c:set var="select1" value="selected"/>
										</c:if>
										<c:if test="${tutor.min_pay eq '25만원' }">
											<c:set var="select2" value="selected"/>
										</c:if>
										<c:if test="${tutor.min_pay eq '30만원' }">
											<c:set var="select3" value="selected"/>
										</c:if>
										<c:if test="${tutor.min_pay eq '35만원' }">
											<c:set var="select4" value="selected"/>
										</c:if>
										<c:if test="${tutor.min_pay eq '40만원' }">
											<c:set var="select5" value="selected"/>
										</c:if>
										<c:if test="${tutor.min_pay eq '45만원' }">
											<c:set var="select6" value="selected"/>
										</c:if>
										<c:if test="${tutor.min_pay eq '50만원' }">
											<c:set var="select7" value="selected"/>
										</c:if>
										<c:if test="${tutor.min_pay eq '55만원' }">
											<c:set var="select8" value="selected"/>
										</c:if>
										<c:if test="${tutor.min_pay eq '60만원' }">
											<c:set var="select9" value="selected"/>
										</c:if>
										<c:if test="${tutor.min_pay eq '65만원' }">
											<c:set var="select10" value="selected"/>
										</c:if>
										<c:if test="${tutor.min_pay eq '70만원' }">
											<c:set var="select11" value="selected"/>
										</c:if>
										<c:if test="${tutor.min_pay eq '75만원' }">
											<c:set var="select12" value="selected"/>
										</c:if>
										<c:if test="${tutor.min_pay eq '80만원 이상' }">
											<c:set var="select13" value="selected"></c:set>
										</c:if>
											<c:set var="select0" value="selected"/>
											<option value="selectnone">== 선택 ==</option>
											<option value="15만원 이하" ${select0}>15만원 이하</option>
											<option value="20만원" ${select1}>20만원</option>
											<option value="25만원" ${select2}>25만원</option>
											<option value="30만원" ${select3}>30만원</option>
											<option value="35만원" ${select4}>35만원</option>
											<option value="40만원" ${select5}>40만원</option>
											<option value="45만원" ${select6}>45만원</option>
											<option value="50만원" ${select7}>50만원</option>
											<option value="55만원" ${select8}>55만원</option>
											<option value="60만원" ${select9}>60만원</option>
											<option value="65만원" ${select10}>65만원</option>
											<option value="70만원" ${select11}>70만원</option>
											<option value="75만원" ${select12}>75만원</option>
											<option value="80만원 이상" ${select13}>80만원 이상</option>
										</select>
									</td>
								</Tr>
								<Tr>
									<td>화상가능여부</td>
									<td>
									<c:if test="${tutor.online_ok eq 'Y' }">
										<input type="radio" name="online_ok" value="Y" checked> 가능 &nbsp;
										<input type="radio" name="online_ok" value="N"> 불가능
									</c:if>
									<c:if test="${tutor.online_ok eq 'N' }">
										<input type="radio" name="online_ok" value="Y"> 가능 &nbsp;
										<input type="radio" name="online_ok" value="N" checked> 불가능
									</c:if>
									</td>
								</Tr>
								<Tr>
									<td>과외 스타일</td>
									<td><textarea name="style" rows="3" cols="40">${tutor.style }</textarea></td>
								</Tr>
								<Tr>
									<td>성격</td>
									<td>
									<c:forEach items="${requestScope.keyList }" var="keyword">
										<input type="checkbox" name="key_no" value="${keyword.key_no }"
												<c:forTokens items="${tutor.key_name }" delims=", " var="keyword_name">
													<c:if test="${keyword.type_per eq keyword_name }">
													checked
													</c:if>
													</c:forTokens>
												>${keyword.type_per }&nbsp;
										<c:if test="${ keyword.key_no eq 6}"><br></c:if>
										<c:if test="${ keyword.key_no eq 12}"><br></c:if>
										<c:if test="${keyword.key_no eq 17 }"><br></c:if>
										
									</c:forEach>
									</td>
								</Tr>
							</c:if>
							</table>
						<div class="btn-box" align="center">
							<a href="javascript:history.go(-1);">이전 페이지로 이동</a> &nbsp; 
							<input type="submit" value="수정하기" class="btn2"> &nbsp; 
							<input type="reset" value="수정취소" class="btn2"> &nbsp;</div>
						</div>
						</form>
					</div>
						
				</div>
				
			</div>

		</div>
	</section>

	<!-- end event section -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />

</body>
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

<script type="text/javascript">
function categoryChange(e){
	var seoul = ["전체","강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
	var busan = ['전체','강서구','금정구','남구','동구','동래구','부산진구','북구','사상구','사하구','서구','수영구','연제구','영도구','중구','해운대구','기장군'];
	var daegu = ['전체','남구','달서구','동구','북구','서구','수성구','중구','달성군'];
	var daejeon = ['전체','대덕구','동구','서구','유성구','중구'];
	var gwangju = ['전체','광산구','남구','동구','북구','서구'];
	var ulsan = ['전체','남구','동구','북구','중구','울주군'];
	var incheon = ['전체','계양구','남구','남동구','동구','부평구','서구','연수구','중구','강화군','옹진군']
	var gyeonggi = ['전체','고양시','과천시','광명시','구리시','군포시','남양주시','동두천시','부천시','성남시','수원시','시흥시','안산시','안양시','오산시','의왕시','의정부시','평택시','하남시','가평군','광주시','김포시','안성시','양주군','양평군','여주군','연천군','용인시','이천군','파주시','포천시','화성시'];
	var gangwon = ['전체','강릉시','동해시','삼척시','속초시','원주시','춘천시','태백시','고성군','양구군','양양군','영월군','인제군','정선군','철원군','평창군','홍천군','화천군','황성군'];
	var chungbuk = ['전체','제천시','청주시','충주시','괴산군','단양군','보은군','영동군','옥천군','음성군','진천군','청원군'];
	var chungnam = ['전체','공주시','보령시','서산시','아산시','천안시','금산군','논산군','당진군','부여군','서천군','연기군','예산군','청양군','태안군','홍성군'];
	var jeonbuk = ['전체','군산시','김제시','남원시','익산시','전주시','정읍시','고창군','무주군','부안군','순창군','완주군','임실군','장수군','진안군'];
	var jeonnam = ['전체','광양시','나주시','목포시','순천시','여수시','여천시','강진군','고흥군','곡성군','구례군','담양군','무안군','보성군','신안군','여천군','영광군','영암군','완도군','장성군','장흥군','진도군','함평군','해남군','화순군'];
	var gyeongbuk = ['전체','경산시','경주시','구미시','김천시','문경시','상주시','안동시','영주시','영천시','포항시','고령군','군위군','봉화군','성주군','영덕군','영양군','예천군','울릉군','울진군','의성군','청도군','청송군','칠곡군'];
	var gyeongnam = ['전체','거제시','김해시','마산시','밀양시','사천시','울산시','진주시','진해시','창원시','통영시','거창군','고성군','남해군','산청군','양산시','의령군','창녕군','하동군','함안군','함양군','합천군'];
	var jegu = ['전체','서귀포시','제주시','남제주군','북제주군'];
	var target = document.getElementById("country");
	
	//console.log("e.value : "+e.value);
	if(e.value == "서울") var a = seoul;
	else if(e.value == "부산") var a = busan;
	else if(e.value == "대구") var a = daegu;
	else if(e.value == "대전") var a = daejeon;
	else if(e.value == "광주") var a = gwangju;
	else if(e.value == "울산") var a = ulsan;
	else if(e.value == "인천") var a = incheon;
	else if(e.value == "경기") var a = gyeonggi;
	else if(e.value == "강원") var a = gangwon;
	else if(e.value == "충북") var a = chungbuk;
	else if(e.value == "충남") var a = chungnam;
	else if(e.value == "전북") var a = jeonbuk;
	else if(e.value == "전남") var a = jeonnam;
	else if(e.value == "경북") var a = gyeongbuk;
	else if(e.value == "경남") var a = gyeongnam;
	else if(e.value == "제주") var a = jegu;
	
	target.options.length = 0;
	
	for (x in a){
		var opt = document.createElement("option");
		opt.value = a[x];
		opt.innerHTML = a[x];
		target.appendChild(opt);
	}
}


/* $(document).ready(function () { */
$(function () {
	console.log($.timepicker);
	$('#stime').timepicker({
		'timeFormat' : 'HH:mm',
		'minTime' : '06:00',
		'maxTime' : '23:30',
		'scrollDefaultNow' : true
	}).on('changeTime', function() { //stime 을 선택한 후 동작
		var from_time = $("input[name='stime']").val(); //stime 값을 변수에 저장
		$('#etime').timepicker('option', 'minTime', from_time);//etime의 mintime 지정

		if ($('#etime').val() && $('#etime').val() < from_time) {
			$('#etime').timepicker('setTime', from_time);
			//etime을 먼저 선택한 경우 그리고 etime시간이 stime시간보다 작은경우 etime시간 변경
		}
	});

	$('#etime').timepicker({
		'timeFormat' : 'HH:mm',
		'minTime' : '06:00',
		'maxTime' : '23:30'
	});//etime 시간 기본 설정
});

function validate() {
	//유효성 검사 코드 작성함
	//서버 컨트롤러로 전송할 값들이 요구한 조건을 모두 만족하였는지 검사함

	//암호와 암호 확인이 일치하지 않는지 확인함
	var pwdValue = document.getElementById("userpwd").value;
	var pwdValue2 = document.getElementById("userpwd2").value;

	if (pwdValue !== pwdValue2) {
		alert("암호와 암호 확인의 값이 일치하지 않습니다.");
		document.getElementById("userpwd").select();
		return false; //전송 취소함
	}

	return true; //전송함
}

function deleteuser(){
	if(confirm("회원탈퇴를 계속 진행하시겠습니까?")== true){
		location.href="deleteUser.do?user_id=${member.user_id}";	
	}else{
		return;
	}
}

</script>
</html>