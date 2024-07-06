<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../topMenuBar.jsp" %>

<div class="mainBox">
	<div id="userRestBox">
		<c:forEach var="user" items="${userRest }">
				<div class="userRestList">
					<div class="userRestImg"><img src="${cpath }/RestSH/${user.restImg}"></div>
					<div class="userRestFir">
						<div class="aBox">
							<div class="userRestN">${user.restName }</div>
							<div class="userRestS"><span class="userRstar">★</span>${user.ravg }</div>
						</div>
						<div class="userRestBtn">
							<a href="${cpath }/restaurant/modifyRest/${user.idx}">
								<div class="restUpdateBtn">수정</div>
							</a>
							<div class="restDeleteBtn" onclick="restIdx(event)">삭제</div>
							<div class="userRestIdx" hidden="true">${user.idx }</div>
						</div>
					</div> <!-- end of userRestFir -->
				</div>	<!-- end of userRestList -->
		</c:forEach>
	</div>
</div>

<script>
	function restIdx(e){
		if(window.confirm('정말 삭제하시겠습니까?')){
			const list = e.target.closest('.userRestList')
			const idx = list.querySelector('.userRestIdx').innerText;
			deleteRest(idx);
		}
	};
	
	async function deleteRest(idx){
		const url = cpath + '/restaurant/deleteRest';
		const data = {
				idx: idx
		}
		const opt = {
				method: 'POST',
				body: JSON.stringify(data),
				headers: {
					'Content-Type': 'application/json; charset=utf-8'
				}
		}
		const result = await fetch(url, opt).then(resp => resp.text());
		if(result == 1){
			location.reload();
		} else {
			alert('관리자에게 문의해주세요')
		}
	};
</script>

</body>
</html>