<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../topMenuBar.jsp"%>


<div class="mainBox">
	<div id="findMemberBox">
		<div class="findTop">아이디를 찾으시나요?</div>
		
		<div id="fMrFirstBox">
			<div class="findSpan">이름</div>
			<div class="findInput"><input type="text" name="userName" autocomplete="off"></div>
			
			<div class="findSpan">이메일</div>
			<div class="findInput"><input type="email" name="email" autocomplete="off"></div>
			<div id="fMrBtnBox"><button onclick="nextBox()">➜</button></div>
		</div>
		
		<div id="fMrSecondBox">
			<div class="findBottom">귀하의 아이디는</div>
			<div class="findUId"></div>
			<div class="gotoLogin" onclick="gotoLogin()">로그인하러 가기</div>
		</div>
	</div>
</div>

</body>



<script>
	function nextBox(){
		const email = document.querySelector('input[name="email"]').value;
		const userName = document.querySelector('input[name="userName"]').value;
		
		if(email != '' && userName != ''){
			findId(email,userName);
		} else {
			alert('정보를 입력해주세요');
		}
	}
	
	async function findId(email, userName){
		const url = cpath + '/member/findId';
		const data = {
				userName: userName,
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
		const div = document.querySelector(".findUId");
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
			    if(result != '') {
			    	div.innerText = result;
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
	
	function gotoLogin(){
		window.location.href = cpath + '/member/login';
	}
</script>


</html>