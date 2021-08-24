<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

	<title>payment</title>	  
		
</head>

<style type="text/css">
.upper {
    padding: 1rem 0;
    justify-content: space-evenly
}

.input-payment {
    border: 1px solid rgba(0, 0, 0, 0.137);
    padding: 1vh;
    margin-bottom: 1vh;
    outline: none;
    width: 100%;
    background-color: rgb(247, 247, 247)
}

.input-payment:focus::-webkit-input-placeholder {
    color: transparent
}

.header-payment {
    font-size: 1.5rem
}

.left {
    background-color: #ffffff;
    padding: 2vh
}

.left img {
    width: 2rem
}

.left .col-4 {
    padding-left: 0
}

.right-payment {
    padding: 0.3rem 0
}

.right-payment {
    background-color: #ffffff;
    padding: 2vh
}

.lower-payment {
    line-height: 2
}

.btn-payment {
    background-color: rgb(23, 4, 189);
    border-color: rgb(23, 4, 189);
    color: white;
    width: 100%;
    font-size: 0.7rem;
    margin: 0vh 0 1.5vh 0;
    padding: 1.5vh;
    border-radius: 0
}

.btn-payment:focus {
    box-shadow: none;
    outline: none;
    box-shadow: none;
    color: white;
    -webkit-box-shadow: none;
    -webkit-user-select: none;
    transition: none
}

.btn-payment:hover {
    color: white
}

.input-payment[type=checkbox] {
    width: unset;
    margin-bottom: unset
}

.input-payment[type=radio] {
    width: unset;
    margin-bottom: unset
}

.header-hidden {
	visibility: hidden;
}

.grey-color {
	color: grey;
}
</style>

