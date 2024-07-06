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
		
		<div id="mypageMain">
			<div id="reviewBox">
				<div id="BoxR"><a href="${cpath }/member/writeReview">나의 리뷰</a></div>		
				<div class="reviewLOne">
					<table id="reviewTable">
					<tbody id="reviewTTbody">
						<c:forEach var="r" items="${review}">
							<tr>
								<td class="rName"><a href="${cpath }/member/selectReview/${r.rest}">${r.restName }</a></td>
								<td class="rReview">${r.review }</td>
								<td class="rStar"><span>★</span>${r.star }</td>
								<td class="rDate">${r.writeDate }</td>
							</tr>
						</c:forEach>
					</tbody>
					</table>
				</div>
			</div>
			<div id="reserBox">
				<div id="BoxE"><a href="${cpath }/member/restBooking">예약</a></div>
				<div class="reserLTwo">
					<table id="reserTable">
						<thead id="reserTThead">
						<tr>
							<th>상호명</th>
							<th>예약일자</th>
							<th>시간</th>
							<th>예약인원</th>
							<th>상태</th>
						</tr>
						</thead>
						<tbody id="reserTTbody">
						<c:forEach var="s" items="${reser }">
							<tr>
								<td>${s.restName }</td>
								<td>${s.reserDate }</td>
								<td>${s.reserTime }</td>
								<td>${s.people }</td>
								<c:choose>
									<c:when test="${s.approval eq 0}">
										<td>대기</td>
									</c:when>
									<c:when test="${s.approval eq 1}">
										<td>거절</td>
									</c:when>
									<c:when test="${s.approval eq 2}">
										<td>승인</td>
									</c:when>
								</c:choose>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>	<!-- end of mypageBox -->
	
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
	
	function selectReser(){
		location.href = cpath + "/member/writeReview";
	}
	
	function selectBooking(){
		location.href = cpath + "/member/restBooking";
	}
	
</script>

</body>
</html>