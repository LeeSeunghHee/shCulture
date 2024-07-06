<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../topMenuBar.jsp"%>


<div class="mainBox">
	<div id="qnaHeader">어떤 불편사항이 있으신가요?</div>
	
	<div id="qnaBtnBox">
		<button id="qnaWBtn" onclick="qnaWrite()">문의하기</button>
	</div>
	<c:if test="${login.userId != null and count != 0}">
	<div id="qnaList">
		<table id="qnaTable">
			<thead id="qnaThead">
				<tr>
					<th>카테고리</th>
					<th>제목</th>
					<th>작성일</th>
					<th>관리자</th>
				</tr>
			</thead>
			<tbody id="qnaTbody">
				<c:forEach var="q" items="${qna }">
				<tr onclick="selectQna(event)">
					<td class="qnaIdx" hidden="true">${q.idx }</td>
					<td>${q.qnaCategory }</td>
					<td>${q.title }</td>
					<td>${q.writeDate }</td>
				<c:if test="${q.rep == 1 }">
					<td class="checkRep">✔</td>
				</c:if>
				<c:if test="${q.rep == 0 }">
					<td></td>
				</c:if>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	</c:if>
	
</div>

</body>

<script>

	function qnaWrite(){
		var login = "${login.userId}";
		
		if(login === ''){
			alert('로그인 후 이용가능합니다.')
			location.href = cpath + '/member/login';
		} else {
			location.href = cpath + '/manager/qnaSubmit';
		}
	}
	
	
	async function selectQna(e){
		const tr = e.target.closest('tr');
		const td = tr.querySelector('.qnaIdx');
		const idx = td.innerText;
		
		const baseUrl = cpath + '/manager/selectQna';
		const url = baseUrl + '?idx=' + idx;
		
		const response = await fetch(url);
		if(response.ok){
			window.location.href = url;
		} else {
			console.log(response.status);
			throw new Error('서버 응답에 실패하였습니다.');
		}
	}
</script>

</html>