<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../topMenuBar.jsp"%>

<div class="mainBox">
	
	<div id="mpModifyBox">
		<form id="modifyProfile" method="POST" enctype="multipart/form-data">
		<input type="text" name="userId" value="${login.userId }" hidden="true">
		<div class="modifyPimgBox">
			<c:if test="${not empty login.profileImg }">
				<img class="modifympImg" src="${cpath }/MemberSH/${login.profileImg}">
			</c:if>
		</div>
		<div class="modifyPimgBox">
			<c:if test="${empty login.profileImg }">
				<img class="modifympImg" src="${cpath }/resources/image/basicProfile.png">
			</c:if>
		</div>
		<div id="modifyPimgBtn">
			<div onclick="modifyPImg()">수정</div>
		</div>
		
		<div id="modifyInfoBox">
			<div class="modiEtc">닉네임</div>
			<input type="text" name="nickname" oninput="checkNick()" value="${login.nickname }" required="required" autocomplete="off">
			<div class="modifyNick"></div>
			
			<div class="modiEtc">이메일</div>
			<input type="email" name="email" value="${login.email }" required="required" autocomplete="off">
			<button class="modifyAccessBtn" onclick="verification_codeSend(event)">이메일 수정</button>
			<input type="text" class="modiAccessNum" onblur="verification_codeCheck(event)" hidden="true" placeholder="인증번호입력">
			<span class="modiAresult"></span>
			
			<div class="modiEtc">비밀번호</div>
			<input type="text" name="exisPass" placeholder="기존의 비밀번호 입력" autocomplete="off">
			<button class="rePassBtn" onclick="exitPw(event)">입력</button>
			<input type="text" class="modiUserPw" name="userPw" placeholder="새로운 비밀번호 입력" disabled="disabled" autocomplete="off" onblur="checkPw()"><span></span>
			<div class="modiPwInfo">영문, 숫자, 특수문자('.'제외) 중 2가지 이상 포함한 8자 이상</div>
			
			<div class="modiEtc">전화번호</div>
			<input type="text" name="pnum" value="${login.pnum }" required="required" autocomplete="off">
		</div>
		</form>
		
	</div>
	<div class="deleteMember">
		<div onclick="deleteFunction(event)">회원탈퇴</div>
	</div>
	<div class="modifyPimgBox">
		<button class="modifyMpBtn" onclick="modifySubmit(event)">수정</button>		
	</div>
	
</div>

<script>
let ranNumber  = '';

document.addEventListener('DOMContentLoaded', function () {
	const login = '${login.userId}';
	if(login == '') {
		alert('접속 권한이 없는 페이지입니다.');
		window.location.href = '${cpath}/';
	}
});

function modifyPImg(){
	var inputFile = document.createElement('input');
	inputFile.type= "file";
	inputFile.name ='uploadProfile';
	inputFile.accept = 'image/*';
	inputFile.hidden = 'true';
	inputFile.className = 'modifyPreview';
	inputFile.addEventListener('change', modifyPreview);

	
	var form = document.getElementById('modifyProfile');
	form.appendChild(inputFile);
	inputFile.click();
};

function modifyPreview(event){
	var inputFile = document.querySelector('.modifyPreview');
	var preview = document.querySelector('.modifympImg');
	
	var profile = inputFile.files[0];
	var reader = new FileReader();
	
	reader.onload = function(){
		preview.src = '';
		preview.src = reader.result;
	};
	reader.readAsDataURL(event.target.files[0]);
};

async function checkNick() {
    var nickInput = document.querySelector('[name="nickname"]');
    var alert = document.querySelector('.modifyNick');
    var nick = nickInput.value;
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
    if (nick.length >= 2) {
        alert.innerText = "";
        if (cnt == 0) {
            nickInput.style.border = "1px solid #00BE64";
        } else if (cnt == 1) {
            nickInput.style.border = "1px solid red";
            alert.textContent = "중복되는 닉네임입니다.";
	        alert.style.color = "red";
        }
    } else if(nick.length == 1){
        nickInput.style.border = "1px solid red";
        alert.textContent = "2자 이상 입력해주세요";
        alert.style.color = "red";
    }
};



async function verification_codeSend(event) {
    event.preventDefault();
    const emailInput = document.querySelector("[name='email']");
    emailInput.disabled = true;
    const numberInput = document.querySelector('.modiAccessNum');
    numberInput.removeAttribute('hidden');
    const email = document.querySelector('[name="email"]').value;
    const url = cpath + "/member/accessEmailNum";
    const opt = {
    		method: 'POST',
    		headers: {
    			'Content-Type': 'application/json; charset=utf-8'
    		},
    		body: email,
    };
    
    
    try {
        const result = await fetch(url, opt)
            .then(resp => {
                if (resp.ok) {
                    return resp.text();
                } else {
                    throw new Error('서버 에러: ' + resp.status);
                }
            });

	    ranNumber = result;
    } catch (error) {
        console.error('There has been a problem with your fetch operation:', error);
    }
    
};


