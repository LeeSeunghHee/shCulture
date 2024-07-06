<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../topMenuBar.jsp"%>


<div class="mainBox">
	<div class="qnaSBox QnaBbox">
	<div id="qnaOpBox">
		<div onclick="backFunction()">⬅</div>
		<details id="qnaOpDe">
			<summary>...</summary>
				<ul class="selectRMul">
					<li onclick="modifyQnaBtn(event)">수정</li>
					<li onclick="deleteQnaBtn(event)">삭제</li>
				</ul>
		</details>
	</div>
		<div class="smBox">
			<div class="smInner">문의사항</div>
			<div class="smInner selectQInner">${dto.qnaCategory }</div>
		</div>
		<div class="smBox">
			<div class="smInner">제목</div>
			<div class="smInner selectQInner">${dto.title }</div>
		</div>
		<div class="smBox">
			<div class="smInner">작성일</div>
			<div class="smInner selectQInner">${dto.writeDate }</div>
		</div>
		<div class="qnaTextA qnaSelectB">${dto.qna }</div>
		<c:if test="${reply.reply != null }">
		<div id="selectQRBox">
			<div id="selectQRTop">
				<div>${reply.writer }</div>
				<div>${reply.writeDate }</div>
			</div>
			<div id="selectQRBottom">
				${reply.reply }
			</div>
		</div>
		</c:if>
	</div>
</div>

</body>

<script>
	let Nowurl = new URL(window.location.href);
	let param = new URLSearchParams(Nowurl.search);
	let idx = param.get('idx');

	
	async function deleteQnaBtn(){
		const url = cpath + '/manager/deleteQna';
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
			alert('게시글이 삭제되었습니다');
			window.location.href = cpath + "/manager/qnaPage";
		} else {
			alert('삭제에 실패하였습니다');
		}
	};
	
	async function modifyQnaBtn(){
		const BaseUrl = cpath + '/manager/modifyQna';
		const url = BaseUrl + '?idx=' + idx;
		
		const response = await fetch(url);
		if(response.ok){
			window.location.href = url;
		} else {
			console.log(response.status);
			throw new Error('서버 응답에 실패하였습니다.');
		}
	};
	
	function backFunction(){
		window.location.href = cpath + '/manager/qnaPage';
	}
	
</script>

</html>