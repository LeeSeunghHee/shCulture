<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../topMenuBar.jsp"%>


<div class="mainBox">
	<div id="mgReserBox">
		<div id="mgReserBoxLeft">
			<div id="mypageArrow" onclick="goTo_mypage(event)">←</div>
			<c:forEach var="rest" items="${rest }">
				<div class="mgReserL" onclick="selectReser(event)">
					<div class="mgReserIdx" hidden="true">${rest.idx }</div>
					<div class="mgReserImg"><img src="${cpath }/RestSH/${rest.restImg}"></div>
					<div class="mgReserCon">
						<div class="mgReserName">${rest.restName }</div>
						<div class="mgReserEtc"><span>★</span>&nbsp;${rest.ravg } | ${rest.international }</div>
					</div>
				</div>
			</c:forEach>
		</div>	<!-- end of mgReserBoxLeft -->
	</div>	<!-- end of mgReserBox -->
</div>

<script>
	function goTo_mypage(){
		location.href = cpath + '/member/mypageO';
	};
	
	async function selectReser(e){
		let rest;
		const target = e.target.closest(".mgReserL").querySelector('.mgReserIdx');
		if(target){
			rest = parseInt(target.innerText);
		}
		const baseUrl = cpath + '/restaurant/manageReviewList';
		var url = baseUrl + '?rest=' + rest;
		const response = await fetch(url);
		if(response.ok){
			window.location.href = url;
		} else {
			console.log(response.status);
			throw new Error('서버 응답에 실패하였습니다.')
		}
	};
</script>

</body>
</html>