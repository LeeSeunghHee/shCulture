<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>


<div id="pilsu">(*)필수 입력</div>
<div id="insertBox">
	<form method="POST" enctype="multipart/form-data" id="InsertRest">
		<input type="text" name="userId" value="${login.userId }" hidden="true">
		<input type="number" name="idx" value="${dto.idx }" hidden="true">
		<div class="restD">업체명<span class="pilsu">(*)</span></div> 
		<div id="previewImgBox"></div>
		<div class="detailR">
			<input type="text" name="restName" placeholder="업체명" required="required" autocomplete="none" value="${dto.restName }">
		</div> 
		<div class="imgSpan">
			<span class="restImg">매장 이미지 등록&ensp;</span>
			<span class="modifyImgBtn" onclick="modifyImg()">수정</span>
		</div>
		<div class="restD">종류<span class="pilsu">(*)</span></div>
		<div class="detailR">
			<select name="international">
				<option value="한식">한식</option>
				<option value="중식">중식</option>
				<option value="양식">양식</option>
				<option value="일식">일식</option>
				<option value="이탈리아음식">이탈리아음식</option>
				<option value="프랑스음식">프랑스음식</option>
				<option value="태국음식">태국음식</option>
				<option value="베트남음식">베트남음식</option>
				<option value="인도음식">인도음식</option>
				<option value="멕시코/남미음식">멕시코/남미음식</option>
				<option value="카페">카페</option>
			</select>
		</div>
		<div class="restD">매장번호<span class="pilsu">(*)</span></div><span class="hyphen">(하이픈['-']포함)</span>
		<div class="detailR"><input type="text" class="restNum" name="restNum" onchange="checkHyphen()" 
			placeholder="매장번호" required="required" autocomplete="none" value="${dto.restNum }"></div> 
		<div class="restD">운영시간<span class="pilsu">(*)</span></div>
			<div class="infoHour">(24시일 경우 둘 다 오전으로 등록)</div>
			<span class="detailR"><input type="time" name="startTime" class="startT" value="${dto.startTime }"></span> 
			<span class="wave">~&nbsp;</span> 
			<span class="detailR"><input type="time" name="endTime" class="startT" value="${dto.endTime }"></span> 
		<details id="sumLastInput">
			<summary>⏰브레이크타임/라스트오더</summary>
			<ul>
				<li>
					<div class="restTi">브레이크타임</div>
					<span class="detailR"><input type="time" name="breakTiS" class="detailTi" value="${dto.breakTiS }"></span>
					<span class="wave">~&nbsp;</span>
					<span class="detailR"><input type="time" name="breakTiE" class="detailTi" value="${dto.breakTiE }"></span>
				</li>
				<li>
					<div class="restTi">라스트오더</div>
					<span class="detailR"><input type="time" name="lastOrder" class="detailTi" value="${dto.lastOrder }"></span>
				</li>
			</ul>
		</details>
		<div class="restD">최대 수용 인원</div>
		<div class="detailR"><input type="number" name="maxPeople" min="1" value="${dto.maxPeople }"></div>
		<div class="restD">휴무일<span class="pilsu">(*)</span></div>
		<div class="detailR">
			<select name="restWeek" id="restWeek" onchange="checkRestWHandler()">
				<option value="everyWeek">매주</option>
				<option value="1">첫째주</option>
				<option value="2">둘째주</option>
				<option value="3">셋째주</option>
				<option value="4">넷째주</option>
				<option value="1,3">첫째,셋째주</option>
				<option value="2,4">둘째,넷째주</option>
				<option value="everyDay">연중무휴</option>
			</select> 
			<select name="restDay" id="restDay">
				<option value="MONDAY">월요일</option>
				<option value="TUESDAY">화요일</option>
				<option value="WEDNESDAY">수요일</option>
				<option value="THURSDAY">목요일</option>
				<option value="FRIDAY">금요일</option>
				<option value="SATURDAY">토요일</option>
				<option value="SUNDAY">일요일</option>
			</select> 
		</div>
			<div class="restD">매장 소개</div>
			<div class="detailR">
				<textarea name="restInfo" placeholder="매장 소개를 적어주세요" >${dto.restInfo }</textarea>
			</div>			
			<div class="restD">주소<span class="pilsu">(*)</span></div>
			<div class="detailQ">
				<input type="text" id="postalcode" name="postalCode" placeholder="우편번호" value="${dto.postalCode }"> 
				<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="roadAddr"  name="roadName" placeholder="도로명주소" autocomplete="none" required="required" value="${dto.roadName }">
				<input type="text" id="localAddr" name="localNum" placeholder="지번주소" autocomplete="none" required="required" value="${dto.localNum }">
				<input type="text" id="detailAddr" name="detailL" placeholder="상세주소" autocomplete="none" value="${dto.detailL }">
				<input type="text" name="gun" hidden="true" value="${dto.gun }"> 
			</div>
		<div class="restD">편의시설</div>
		<div class="detailR">
			<div id="convenientes">
				<div class="conv" onclick="checkCon(this)">남/녀 화장실 구분</div>
				<div class="conv" onclick="checkCon(this)">포장</div>
				<div class="conv" onclick="checkCon(this)">배달</div>
				<div class="conv" onclick="checkCon(this)">주차</div>
				<div class="conv" onclick="checkCon(this)">무선 인터넷</div>
				<div class="conv" onclick="checkCon(this)">단체 이용 가능</div>
				<div class="conv" onclick="checkCon(this)">유아의자</div>
				<div class="conv" onclick="checkCon(this)">예약</div>
				<div class="conv" onclick="checkCon(this)">반려동물 동반</div>
				<div class="conv" onclick="checkCon(this)">대기공간</div>
				<div class="conv" onclick="checkCon(this)">출입구 휠체어 이용가능</div>
				<div class="conv" onclick="checkCon(this)">장애인 주차구역</div>
				<div class="conv" onclick="checkCon(this)">콜키지 가능</div>
			</div>
		</div>
		<input type="text" name="convenient" hidden="true">
		<input type="text" name="sns" hidden="true">
	</form>
	<div class="restD">SNS</div>
		<div id="AddSNS">
			<div class="inputSnsBox"><img class="pageIcon"><input oninput="pageIconAdd(event)" class="snses" type="text"><button onclick="addSNS()">+</button></div>
		</div>
	<div id="NextBtn"><button id="BtnInsertR" onclick="InsertRHandler(event)">수정</button></div>