function verification_codeCheck(event) {
	event.preventDefault();
	var inputNum = document.querySelector('.modiAccessNum').value;
	var message = document.querySelector('.modiAresult');
	if(inputNum === ranNumber) {
		message.textContent = '본인인증 완료';
		message.style.color = '#00BE64';
		const emailInput = document.querySelector("[name='email']");
		emailInput.disabled = false;
	}
	
	else {
		message.textContent = '인증번호를 확인해주세요';
		message.style.color = 'red';
	}
};

async function exitPw(event) {
	event.preventDefault();
	
	const login = '${login.userId}';
	var rePassword = document.querySelector('[name="userPw"]');
	
	var exPassword = document.querySelector('[name="exisPass"]').value;
	const url = cpath + "/member/checkPassword";
	var data = {
			userPw: exPassword,
			userId: login
	};
	var opt = {
		method: 'POST',
		body: JSON.stringify(data),
		headers: {
			'Content-Type': 'application/json; charset=utf-8'
		}
	};
	
	var result = await fetch(url, opt).then(resp => resp.text());
	console.log(result)
	if(result == 1) {
		rePassword.removeAttribute('disabled');
	} else {
		alert('비밀번호를 확인하세요')
	}
};

function checkPw(){
	var pwBo = document.querySelector('[name="userPw"]');
	var pwInput = pwBo.value;
	var pwInfo = document.querySelector('.modiPwInfo');
	var count = 0;
	if(pwInput.length < 8) {
		pwInfo.style.color = 'red';
	}else if(pwInput.length >= 8) {
		pwInfo.style.color = '#767676';
		if(/^(?=.*[a-zA-Z])(?=.*\d)/.test(pwInput)){
			count = 1;
		}else if(/^(?=.*[a-zA-Z])/.test(pwInput) && pattern.test(pwInput)){
			count = 1;
		}else if(/(?=.*\d)/.test(pwInput) && pattern.test(pwInput)){
			count = 1;
		}else if(/^(?=.*[a-zA-z])(?=.*\d)/.test(pwInput)&&pattern.test(pwInput)){
			count = 1;
		}
	}
	if(count == 1){
		pwBo.style.border = "1px solid #00BE64";
	} else if(count == 0){
		pwInfo.style.color = "red";
		pwBo.style.border = "1px solid red";
	}
	if(pwInput == '') {
		pwInfo.style.color = "#767676";
	}
};


async function modifySubmit(event){
	event.preventDefault();
	
	
	const url = cpath + '/member/modifyP';
	const form = document.getElementById('modifyProfile');
	const formData = new FormData(form);
	const opt = {
			method: 'POST',
			body: formData,
	};
	const result = await fetch(url,opt).then(resp =>{
		if(resp.ok){
			return resp.text();
		} else {
			throw new Error('서버에러: '+ resp.status);
		}
	})
	.then(result => {
		console.log("result: ", result);
		if(result == 1) {
			location.reload();
			alert('수정 완료')
		} else {
			alert('기입 내용을 다시 확인해주세요.');
		}
	}) 
	.catch(error => {
		alert('기입 내용을 확인해주세요.')
	    console.error('에러 발생=>', error.message);
	  });
}

function deleteFunction(e){
	if(window.confirm('정말 탈퇴하시겠습니까?')){
		deleteMember();
	}
}
async function deleteMember(){
	const url = cpath + '/member/deleteMember';
	const userId = '${login.userId}';
	const data = {
			userId: userId
	};
	const opt = {
			method: 'POST',
			body: JSON.stringify(data),
			headers: {
				'Content-Type': 'application/json; charset=utf-8'
			}
	};
	
	const result = await fetch(url,opt).then(resp =>{
		if(resp.ok){
			return resp.text();
		} else {
			throw new Error('서버에러: '+ resp.status);
		}
	})
	.then(result => {
		console.log("result: ", result);
		if(result == 1) {
			alert('기회가 되면 또 만나요!')
			window.location.href = cpath;
		} else {
			alert('잠시 후 다시 시도해주세요');
		}
	}) 
	.catch(error => {
	    console.error('에러 발생=>', error.message);
	  });
}
</script>

</body>
</html>