<body class="sub_page">
  <div class="hero_area">
    
    <c:import url="/WEB-INF/views/common/menubar.jsp" />
    
  </div>
	
	<div class="row upper">
		<div class="row">
			<div class="col-md-7">
				<p><b class="header-payment">결제 하기</b></p>
				<div class="left border">
					<p><b>주문 내역</b></p>
					<p><img src="https://img.icons8.com/color/48/000000/visa.png" />영어과외 해드립니다.</p>
					<form>
						<div class="row">
							<div class="col-5 grey-color">
								기본항목
							</div>
							<div class="col-2 grey-color">
								인원선택
							</div>
							<div class="col-2 grey-color">
								수업일
							</div>
							<div class="col-2 grey-color">
								가격
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-5">
								영어과외 해드립니다.
							</div>
							<div class="col-2">
								1
							</div>
							<div class="col-2">
								8일
							</div>
							<div class="col-2">
								500,000원
							</div>
						</div>
						<div class="row">
							<div class="col-5">
								1회당 레슨시간(분) : 120분
							</div>
						</div>
						<div class="row">
							<div class="col-5">
								레슨 횟수 : 8회
							</div>
						</div>
					</form>
				</div>
				<br>
				<div class="left border">
					<form>
						<div class="row">
							<div class="col-6">
								<p><b>학생 정보</b></p>
								<ul class="grey-color">
									<li>본인 확인 후 구매가 가능합니다.(첫 결제 1회 한정)</li>
									<li>인증된 정보에 따라 실명이 자동 업데이트됩니다</li>
								</ul>
							</div>
							<div class="col-6">
								<p><b><input class="input-payment" type="checkbox">&nbsp;이용약관 전체 동의</b></p>
								<p class="grey-color"><input class="input-payment" type="checkbox">&nbsp;만 14세 이상입니다.(필수)</p>
								<p class="grey-color"><input class="input-payment" type="checkbox">&nbsp;서비스 이용약관에 동의합니다.(필수)</p>
								<p class="grey-color"><input class="input-payment" type="checkbox">&nbsp;개인정보 수집, 이용에 동의합니다.(필수)</p>							
								<p class="grey-color"><input class="input-payment" type="checkbox">&nbsp;이벤트 할인 혜택 알림 수신에 동의합니다.(선택)</p>
								<p class="grey-color"><input class="input-payment" type="checkbox">&nbsp;장기 미접속 시 계정 활성 상태 유지합니다.(선택)</p>
							</div>
						</div>
					</form>
				</div>
				<br>
				<div class="left border">
					<form>
						<div class="row">
							<div class="col-3">
								<p><b>할인 / 포인트사용</b></p>
							</div>
							<div class="col-5">

							</div>
						</div>
						<div class="row">
							<div class="col-3">
								사용 가능한 쿠폰
							</div>
							<div class="col-8">
								<input class="input-payment" placeholder="사용 가능한 쿠폰 없음">
							</div>
						</div>
						<div class="row">
							<div class="col-3">
								포인트 사용
							</div>
							<div class="col-5">
						 		<input class="input-payment" placeholder="0원">
							</div>
							<div class="col-3">
								<button class="btn-payment">전액사용</button>
							</div>
						</div>
						<div class="row">
							<div class="col-3">
								
							</div>
							<div class="col-5 grey-color">
						 		보유 포인트 : 0원
							</div>
							<div class="col-3">
								
							</div>
						</div>
					</form>
				</div>
				<br>
				<div class="left border">
					<form>
						<p><b>결제방법</b></p>
						<div class="row">
							<div class="col-2">
								<input class="input-payment" type="radio" name="payment" checked>신용카드
							</div>
							<div class="col-3">
						 		<input class="input-payment"type="radio" name="payment">실시간 계좌이체
							</div>
							<div class="col-3">
								<input class="input-payment" type="radio" name="payment">무통장입금
							</div>
							<div class="col-2">
								<input class="input-payment" type="radio" name="payment">휴대폰
							</div>
							<div class="col-2">
								<input class="input-payment" type="radio" name="payment">카카오페이
							</div>
						</div>
					</form>
				</div>
				<br>
				<div class="left border">
					<ul>
						<li>개인 전문가이므로 세금계산서 발행이 불가능합니다.</li>
						<li>현금영수증(사업자지출증빙) / 신용카드 매입전표는 매입세액공제 사용이 불가능합니다.[매입세액공제 안내]</li>
						<li>현금영수증 / 신용카드 영수증은 개인 소득 공제용으로만 사용하실 수 있습니다.</li>
					</ul>
				</div>
				<p class="header-payment header-hidden">결제 하기</p>
			</div>
			
			<div class="col-md-5 quickmenu">
				<p class="header-payment header-hidden">결제 하기</p>
				<div class="right-payment border">
					<div class="row lower-payment">
						<div class="col text-left">총 서비스 금액</div>
						<div class="col text-right">500,000원</div>
					</div>
					<div class="row lower-payment">
						<div class="col text-left">쿠폰 할인</div>
						<div class="col text-right">0원</div>
					</div>
					<div class="row lower-payment">
						<div class="col text-left">포인트 사용</div>
						<div class="col text-right">0원</div>
					</div>
					<hr>
					<div class="row lower-payment">
						<div class="col text-left">
							<b>총 결제금액</b>
						</div>
						<div class="col text-right">
							<b>500,000원</b>
						</div>
					</div>
					<br>
					<div class="row lower-payment">
						<div class="col">
							<p class="text-muted text-center">
								<input class="input-payment" type="checkbox">&nbsp;주문 내용을 확인하였으며, 결제에 동의합니다.(필수)
							</p>
						</div>
					</div>
					<button class="btn-payment">결제하기</button>
					<p class="text-muted text-center">서비스 제공이 완료된 이후에 전문가에게 결제 대금이 전달됩니다.</p>
				</div>
			</div>
		</div>
	</div>
	
	<c:import url="/WEB-INF/views/common/footer.jsp" />
	
</body>

<script type="text/javascript">
	$(document).ready(function() {
		var currentPosition = parseInt($(".quickmenu").css("top"));
		
		$(window).scroll(function() {
			var position = $(window).scrollTop();
			var scrollTop = position + currentPosition;
			
			if (scrollTop > 795){
				scrollTop = 795
			}
			
			$(".quickmenu").stop().animate({
				"top" : scrollTop + "px"
			}, 100);
		});
	});
</script>

</html>