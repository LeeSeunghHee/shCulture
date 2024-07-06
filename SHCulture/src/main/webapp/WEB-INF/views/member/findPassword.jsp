<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../topMenuBar.jsp"%>


<div class="mainBox">
	<div id="findMemberBox">
		<div class="findTop">비밀번호를 찾으시나요?</div>
		
		<div id="fMrFirstBox">
			<div class="findSpan">아이디</div>
			<div class="findInput"><input type="text" name="userId" autocomplete="off"></div>
			
			<div class="findSpan">이메일</div>
			<div class="findInput"><input type="email" name="email" autocomplete="off"></div>
			<div id="fMrBtnBox"><button onclick="nextBox()">➜</button></div>
		</div>
		
		<div id="fMrSecondBox">
			<div class="findSpan">새로운 비밀번호</div>
			<div class="findInput"><input type="text" name="userPw" autocomplete="off" onblur="checkPw(event)"></div>
			<div class="modiPwInfo">영문, 숫자, 특수문자('.'제외) 중 2가지 이상 포함 8자 이상</div>
			
			<div class="findSpan">새로운 비밀번호 재입력</div>
			<div class="findInput"><input type="text" name="checkPw" autocomplete="off"  disabled="disabled"></div>
			
			<div id="fMrSBtn"><button id="updatePBtn" onclick="checkPassword()">변경</button></div>
		</div>
		
	</div>
</div>
<script>
	function nextBox(){
			const email = document.querySelector('input[name="email"]').value;
			const userId = document.querySelector('input[name="userId"]').value;
							
			if(email != '' && userId != ''){
				findPassword(email,userId);
			} else {
				alert('정보를 입력해주세요');
			}
		}
	
	async function findPassword(email, userId){
		const url = cpath + '/member/findPassword';
		const data = {
				userId: userId,
				email: email
		}
		const opt = {
				method: 'POST',
				body: JSON.stringify(data),
				headers: {
					'Content-Type': 'application/json; charset=utf-8'
				}
		}
		const leftBox = document.getElementById('fMrFirstBox');
		const rightBox = document.getElementById('fMrSecondBox');
		const result = await fetch(url, opt)
		  .then(resp => {
		    if (resp.ok) {
		    	return resp.text();
		    } else {
		    	alert('가입된 정보가 없습니다.')
		    }
		  })
		  .then(result => {
			    console.log('성공적인 응답 데이터:', result);
			    if(result != 0) {
			    	 leftBox.style.left = '-70%'; 
			    	 rightBox.style.right = '28%'; 
			}else {
	            alert('가입된 정보가 없습니다.');
	        }
	    })
	    .catch(error => {
	        console.error('에러 발생:', error);
	    });
	}
	
	function checkPw(e) {
		var pw = e.target.value;
		console.log(pw);
		var pwInfo = document.querySelector('.modiPwInfo');
		const checkPw = document.querySelector('input[name="checkPw"]');
		var count = 0;
		if(pw.length < 8){
			pwInfo.style.color = 'red';
		} else if (pw.length >=8){
			pwInfo.style.color = '#767676';
			if(/^(?=.*[a-zA-Z])(?=.*\d)/.test(pw)){
				count = 1;
			}else if(/^(?=.*[a-zA-Z])/.test(pw) && pattern.test(pw)){
				count = 1;
			}else if(/(?=.*\d)/.test(pw) && pattern.test(pw)){
				count = 1;
			}else if(/^(?=.*[a-zA-z])(?=.*\d)/.test(pw)&&pattern.test(pw)){
				count = 1;
			}
		}
		if(count == 1){
			pwInfo.style.color = "#00BE64";
			checkPw.disabled = false;
		}else if(count == 0){
			pwInfo.style.color = "red";
			checkPw.disabled = true;
		}if(pw == '') {
			pwInfo.style.color = "#767676";
			checkPw.disabled = true;
		}

	}
	
	function checkPassword(){
		const userPw = document.querySelector('input[name="userPw"]').value;
		const checkPw = document.querySelector('input[name="checkPw"]').value;
		
		if(userPw == '' || checkPw == '' ){
			alert("비밀번호를 입력해주세요");
		}else if(userPw != checkPw) {
			alert('비밀번호가 일치하지 않습니다')
		}else if(userPw != '' && checkPw != '' && userPw == checkPw){
			updatePw(userPw);
		}
	}
	
	async function updatePw(userPw){
		const email = document.querySelector('input[name="email"]').value;
		const userId = document.querySelector('input[name="userId"]').value;
		
		const url = cpath + '/member/reSetPw';
		const data = {
				email: email,
				userId: userId,
				userPw: userPw,
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
			alert('성공적으로 변경되었습니다.')
			window.location.href = cpath + '/member/login';
		} else {
			alert('기입된 내용을 다시한 번 확인해주세요')
		}
	}
	
</script>

</body>
</html>