</div>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	var conve = '';
	var gun = '';
	var dtoImg = '${dto.restImg}';
	var dtoInter = '${dto.international}';
	var dtoRestW = '${dto.restWeek}';
	var dtoRestD = '${dto.restDay}';
	
	var dtoCon = '${dto.convenient}';
	var arrCon = dtoCon.split(',').slice(1);
	
	var dtoSns = '${dto.sns}';
	var arrSns = dtoSns.split(",").slice(1);
	console.log(arrSns)
	
	document.addEventListener('DOMContentLoaded', function () {
		var timepickerInputs = document.querySelectorAll('.startT');

    timepickerInputs.forEach(function (input) {
        var timepicker = new TimePicker(input, {
            timeFormat: 'HH:mm',
            interval: 30,
            startTime: '00:00',
            dynamic: false,
            dropdown: true,
            scrollbar: true
        });

        // input에 대한 이벤트 핸들러 추가
        input.addEventListener('click', function () {
            timepicker.open();
        });
    });
});
	
	
	window.addEventListener('load', function(){
 		var userId = document.querySelector('input[name="userId"]').value;
 		
 		if(userId == "") {
 			alert('잘못된 유입 경로입니다.');
 			window.location.href = '${cpath}';
 		}
 		else {
 			console.log("userId: " + userId);

 		 	if(dtoImg != null){
 		 		var srcRest = '${cpath}/RestSH/${dto.restImg}';
 		 		var img = document.createElement('img');
 		   		img.className = 'mainImg';
 				img.setAttribute('src', srcRest);
 				document.getElementById('previewImgBox').appendChild(img);
 				
 			}
 		 	if (dtoInter != null) {
 		 	    var select = document.querySelector('select[name="international"]');
 		 	    
 		 	    var options = select.options;
 		 	    for (var i = 0; i < options.length; i++) {
 		 	        if (options[i].value === dtoInter) {
 		 	            options[i].selected = 'selected';
 		 	        }
 		 	    }
 		 	}
 		 	if(dtoRestW != null){
 		 		var select = document.querySelector('select[name="restWeek"]');
 		 		var options = select.options;
 		 		for(var i = 0; i < options.length; i++){
 		 			if(options[i].value === dtoRestW){
 		 				options[i].selected = 'selected';
 		 			}
 		 		}
 				if(dtoRestW === "everyDay"){
 					checkRestWHandler();
 				}
 		 	}
	
 		 	if(dtoRestD != null){
 		 		var select = document.querySelector('select[name="restDay"]');
 		 		var options = select.options;
 		 		console.log(dtoRestD)
 		 		for(var i = 0; i < options.length; i++){
 		 			if(options[i].value === dtoRestD){
 		 				options[i].selected = 'selected';
 		 			}
 		 		}
 		 	}
 		 	
 		 	if(dtoCon != null){
 		 		var conves = document.querySelectorAll('.conv');
 		 		conves.forEach(function(e){
 		 			var convText = e.textContent.trim();
 		 			
 		 			if(arrCon.includes(convText)){
 		 				checkCon(e);
 		 			}
 		 		})
 		 	
	 		}
 		 	
 		 	if (dtoSns != null) {
 		 	    arrSns.forEach(function (value, index) {
 		 	        var snsInputs = document.querySelectorAll('.snses');

 		 	        snsInputs.forEach(function (input, inputIndex) {
 		 	            input.value = arrSns[inputIndex];
 		 	        });

 		 	        if (arrSns.length >= 2) {
 		 	            addSNS(value);
 		 	            snsInputs[index].value = value;
 		 	        }

 		 	        pageIconAdd({ target: snsInputs[index] });
 		 	    });
 		 	}

 		}
 	})
	
 	function modifyImg(){
		var inputImg = document.createElement('input');
		inputImg.type= "file";
		inputImg.name = 'uploadRest';
		inputImg.accept = 'image/*';
		inputImg.addEventListener('change', previewImg);
		
		document.querySelector('.imgSpan').appendChild(inputImg);
		inputImg.click();
	}
 	
	// 매장 이미지 프리뷰
	function previewImg(event) {
		var reader = new FileReader();
		
		reader.onload = function(event) {
			// 기존 이미지 모두 제거하기
	        var previewImgBox = document.getElementById('previewImgBox');
	        previewImgBox.innerHTML = '';
			
	        // 새로운 preview 추가
	        var img = document.createElement('img');
       		img.className = 'mainImg';
			img.setAttribute('src', event.target.result);
			document.getElementById('previewImgBox').appendChild(img);
		};	
		
		document.querySelector('.modifyImgBtn').remove();
		reader.readAsDataURL(event.target.files[0]);	 
	}
	
	// 하이픈 검사
	function checkHyphen(){
		var number = document.querySelector('.restNum').value;
		
		var HypenCnt = (number.match(/-/g)).length;
		if(HypenCnt !== 2) {
			document.querySelector('.restNum').value = '';
			alert('하이픈(-)을 붙여주세요.');
		}
	};
	
	
	// 편의시설 정리
	function checkCon(element) {
		
		var conv = element.innerText;
		
		element.classList.toggle('clicked');
		
		if(element.classList.contains('clicked')) {
			conve += ','+conv;
		} else {
			conve = conve.replace(',' + conv,'');
		}
		document.querySelector('input[name="convenient"]').value = conve;
		console.log('input: ' + document.querySelector('input[name="convenient"]').value);
	};
	
	
	// sns 이미지 매칭
	function pageIconAdd(event) {
	    var instagram = /instagram/;
	    var facebook = /facebook/;
	    var youtube = /youtube/;
	
	    var inputElement = event.target;
	    var pageName = inputElement.value;
	    
	    // 해당 .snses 요소에 대응되는 .pageIcon을 찾음
	    var imgElement = inputElement.closest('.inputSnsBox').querySelector('.pageIcon');
	    
	    // pageName에 "https://www."이 포함되어 있는지 확인
	    if (pageName.includes("https://")) {
	        pageName = pageName.replace(/https:\/\/./g, '');
	        
	        if (instagram.test(pageName)) {
	            imgElement.src = 'https://cdn-icons-png.flaticon.com/512/2111/2111463.png';
	            imgElement.style.opacity = 1;
	        } else if (facebook.test(pageName)) {
	            imgElement.src = 'https://cdn-icons-png.flaticon.com/512/3536/3536394.png';
	            imgElement.style.opacity = 1;
	        } else if (youtube.test(pageName)) {
	            imgElement.src = 'https://cdn-icons-png.flaticon.com/512/3128/3128307.png';
	            imgElement.style.opacity = 1;
	        } else {
	            imgElement.src = 'https://cdn.icon-icons.com/icons2/1456/PNG/512/mbrihome_99524.png';
	            imgElement.style.opacity = 1;
	        }
	    } else {
	        // "https://www."이 포함되어 있지 않으면 이미지를 숨김
	        imgElement.style.opacity = 0;
	    }
	    updateSNSList(event);
	}
	
	// sns 입력창 제거 
	function removeSNS(button) {
   	 	var snsBox = button.closest('.inputSnsBox');
    	snsBox.parentNode.removeChild(snsBox);
    	
    	 updateSNSList();
	}
	
	// sns 입력창 추가 
	function addSNS(value) {
        var addBox = document.getElementById('AddSNS');

        var snsDiv = document.createElement('div');
        snsDiv.className = 'inputSnsBox';

        var newimg = document.createElement('img');
        newimg.className = 'pageIcon';

        var newInput = document.createElement('input');
        newInput.className = 'snses';
        newInput.type = 'text';
        newInput.value = value; // 입력 필드에 값을 설정
        newInput.addEventListener('input', pageIconAdd);

        var newAddButton = document.createElement('button');
        newAddButton.textContent = '+';
        newAddButton.addEventListener('click', function () {
            addSNS(); // 원하는 동작을 여기에 추가할 수 있습니다.
        });

        var newRemoveButton = document.createElement('button');
        newRemoveButton.textContent = '-';
        newRemoveButton.addEventListener('click', function () {
            removeSNS(this);
        });

        snsDiv.appendChild(newimg);
        snsDiv.appendChild(newInput);
        snsDiv.appendChild(newAddButton);
        snsDiv.appendChild(newRemoveButton);

        addBox.appendChild(snsDiv);
    }

	// 페이지 로드 후 초기화
	document.addEventListener('DOMContentLoaded', function () {
	    // 초기화 시 모든 .snses 요소에 대해 pageIconAdd 함수 호출
	    document.querySelectorAll('.snses').forEach(function (inputElement) {
	        pageIconAdd({ target: inputElement }); // 초기화 시에는 이벤트 객체를 모방해서 전달
	    });
	});

	
	function updateSNSList() {
		var snsList = '';
	    var snsL = document.querySelectorAll(".snses");
		snsL.forEach(function(element) {
			snsList += ',' + element.value;
		});
		document.querySelector('input[name="sns"]').value = snsList;
		console.log('snsInput: ' + document.querySelector('input[name="sns"]').value );
	}
	
	
	
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('postalcode').value = data.zonecode;
						document.getElementById("roadAddr").value = roadAddr;
						document.getElementById("localAddr").value = data.jibunAddress;
						gun = roadAddr.substr(3, 3);
						
						document.querySelector('input[name="gun"]').value = gun;
					}
				}).open();
	}

	
	// 휴무일 괸리 Handler
	function checkRestWHandler(event){
		var restWeek = document.getElementById('restWeek');
		var checkWeek = restWeek.options[restWeek.selectedIndex].value;
		var selectDay = document.getElementById('restDay');
		 selectDay.innerHTML = '';
		
		if(checkWeek == 'everyDay') {
			var newOp = document.createElement("option");
			newOp.value = "all";
			newOp.text = "all";
			selectDay.add(newOp);
			selectDay.style.display = "none";
		} else {
			var days = ["MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY", "FRIDAY", "SATURDAY", "SUNDAY"];
			var kdays = ["월요일", "화요일", "수요일","목요일","금요일","토요일","일요일"];
		    for (var i = 0; i < days.length; i++) {
		      var dayOption = document.createElement("option");
		      dayOption.value = days[i];
		      dayOption.text = kdays[i];
		      selectDay.add(dayOption);
		    }
			selectDay.style.display = 'inline';
		}
		console.log(checkWeek);
	}
	
	// snsList 정리 및 편의시설 정리 그리고 submit
 	async function InsertRHandler(event) {
		event.preventDefault();
		
		const url = cpath + '/restaurant/modifyRest';
		const form = document.getElementById('InsertRest');
		const formData = new FormData(form);
		
		const opt = {
				method: 'POST',
				body:  formData,
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
		    	 window.location.href = '${cpath}/restaurant/modifyReserve/${dto.idx}'; 
			} else if (result == 0) {
				alert('기입 내용을 다시 확인해주세요')
			}
		  })
		  .catch(error => {
			alert('기입 내용을 확인해주세요.')
		    console.error('에러 발생=>', error.message);
		  });
		
	} 
	
 	
</script>


<script>
</script>

</body>
</html>