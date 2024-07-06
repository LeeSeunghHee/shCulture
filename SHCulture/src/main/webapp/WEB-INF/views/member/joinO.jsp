<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>


<div id="joinBox">
	<div id="loginCheckBox">
		<div id="selectCheckTop">
			<input type="checkbox" id="agreeAll">&nbsp;이용약관 전체동의
		</div>
		<div class="selectCheck">
			<input type="checkbox" class="agreeMust">&nbsp;이용약관 동의<span
				class="pilsoo">&nbsp;(필수)</span>
		</div>
		<div class="selectCheck">
			<input type="checkbox" class="agreeMust">&nbsp;개인정보 수집 및 이용
			동의<span class="pilsoo">&nbsp;(필수)</span>
		</div>
		<div class="selectCheck">
			<input type="checkbox" class="agreeMust">&nbsp;개인정보 제3자 제공 동의<span
				class="pilsoo">&nbsp;(필수)</span>
		</div>
		<div class="selectCheck">
			<input type="checkbox" class="agreeMust">&nbsp;개인정보 처리 위탁 동의<span
				class="pilsoo">&nbsp;(필수)</span>
		</div>
		<div class="selectCheck">
			<input type="checkbox" class="agreeEtc">&nbsp;프로모션 정보 수신
			동의&nbsp;(선택)
		</div>
	</div>
	<div id="joinCheckBox">
		<form method="POST" id="joinForm">
			<p class="smp">프로필</p>
			<div class="profile_picBox"><img class="previewProfic" src="${cpath }/resources/image/basicProfile.png" onclick="inputProfile()"></div>
			<input class="inputProfic" name="uploadProfile" type="file" accept="image/*" hidden="true" onchange="profileHandler()">
			<p class="smp">아이디</p>
			<input id="joinID" type="text" name="userId" oninput="checkId()"
				placeholder="아이디를 입력하세요" autocomplete="off" required="required">
			<p class="idNonDup">사용가능한 아이디입니다.</p>
			<p class="idDup">중복되는 아이디가 존재합니다.</p>
			<p class="imp">영문, 숫자 조합 4자 이상</p>

			<p class="smp">비밀번호</p>
			<input id="joinPW" type="password" name="userPw" oninput="checkPw()"
				placeholder="비밀번호를 입력하세요" required="required">
			<P class="omp">영문, 숫자, 특수문자('.'제외) 중 2가지 이상 포함한 8자 이상 </P>

			<p class="smp">닉네임  <span class="nmp">(2자 이상)</span></p>
			<input class="joinETC" type="text" name="nickname" placeholder="닉네임"
				oninput="checkNick()" autocomplete="off" required="required">
			<p class="nickNonDup">사용가능한 닉네임입니다.</p>
			<p class="nickDup">중복되는 닉네임이 존재합니다.</p>

			<p class="smp">이름</p>
			<input class="joinETC" type="text" name="userName" placeholder="이름"
				autocomplete="off" required="required">

			<p class="smp">휴대전화번호&nbsp;(하이픈['-']포함)</p>
			<input class="joinETC" type="text" name="pnum" placeholder="휴대전화번호"
							onchange="checkPnum()" autocomplete="off" required="required">

			<p class="smp">이메일</p>
			<input class="joinETC" type="email" name="email" placeholder="이메일"
				onkeyup="checkEmail()" autocomplete="off" required="required">
			<p class="emt">중복된 이메일입니다.</p>
			<input class="memberT" type="text" value="O" name="memberType" hidden="true">
			<input id="joinBtn" type="submit" value="회원가입">
		</form>
	</div>
</div>


<!-- 
	oninput과 onkeyup의 차이
	#oninput
		- oninput은 입력요소의 내용이 변경될 때 발생
		- 사용자가 키를 누르거나 떼거나 복사 및 붙여넣기 등과 같은 텍스트를 입력 요소에 입력할 때 발생 변경이 발생할 때마다 이벤트 핸들러가 실행
		
	#onkeyup
		- 키보드의 키를 눌렀을 대 뿐만 아니라 떼었을 때에도 발생
		- 사용자가 키를 누르고 떼는 순간을 감지하고 이순강에 이벤트 핸들러를 실행
		- 주로 특정 키를 입력하고 떼는 순간에 반응하고자 할 때 사용
	
	요약: oninput은 입력 요소의 내용이 변경될 때바다 작동하고
		onkeyup은 키를 누르고 떼는 순간에 작동
 -->

