<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../topMenuBar.jsp"%>

<div class="mainBox">
	
	<div id="qnaMangeBox">
		<div class="qmRight">
			<div class="selectOpmq">
				<span class="mqOPs">
					<input type="checkbox" id="qcOp_A" value="전체" name="qnaCategory" onclick="checkOption(this)">
					<label for="qcOp_A" class="qcOp">전체</label>
				</span>
				<span class="mqOPs">
					<input type="checkbox" id="qcOp_B" value="가게신고" name="qnaCategory" onclick="checkOption(this)">
					<label for="qcOp_B" class="qcOp">가게신고</label>
				</span>
				<span class="mqOPs">
					<input type="checkbox" id="qcOp_C" value="댓글" name="qnaCategory" onclick="checkOption(this)">
					<label for="qcOp_C" class="qcOp">댓글</label>
				</span>
				<span class="mqOPs">
					<input type="checkbox" id="qcOp_D" value="장애/오류" name="qnaCategory" onclick="checkOption(this)">
					<label for="qcOp_D" class="qcOp">장애/오류</label>
				</span>
				<span class="mqOPs">
					<input type="checkbox" id="qcOp_F" value="기타" name="qnaCategory" onclick="checkOption(this)">
					<label for="qcOp_F" class="qcOp">기타</label>
				</span>
			</div>	<!-- end of .selectOpmq -->
			<div class="mqSearchBox">
				<input type="search" placeholder="유저 및 제목을 입력해주세요" onkeypress="if(event.keyCode == 13){searchQnaText(event)}">
			</div>
			
			<div class="mqList">
				<table class="mqLTable">
					<thead class="mqThead">
						<tr>
							<th>카테고리</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>답변</th>
						</tr>
					</thead>
					<tbody class="mqTbody">
						<c:forEach var="q" items="${list }">
							<tr onclick="selectQna(event)">
								<td>${q.qnaCategory }</td>
								<td>${q.title }</td>
								<td>${q.userId }</td>
								<td>${q.writeDate }</td>
							<c:if test="${q.rep == 1 }">
								<td class="mqLicheck">✔</td>
							</c:if>
							<c:if test="${q.rep == 0 }">
								<td></td>
							</c:if>
								<td hidden="true" class="qnaIdx">${q.idx }</td>
							</tr>
						</c:forEach>
						
					</tbody>
				</table>
			</div>
			
		</div>	<!-- end of .qmRight -->
		<div class="qmLeft" hidden="true">
			<div id="cancleReBtn" onclick="cancleReply(event)">✖</div>
			<div id="selectQmBox">
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
				<div class="qnaTextA qnaSelectC">${dto.qna }</div>
			</div> <!-- selectQmBox -->
			
			<div id="ReplyBox">
				<c:if test="${reply.reply == null }">
					<div class="replyKey ReEnter" onclick="submitReply(event)">제출</div>
				</c:if>
				<c:if test="${reply.reply  != null}">
					<div class="replyKey  ReUpdate" onclick="updateReply(event)">수정</div>
				</c:if>
				<form id="submitReply">
					<input type="number" name="qna" value="${dto.idx }" hidden="true">
					<textarea name="reply" placeholder="300자 이하로 작성해주세요." onblur="countQna()">${reply.reply}</textarea>
				</form>				
			</div>
		</div> <!-- end of qmLeft -->
	</div>
	
</div>


<script>
	let checkOp  = '';
	let idx = '';
	let search = '';
	const qmLeft = document.querySelector('.qmLeft');
	document.addEventListener('DOMContentLoaded', function(){
		let Nowurl = new URL(window.location.href);
		let param = new URLSearchParams(Nowurl.search);
		checkOp = param.get('checkOp');
		const paramIdx = param.get('idx');
		const checkBoxes = document.getElementsByName("qnaCategory");
		checkBoxes.forEach((cb)=> {
			if(cb.value === checkOp){
				cb.checked = true;
			}
		})
			console.log('idx: ', paramIdx)
		if(paramIdx != ''){
			qmLeft.hidden = false;
		}
	});
	
	function selectQna(e){
		const tr = e.target.closest('tr');
		const td = tr.querySelector('.qnaIdx');
		idx = td.innerText;
		console.log(idx);
		qnaSearch(search, checkOp, idx);
	};
	
	function searchQnaText(e){
		search = e.target.value;
		console.log('search: ', search)
		qnaSearch(search, checkOp, idx);
	};
	
	function checkOption(e){
		search = document.querySelector('input[type="search"]').value;
		const checkBoxes = document.getElementsByName("qnaCategory");
		checkBoxes.forEach((cb)=> {
			cb.checked = false;
		})
		e.checked = true;
		checkOp = e.value;
		qnaSearch(search, checkOp, idx);
	};
	
	function cancleReply(e){
		qmLeft.hidden = true;
		idx = '';
		qnaSearch(search, checkOp, idx);
	};
	
	function countQna(){
		const input = document.querySelector('textArea');
		const qna = input.value;
		const length = qna.length;
		if(length >300){
			alert('300자 이내로 작성해주세요.')
			input.value = qna.substring(0,300);
		}
	};
	
	async function qnaSearch(search, checkOp, idx){
		const baseUrl = cpath + '/manager/manageQna';
		const url = baseUrl + '?checkOp=' + checkOp + '&search=' + search + '&idx=' + idx;
		const response = await fetch(url);
		if(response.ok){
			window.location.href = url;
		} else {
			console.log(response.status);
			throw new Error('서버 응답에 실패하였습니다.');
		}
	};
	
	
	async function submitReply(e){
		const url = cpath + '/manager/submitReply';
		const form = document.getElementById('submitReply');
		const formData = new FormData(form);
		const opt = {
				method: 'POST',
				body: formData,
		};
		
		const result = await fetch(url, opt).then(resp => resp.text());
		if(result == 1){
			window.location.reload();
		} else {
			alert('잠시후 다시 시도해주세요')
		}
	}
	
	async function updateReply(e){
		const url = cpath + '/manager/updateReply';
		const form = document.getElementById('submitReply');
		const formData = new FormData(form);
		const opt = {
				method: 'POST',
				body: formData,
		};
		
		const result = await fetch(url, opt).then(resp => resp.text());
		if(result == 1){
			alert('수정완료')
			window.location.reload();
		} else {
			alert('잠시후 다시 시도해주세요')
		}
	}
</script>
</body>
</html>