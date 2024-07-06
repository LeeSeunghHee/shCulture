<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../topMenuBar.jsp"%>

<div class="mainBox">

	<div id="mypageBox">
		<div id="mpSOideMenu">
			<div id="mypagePB">
				<c:if test="${not empty login.profileImg}">
					<img src="${cpath }/MemberSH/${login.profileImg}">
				</c:if>
				<c:if test="${empty login.profileImg}">
					<img src="${cpath }/resources/image/basicProfile.png">
				</c:if>
			</div>
			<div class="userNick">${login.nickname }</div>
			<div class="modifyPbtn"><a href="${cpath }/member/modifyP">설정</a></div>
		</div>
		
		<div id="mypageOMain">
			<div class="mpOBitem" onclick="manageRest(event)">	
				<div>🏘</div>
				<span>매장관리</span>
			</div>
			<div class="mpOBitem" onclick="manageReser(event)">
				<div>✔</div>
				<span>예약관리</span>
			</div>
			<div class="mpOBitem" onclick="manageReview(event)">
				<div>✎</div>
				<span>리뷰관리</span>
			</div>
		</div>
	</div>
	
</div>

<script>
	function manageReser(e){
		window.location.href = cpath+'/restaurant/manageReser';
	}
	
	function manageRest(e){
		window.location.href = cpath + '/restaurant/userRest';
	}
	
	function manageReview(e){
		window.location.href = cpath + '/restaurant/manageReview';
	}
</script>

</body>
</html>