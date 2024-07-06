<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>





<div id="logmainBox">
	<div id="loginLogo">
		<a href="${cpath }"><img src="${cpath }/resources/image/logo.png"><span>오늘의맛집</span></a>
	</div>
	<form method="POST" id="loginForm">
		<div class="inputId">
			<input type="text" name="userId" required="required"
				autofocus="autofocus" autocomplete="off" placeholder="아이디">
		</div>
		<div class="inputPw">
			<input type="password" name="userPw" required="required"
				placeholder="비밀번호">
		</div>
		<p>
			<input type="submit" value="로그인">
		</p>
	</form>
	<div id="findBox">
		<ul class="find">
			<li><a href="${cpath }/member/findPassword">비밀번호 찾기</a></li>
			<li><a href="${cpath }/member/findId">아이디 찾기</a></li>
			<li><a href="${cpath }/member/checkMember">회원가입</a></li>
		</ul>
	</div>
</div>

<script>

const inputList = document.querySelectorAll('input');

for(let i = 0; i < inputList.length; i++){
	const target = inputList[i]
	
	target.onfocus = function(){
		target.style.border = '1px solid #F6DFDB';
		inputList[1].style.borderTop = '1px solid #F6DFDB';
		target.style.boxShadow = 'rgba(246, 223, 219, 0.48) 6px 2px 16px 0px, rgba(246, 223, 219, 0.8) -6px -2px 16px 0px';
	}
	
	target.onblur = function(){
		target.style.border = '1px solid #CECECE';
		inputList[1].style.borderTop = '1px solid #CECECE';
		target.style.boxShadow = '';
	}
}

async function loginCheck(event) {
	event.preventDefault()
	const url = cpath+'/member/login'
	const form  = document.getElementById('loginForm')
	const formData = new FormData(form)
	const opt = {
		method: 'POST',
		body: formData,
	}
	
	const result = await fetch(url, opt).then(resp => resp.text())
	
	if(result != 0) {
		window.location.href = cpath;
	}
	else if (result == 0) {
		alert('일치하는 회원 정보가 없습니다.\n입력하신 내용을 다시 확인해주세요.');
		window.location.href = cpath + '/member/login';
	}
	
}

document.getElementById('loginForm').onsubmit = loginCheck
</script>

</body>
</html>