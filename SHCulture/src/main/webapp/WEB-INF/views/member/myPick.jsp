<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../topMenuBar.jsp"%>

<div class="mainBox">

	<div id="mypageBox">
		<div id="mpSideMenu">
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
			<hr>
			
			<div id="mpSideBottom">
				<div class="mpBitem" onclick="selectMyPick()">
					<div>❤</div>
					<span>찜</span>
				</div>
				<div class="mpBitem" onclick="selectBooking()">
					<div>✔</div>
					<span>예약</span>
				</div>
				<div class="mpBitem"  onclick="selectReser()">
					<div>✎</div>
					<span>리뷰</span>
				</div>
			</div>
		</div>
		
		<div id="mypagePick">
			<div id="mypageArrow" onclick="hiddenMyPick(event)">←</div>
				<c:forEach var="r" items="${rest}">
					<a href="${cpath }/board/selectRest/${r.idx}">
						<div class="myPickBox">
							<div class="myPickImg"><img src="${cpath }/RestSH/${r.restImg}"></div>
							<div class="myPickInfo">
								<div class="myPickName">${r.restName }</div>
								<div class="myPickEtc">${r.ravg }&nbsp;|&nbsp;${r.international }</div>
							</div>
						</div>
					</a>
				</c:forEach>
		</div>	<!-- end of mypagePick -->
	
</div>


<script>
	

	window.onerror = function() {
		location.href = cpath;
	};
	
	var mypageMain = document.getElementById('mypageMain');
	var mypagePick = document.getElementById('mypagePick');
	
	function selectMyPick(){
		location.href = cpath + "/member/myPick";
	}
	
	function hiddenMyPick(e){
		location.href = cpath + "/member/mypageM";
	}
	
	function selectReser(){
		location.href = cpath + "/member/writeReview";
	}
	
	function selectBooking(){
		location.href = cpath + "/member/restBooking";
	}
	
</script>

</body>
</html>