<script>

	const checkMust = document.querySelectorAll('.agreeMust');
	const checkEtc = document.querySelector('.agreeEtc');
	const checkAll = document.getElementById('agreeAll');
	const img = document.getElementById('joinProfileImg');
	const imgUpload = document.querySelector('.fileInput');
	
	checkAll.onclick = function() {
		var ischeck = checkAll.checked;
		if (ischeck == true) {
			checkMust.forEach(function(checkbox) {
				checkbox.checked = true;
			});
			checkEtc.checked = true;
		}
	}
	
	function updateJoinButton() {
		const checkedCount = Array.from(checkMust).filter(function(checkbox) {
			return checkbox.checked;
		}).length;
	
		if (checkedCount >= 4) {
			document.getElementById('joinBtn').style.display = "block";
		} else {
			document.getElementById('joinBtn').style.display = "none";
		}
	};
	updateJoinButton();

	
	// 체크박스 상태가 변경될 때마다 업데이트
	checkMust.forEach(function(checkbox) {
		checkbox.addEventListener('change', updateJoinButton);
	});
	checkAll.addEventListener('change', updateJoinButton);

	
	function inputProfile() {
		document.getElementById("uploadProfile").click();
	}

	function profileHandler() {
		var fileInput = document.getElementById('uploadProfile');
		var defaultProfic = document.getElementById('profile')
		
		var profile = fileInput.files[0];
		var reader = new FileReader();
		
		reader.onload = function() {
			defaultProfic.src = reader.result;
		}
		if(profile) {
			reader.readAsDataURL(profile);
		} else {
			defaultProfic.src = "${cpath}/resources/image/basicProfile.png";
		}

	}
	
	// 프로필
	function inputProfile() {
		document.querySelector(".inputProfic").click();
	}

	function profileHandler() {
		var fileInput = document.querySelector(".inputProfic");
		var preview = document.querySelector('.previewProfic')
		
		var profile = fileInput.files[0];
		var reader = new FileReader();
		
		reader.onloadend = function() {
			preview.src = reader.result;
		}
		if(profile) {
			reader.readAsDataURL(profile);
		} else {
			preview.src = "${cpath}/resources/image/basicProfile.png";
		}

	}

	// id 중복체크
	async function checkId() {
		const url = cpath +'/member/checkId'
		var id = document.getElementById('joinID').value;
		var data = {
			id: id
		};
		console.log(data)
		const opt = {
			method: 'POST',
			body: JSON.stringify(data),
			headers: {
				'Content-Type': 'application/json; charset=utf-8'
			}
		}		
		
		var cnt = await fetch(url, opt).then(resp => resp.text());
		const pattern = /[!^@#$%&*.]/g;
		const imp = document.querySelector('.imp');
		if (cnt == 0) {
			if (pattern.test(id) || !/^(?=.*[a-zA-Z])(?=.*\d)/.test(id)) {
				document.querySelector('.idNonDup').style.display = 'none';
				document.querySelector('.idDup').style.display = 'none';
				imp.style.display = "block";
				imp.style.color = "red";
			} else if(/^(?=.*[a-zA-Z])(?=.*\d)/.test(id) && !pattern.test(id)) {
				imp.style.display = 'none';
				document.querySelector('.idNonDup').style.display = 'block';
				document.querySelector('.idDup').style.display = 'none';
			}
		} else {
			imp.style.display = 'none';
			document.querySelector('.idDup').style.display = 'block';
			document.querySelector('.idNonDup').style.display = 'none';

		}
		if(id == '') {
			document.querySelector('.idDup').style.display = 'none';
			document.querySelector('.idNonDup').style.display = 'none';
			imp.style.display = 'block';
			imp.style.color = "#767676";
		}
		
	};


	// 비밀번호 형식 검사
	function checkPw() {
		const pattern = /[!^@#$%&*]/g;
		var Password = document.getElementById('joinPW').value;
		const omp = document.querySelector('.omp')
		var checkCount = 0;
		
		if(Password.length < 8) {
			omp.style.color = "red";
		}
		else if(Password.length >= 8) {
			if (/^(?=.*[a-zA-Z])(?=.*\d)/.test(Password)) {	// 영문 + 숫자
	            checkCount = 1;
	        } else if(/^(?=.*[a-zA-Z])/.test(Password)&& pattern.test(Password)) { // 영문 + 특수문자
	        	checkCount = 1;
	        } else if(/(?=.*\d)/.test(Password) && pattern.test(Password)) {	// 숫자 + 특수문자
	        	checkCount = 1;
	        } else if(/^(?=.*[a-zA-Z])(?=.*\d)/.test(Password) && pattern.test(Password)) { // 영문 + 특수문자 + 숫자
	        	checkCount = 1;
	        }
		}
		if(checkCount == 1) {
			omp.style.color = "#00BE64";
		}
		else if(checkCount == 0) {
			omp.style.color = "red";
	
		}
		if(Password == '') {
			omp.style.color = "#767676"
		}
	};

	// 닉네임 중복체크
	async function checkNick() {
		var nick = document.querySelector('.joinETC[name="nickname"]').value;
		const url = cpath + '/member/checkNickName';
		var data = {
				nickname: nick
		};
		const opt = {
			method: 'POST',
			body: JSON.stringify(data),
			headers: {
				'Content-Type': 'application/json; charset=utf-8'
			}
		};
		
		var cnt = await fetch(url, opt).then(resp => resp.text());
		console.log(cnt)
		if(nick.length >= 2) {
			document.querySelector('.nmp').style.color = "#767676"
			if(cnt == 0) {
				document.querySelector('.nickNonDup').style.display = 'block';
				document.querySelector('.nickDup').style.display = 'none';
			}
			else if (cnt == 1) {
				document.querySelector('.nickNonDup').style.display = 'none';
				document.querySelector('.nickDup').style.display = 'block';
			}
		} else {
			document.querySelector('.nmp').style.color = "red";			
		}
		
		if(nick == '') {
			document.querySelector('.nmp').style.color = "#767676"
			document.querySelector('.nickNonDup').style.display = 'none';
			document.querySelector('.nickDup').style.display = 'none';
		}
	};

	// 이메일 중복 체크
	async function checkEmail() {
		var email = document.querySelector('.joinETC[name="email"]').value;
		const url = cpath + '/member/checkEmail';
		var data = {
			email: email
		};
		const opt = {
			method: 'POST',
			body: JSON.stringify(data),
			headers: {
				'Content-Type': 'application/json; charset=utf-8'
			}
		}
		
		var cnt = await fetch(url, opt).then(resp => resp.text());
		if(cnt == 1) {
			document.querySelector('.emt').style.display = "block";
		}
		if(email == ''){
			document.querySelector('.emt').style.display = "none";
		}
	};
	
	// 전화번호 하이픈 검사
	function checkPnum(){
		const pnum = document.querySelector('.joinETC[name="pnum"]').value;
		
		var HypenCnt = (pnum.match(/-/g) || []).length;
		if(HypenCnt !== 2) {
			document.querySelector('.joinETC[name="pnum"]').value = '';
			alert('하이픈(-)을 붙여주세요.');
		}
	};

	
	// form태그 입력 
	async function joinHandler(event) {
		event.preventDefault();
		const userId = document.getElementById('joinID').value;
		const userPw = document.getElementById('joinPW').value;
		const userName = document.querySelector('.joinETC[name="userName"]').value;
		const nickname = document.querySelector('.joinETC[name="nickname"]').value;
		const pnum = document.querySelector('.joinETC[name="pnum"]').value;
		const email = document.querySelector('.joinETC[name="email"]').value;
		const memberType = document.querySelector('.memberT[name="memberType"]').value;
		
		if(userId=="" || userPw==""|| nickname=="" || pnum=="" || email=="" || userName=="") {
			alert('필수항목을 입력하세요.');
			return;
		}
		
		const url = cpath + '/member/joinO';
		const form = document.getElementById('joinForm');
		const formData = new FormData(form);
		const opt = {
				method: 'POST',
				body: formData,
		}
		const result = await fetch(url, opt)
		  .then(resp => {
		    if (resp.ok) {
		      return resp.text(); 
		    } else {
		      throw new Error('서버 에러: ' + resp.status);
		    }
		  })
		  .then(result => {
		    console.log('성공적인 응답 데이터:', result);
		    if(result == 1) {
				window.location.href = '${cpath}/restaurant/insertRest';
			}
		  })
		  .catch(error => {
		    console.error('에러 발생:', error.message);
		  });

		
	};	
	
	document.getElementById('joinForm').addEventListener('submit', joinHandler);
</script>
</body>
</html>