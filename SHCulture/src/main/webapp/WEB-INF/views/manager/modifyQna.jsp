<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../topMenuBar.jsp"%>


<div class="mainBox">
	<div class="qnaSBox QnaAbox">
		<form id="qnaSubmitForm">
		<input type="text" name="userId" value=${login.userId } hidden="true">
		<input type="number" name="idx" value="${dto.idx }" hidden="true">
		<div class="smBox">
			<div class="smInner">문의사항</div>
			<select name="qnaCategory">
				<option value="가게신고">가게신고</option>
				<option value="댓글">댓글</option>
				<option value="장애/오류">장애/오류</option>
				<option value="기타">기타</option>
			</select>
		</div>
		<div class="smBox">
			<div class="smInner">제목</div>
			<input type="text" name="title" required="required" class="qnaTi" onblur="countTitle()" value="${dto.title }">
		</div>
		<textarea name="qna" required="required" class="qnaTextA qnaSubmitA" placeholder="300자 이하로 작성해주세요." onblur="countQna()">${dto.qna }</textarea>
		</form>
	</div>
	<div id="qnaSubmitBox">
		<div id="qnaSubmit" onclick="qnaSubmit(event)">제출</div>
	</div>
</div>

</body>

<script>
	document.addEventListener('DOMContentLoaded', function(){
		const login = '${login.userId}';
		if(login === ''){
			alert('올바른 접근 경로가 아닙니다');
			window.location.href = cpath;
		}
		
		const category = '${dto.qnaCategory}';
		const options = document.querySelectorAll("option");
		options.forEach(option => {
			if(option.value === category){
				option.selected = true;	
			}
		});
	});
	
	function countTitle(){
		const input = document.querySelector("input[name='title']");
		const title = input.value;
		const titleLength = title.length; 
		
		if(titleLength > 25){
			alert('제목은 25자 이하로 작성해주세요');
			input.value = title.substring(0,25);
		}
	}
	
	function countQna(){
		const input = document.querySelector('textArea');
		const qna = input.value;
		const length = qna.length;
		if(length >300){
			alert('300자 이내로 작성해주세요.')
			input.value = qna.substring(0,300);
		}
	}
	
	async function qnaSubmit(e){
		const url = cpath + '/manager/modifyQna';
		const form = document.getElementById('qnaSubmitForm');
		console.log(form)
		
		const formData = new FormData(form);
		console.log(formData)
		const opt = {
				method: 'POST',
				body: formData,
		};
		const result = await fetch(url, opt).then(resp => resp.text());
		if(result == 1){
			alert('수정되었습니다.')
			location.href = document.referrer;
		} else {
			alert('잠시 후 다시 시도해주세요');
		}
	}
</script>

</html>