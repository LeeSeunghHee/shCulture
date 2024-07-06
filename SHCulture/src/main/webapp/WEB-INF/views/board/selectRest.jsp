<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../topMenuBar.jsp"%>



<div class="mainBox">

	<div id="selectRestAllB">
		<div id="selectRestLeft">
			<div id="selectRFi">
				<div id="selectLTop">
					<div id="selectRestN">${dto.restName }</div>
					<div id="leftReview">
						${dto.international }&ensp;|&ensp;<span>★</span>&nbsp;${dto.ravg}&ensp;(리뷰)
					</div>
				</div>
				<div id="selectLImg">
					<img src="${cpath }/RestSH/${dto.restImg}">
				</div>
				<div id="selectBtn">
					<button id="selectRreser">
						<div class="selectReservPic" onclick="checkLogin(this)">✔</div>
						<div class="selectReservN">예약</div>
					</button>
					<button id="selectPick">
						<div class="selectPickPic" onclick="checkLogin(this)" >❤</div>
						<div class="selectPickN" >저장</div>
					</button>
				</div>
				<div id="selectLBottom">
					<div id="leftBcategory">
						<div class="BCategoryOne" onclick="CategoryFunction(this)">정보</div>
						<div class="BCategoryTwo" onclick="CategoryFunction(this)">메뉴</div>
					</div>
					<div id="leftBInfo">
						<div id="selectLoc">
							<img src="${cpath }/resources/image/locationImg.png">
							<details>
								<summary class="otherLoc">${dto.roadName }&nbsp;${dto.detailL }</summary>
								<ul class="otherUl">
									<li><span>지번</span>${dto.localNum }</li>
									<li><span>우편</span>${dto.postalCode }</li>
								</ul>
							</details>
						</div>
						<div id="selectNum">
							<img src="${cpath }/resources/image/numberImg.png">
							<div>${dto.restNum }</div>
						</div>
						<div id="selectHcomm">
							<div>
								<img src="${cpath }/resources/image/timeImg.png">
								<div class="selectHD">
									<span class="CtOne">${dto.closeDay }&nbsp;</span>•<span class="CtTwo">&nbsp;${dto.restTime }</span>
								</div>
							</div>
							<ul>
								<li>${dto.startTime }~${dto.endTime }&emsp;</li>
								<c:if test="${ not empty dto.breakTiS }">
									<li>
										<div id="selectBT">${dto.breakTiS }&nbsp;~&nbsp;${dto.breakTiE }&emsp;브레이크타임</div>
									</li>
								</c:if>
								<c:if test="${not empty dto.lastOrder }">
									<li>
										<div id="selectLTs">${dto.lastOrder }&emsp;라스트오더</div>
									</li>
								</c:if>
							</ul>
						</div> <!-- end of selectHcomm -->
						<c:if test="${dto.sns ne ','}">
							<div id="selectSns">
								<img src="${cpath }/resources/image/clip.png"><div class="href"><a class="hrefSns" target="_blank"></a></div>
							</div>
						</c:if>
						<c:if test="${not empty dto.convenient }">
							<div id="selectConv">
								<div id="selectConvOne">편의시설 및 서비스</div>
								<div id="selectConvList"></div>
							</div>
						</c:if>
						
						<c:if test="${not empty dto.restInfo }">
							<div id="selectOwner">소개</div>
							<div class="selectOwner Img"><img src="${cpath }/resources/image/Owner.png"></div>
							<div class="selectOwner Content">${dto.restInfo }</div>
						</c:if>
					</div> <!-- end of leftBInfo -->
					<div id="leftBMenu">
						<div>
							<c:forEach var="m" items="${m}">
								<div class="SelectMBox">
								<c:if test="${not empty m.menuImg }">
									<div class="SelectMImg"><img src="${cpath }/MenuSH/${m.menuImg}"></div>
								</c:if>
								<c:if test="${empty m.menuImg }">
									<div class="SelectMImg"><img src="${cpath }/resources/image/defaultMenu.png"></div>
								</c:if>
								<div class="MenuInfoBox">
									<div class="SelectMN">${m. menuName}</div>
									<div class="SelectMI">${m.menuInfo }</div>
									<div class="SelectMP">${m.price }원</div>
								</div>
							</div>
							</c:forEach>
						</div>
					</div>
				</div> <!-- end of selectLBottom -->
			</div>
		</div>
		<div id="selectRestRight">
			<div id="selectRestTop">
				<ul>
					<li id="rankOne" onclick="OptionOne()">최신순</li>
					<li id="rankTwo" onclick="OptionTwo()">추천순</li>
				</ul>
			</div>
			<div id="reviewForOne">
			<c:forEach var="one" items="${rankOne }">
				<div class="reviewFor">
					<div class="reviewList">
						<div class="reviewListT">
							<div class="reviewPrO">
								<c:if test="${not empty one.profileImg }">
									<img src="${cpath }/MemberSH/${one.profileImg}">
								</c:if>
								<c:if test="${empty one.profileImg }">
									<img src="${cpath}/resources/image/basicProfile.png">
								</c:if>
							</div>
							<div class="reviewPrT">
								<div class="reviewNick">${one.nickname }</div>
								<div class="hiddenProStar" hidden="true">${one.star }</div>
								<div class="reviewProStar"></div>
							</div>
						</div>
					</div>
					<div class="reviewImgList" hidden="true">${one.reviewImg }</div>
					<div class="reviewImg">
						<div class="reviewListArrow">
							<span class="reviewAllL" onclick="leftEvent(this)">⬅</span>
							<span class="reviewAllR" onclick="rightEvent(this)">➞</span>
						</div>
						<ul class="selectRestUl">
						</ul>
					</div>
					<div class="reviewCon">${one.review }</div>
					<div class="reviewListB">
						<div class="thanksBtn" onclick="addRecommend(event)" >
							<div class="reviewIdx" hidden="true">${one.idx }</div>
							<div>Ü</div>
							<span>추천해요 &nbsp;${one.recommend }</span>
						</div>
						<div class="revWriteDate">${one.writeDate }</div>
					</div>
				</div>
			</c:forEach>
			</div>
			<div id="reviewForTwo" class="hidden">
			<c:forEach var="two" items="${rankTwo }">
				<div class="reviewFor">
					<div class="reviewList">
						<div class="reviewListT">
							<div class="reviewPrO">
								<c:if test="${not empty two.profileImg }">
									<img src="${cpath }/MemberSH/${two.profileImg}">
								</c:if>
								<c:if test="${empty two.profileImg }">
									<img src="${cpath}/resources/image/basicProfile.png">
								</c:if>
							</div>
							<div class="reviewPrT">
								<div class="reviewNick">${two.nickname }</div>
								<div class="hiddenProStar" hidden="true">${two.star }</div>
								<div class="reviewProStar"></div>
							</div>
						</div>
					</div>
					<div class="reviewImgList" hidden="true">${two.reviewImg }</div>
					<div class="reviewImg">
						<div class="reviewListArrow">
							<span class="reviewAllL" onclick="leftEvent(this)">⬅</span>
							<span class="reviewAllR" onclick="rightEvent(this)">➞</span>
						</div>
						<ul class="selectRestUl">
						</ul>
					</div>
					<div class="reviewCon">${two.review }</div>
					<div class="reviewListB">
						<div class="thanksBtn" onclick="addRecommend(event)" >
							<div class="reviewIdx" hidden="true">${two.idx }</div>
							<div>Ü</div>
							<span>추천해요 &nbsp;${two.recommend }</span>
						</div>
						<div class="revWriteDate">${two.writeDate }</div>
					</div>
				</div>
			</c:forEach>
			</div>
		</div>
	</div>
	<!-- end of selectRestMB -->
	
	<div id="reserInput" class="hidden">
		<form id="reserveINForm">
			<div class="reserTop">예약하기&nbsp;<span>(*)는 필수사항입니다</span></div>
			<input type="number" value="${dto.idx }" name="rest" hidden="true">
			<div class="reserB">
				<div class="reserInfo">예약자</div>
				<input type="text" name="userId" value="${login.userId}" hidden="true">
				<div class="reserName">${login.userName }</div>
			</div>
			<div class="reserB">
				<div class="reserInfo">인원 수
					<span class="reserP">&nbsp;(＊)</span>
					<c:if test="${dto.maxPeople ne 0 }" >
						<div class="reserTip">최대 인원: ${dto.maxPeople }</div>
					</c:if>
				</div>
				<c:if test="${dto.maxPeople eq 0 }">
					<input type="number" name="people" min="1" required="required">
				</c:if>		
				<c:if test="${dto.maxPeople ne 0 }">
					<input type="number" name="people" min="1" required="required" max="${dto.maxPeople }">
				</c:if>
			</div>
			<div class="reserB"><div class="reserInfo">방문 날짜<span class="reserP">&nbsp;(＊)</span></div>
				<input type="date" name="reserDate" required="required" onchange="selectDate(event)">
			</div>
			<div class="reserB" id="timeBox">
				<div class="reserInfo">방문 시간<span class="reserP">&nbsp;(＊)</span></div>
				<c:forEach items="${timer }" var="t">
					<div class="reserveTimeBox" hidden="true">${t.timer }</div>
				</c:forEach>
					<div id="reserTime"></div>
 			</div>
			<div class="reserB">
				<div class="reserInfo">참고사항</div>
				<div id="reserTextArea">
					<textarea placeholder="참고사항이 있다면 작성해주세요" name="etc"></textarea>
					<div>
						<button class="submitReser" onclick="submitReserve(event)">예약</button>
						<button onclick="removeModal(event)">취소</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>

</body>
<script>
//예약하기
	
	document.addEventListener('DOMContentLoaded', function() {
		var pick = "${dto.pick_count}";
		var reser = "${dto.reser_count}";
		console.log(reser);
		if(pick == 1){
			pickColor();
		}
		
		
		var category = document.querySelector('.BCategoryOne');
		category.classList.add('select');

		var current = document.querySelector('.CtOne').textContent;
		var rest = document.querySelector('.CtTwo').textContent;

		if (current.includes("종료")) {
			document.querySelector('.CtOne').style.color = "#FE624C";
		} else if (current.includes("영업중")) {
			document.querySelector('.CtOne').style.color = "#18C63B";
		}
		if (rest.includes("휴무")) {
			document.querySelector('.CtTwo').style.color = "#FE624C";
		} else {
			document.querySelector('.CtTwo').style.color = "black";
		}
		
		var sns = "${dto.sns}"
		var snsBox = document.getElementById('selectSns');
		var modiSns = document.querySelector('.hrefSns');
		if(snsBox){
			modiSns.innerText = sns.substring(1);
			modiSns.href = sns.substring(1);
		}
		
		var convList = "${dto.convenient}";
		var conveListElement = document.getElementById('selectConvOne');
		if (conveListElement) {
			if (convList != null) {
				var newConv = convList.substring(1);
				var arrConv = newConv.split(",");
				
				arrConv.forEach(function(e){
					var div = document.createElement("div");
					div.classList.add('Selctconv');
					div.textContent = e;
					
					document.getElementById("selectConvList").appendChild(div);
				});
			}
		}
		
		let date = new Date();
		let currentYear = date.getFullYear();
		let setMax = new Date(currentYear, 11,31);
		let min = '';
		if(rest.includes("휴무") || current.includes("종료")){
			date.setDate(date.getDate()+1);
			min = date.toISOString().substring(0,10);
		} else {
			min = date.toISOString().substring(0,10);
		}
		let max = setMax.toISOString().substring(0,10);
		
		document.querySelector('input[name="reserDate"]').setAttribute('min',min);
		document.querySelector('input[name="reserDate"]').setAttribute('max',max);
		console.log('min: ', min)
		
		var timeBox = document.querySelectorAll('.reserveTimeBox');
		var inner = document.getElementById('reserTime');
		var combinedTimes = Array.from(timeBox).map(function(timeBox) {
		    return timeBox.innerText.trim();
		}).join(', ');
		
		combinedTimes.split(',').forEach(function(time, index) {
				 const radio = document.createElement('input');
			        radio.setAttribute('type', 'radio');
			        radio.classList.add('reSelectT');
			        radio.name = 'reserTime';
			        radio.id = 'timeOption' + index;
			        radio.value = time.trim();

			        const label = document.createElement('label');
			        label.setAttribute('for', 'timeOption' + index);
			        label.innerText = time.trim();
			        inner.appendChild(radio);
			        inner.appendChild(label);
		})
		
		
		const stars = document.querySelectorAll('.hiddenProStar');
		const innerStar = document.querySelectorAll('.reviewProStar');
		stars.forEach(function(star, index){
			const count = parseInt(star.innerText);
			for(let i = 0; i < 5; i++){
				if(i < count){
					const span = document.createElement('span');
					span.innerText += '★';
					span.style.color = '#FE624C';
					span.classList.add('reviewListStar');
					innerStar[index].appendChild(span);
					 
				}else {
					const span = document.createElement('span');
					span.innerText += '★';
					span.style.color = '#BFBFBF';
					span.classList.add('reviewListStar');
					innerStar[index].appendChild(span);
				}
				
			}
		});
		
		
		let arr = [];
		const reviewList = document.querySelectorAll('.reviewImgList');
		const ul = document.querySelectorAll('.selectRestUl');
		const box = document.querySelectorAll('.reviewListArrow');
		const imgB = document.querySelectorAll('.reviewImg');

		reviewList.forEach(function(review, index){
		    const imgList = review.innerText;

		    if(imgList !== ''){
		        if(imgList.includes(",")){
		            let arr = imgList.split(",");
		            arr = arr.map(item => item.replace(/['"]/g, '').trim());
		            arr.forEach(i => {
		                const li = document.createElement('li');
		                li.classList.add("selectRestLi");
		                const img = document.createElement('img');
		            	img.classList.add('selectRestImg');
		                const src = '${cpath}/ReviewSH/'+i;
		                img.setAttribute('src', src);

		                box[index].style.visibility = 'visible';
		                li.appendChild(img);
		                ul[index].appendChild(li);
		            });
		        } else {
		            const li = document.createElement('li');
		            li.classList.add("selectRestLi");
		            const img = document.createElement('img');
		            img.classList.add('selectRestImg');
		            const src = '${cpath}/ReviewSH/' + imgList; 
		            img.setAttribute('src', src);
		            
		            box[index].style.visibility = 'hidden';
		            li.appendChild(img);
		            ul[index].appendChild(li);
		        }
		    } else {
		        imgB[index].style.visibility = 'hidden';
		        box[index].style.visibility = 'hidden';
		    }
		});
		
	});
	
	function OptionOne(e){
		const one = document.getElementById('reviewForOne');
		const two = document.getElementById('reviewForTwo');
		const rankOne = document.getElementById("rankOne");
		const rankTwo = document.getElementById("rankTwo");
		
		one.classList.remove('hidden');
		two.classList.add('hidden');
		rankOne.style.color = '#222225';
		rankTwo.style.color = '#939396';
	}
	
	function OptionTwo(e){
		const one = document.getElementById('reviewForOne');
		const two = document.getElementById('reviewForTwo');
		const rankOne = document.getElementById("rankOne");
		const rankTwo = document.getElementById("rankTwo");
		
		one.classList.add('hidden');
		two.classList.remove('hidden');
		rankOne.style.color = '#939396';
		rankTwo.style.color = '#222225';
	}
	
	function leftEvent(element) {
	    const ul = element.parentNode.nextElementSibling; // 현재 요소의 다음 형제 요소인 ul
	    slide(ul, -1); // 왼쪽으로 슬라이드
	}

	function rightEvent(element) {
	    const ul = element.parentNode.nextElementSibling; // 현재 요소의 다음 형제 요소인 ul
	    slide(ul, 1); // 오른쪽으로 슬라이드
	}

	function slide(ul, direction) {
	    const liWidth = ul.querySelector('li').offsetWidth; // 첫 번째 li 요소의 너비
	    const scrollAmount = liWidth * direction;
	    ul.scrollBy({ left: scrollAmount, behavior: 'smooth' }); // 스크롤 이동
	}

	
	// 카테고리 
	function CategoryFunction(e){
		var selectName = e.className;
		
		var one = document.querySelector('.BCategoryOne');
		var two = document.querySelector('.BCategoryTwo');
		
		var info = document.getElementById('leftBInfo');
		var menu = document.getElementById('leftBMenu');
		
		if(selectName === 'BCategoryOne'){
			one.classList.add('select');
			two.classList.remove('select');
			menu.style.display = "none";
			info.style.display = "block";
			
		} else if (selectName === "BCategoryTwo"){
			two.classList.add('select');
			one.classList.remove('select');
			info.style.display = "none";
			menu.style.display = "block";
		}
	};
	
	// login 확인
	function checkLogin(e){
		var login = "${login.userId}";
		var reserBox = document.getElementById('reserInput');
		var left = document.getElementById('selectLBottom');
		var mainBox = document.querySelector(".mainBox");
		var check = event.target.className;
		var reserCount = "${dto.reser_count}";
		console.log(reserCount);
		if(login === ''){
			alert('로그인 후 이용가능합니다.')
			location.href = cpath + '/member/login';
		} else if(login != ''){
			if(check === "selectReservPic"){
				left.style.display = 'none';
				mainBox.style.backgroundColor = 'rgba(0,0,0,0.4)';
				reserBox.classList.remove('hidden'); 
			} else if(check === "selectPickPic"){
				insertPick();
			}
		}
	};

	
	
	// modal창 제거
	function removeModal(event){
		var reserBox = document.getElementById('reserInput');
		var left = document.getElementById('selectLBottom');
		var mainBox = document.querySelector(".mainBox");
		
		reserBox.classList.add('hidden');
		left.style.display = 'block';
		mainBox.style.backgroundColor = 'white';
	}
	
	// 찜 추가하기
	async function insertPick(){
		const url = cpath + '/member/insertPick';
		const id = "${login.userId}";
		const rest = "${dto.idx}";
		var data = {
				userId: id,
				rest: rest
		};
		const opt = {
				method: 'POST',
				body: JSON.stringify(data),
				headers: {
					'Content-Type': 'application/json; charset=utf-8'
				}
		};
		console.log(data);
		
		const result = await fetch(url, opt).then(resp => resp.text());
		
		if(result == 1){
			pickColor();	
		} else if(result == 2){
			colorNoneCheck();
		}
	};
	
	// 예약, 찜 표시
	function pickColor(){
		var PickPic = document.querySelector('.selectPickPic');
		var PickN = document.querySelector('.selectPickN');
		
		PickPic.style.color = '#DFA89E';
		PickN.style.color = '#DEA89E';
	};
	
	
	
	// 예약, 찜 표시
	function colorNoneCheck(){
		var PickPic = document.querySelector('.selectPickPic');
		var PickN = document.querySelector('.selectPickN');
		
		PickPic.style.color = '#9B9B9B';
		PickN.style.color = '#9B9B9B';
	};
	
	// 보류
	function selectDate(e) {
	    const dateInput = document.querySelector('input[name="reserDate"]');
	    const selectDate = new Date(dateInput.value);
	    console.log('selectDate: ', selectDate);

	    const radios = document.querySelectorAll('.reSelectT');
	    const now = new Date();

	    if (selectDate.getTime() === now.getTime()) {
	        radios.forEach(function(radio) {
	            const timeValue = new Date(radio.value);
	            if (timeValue < now) {
	                radio.disabled = true;
	            }
	        });
	    }
	};

	async function addRecommend(e){
		const url = cpath + '/board/addRecommend';
		const idxElement = e.target.closest('.reviewListB').querySelector('.reviewIdx');
		var idx = null;
		if(idxElement){
			idx = parseInt(idxElement.innerText);
		}
		const data = {
				idx: idx
		};
		const opt = {
				method: 'POST',
				body: JSON.stringify(data),
				headers: {
					'Content-Type': 'application/json; charset=utf-8'
				}
		};
		
		const result = await fetch(url, opt).then(resp => resp.text());
		if(result == 1){
			location.reload();
		}
		console.log(result);
	};
	
	async function submitReserve(event) {
	    event.preventDefault();
		var idx = document.querySelector('input[name="rest"]').value;
	    
	    const url = cpath + '/member/submitReserve';
	    const form = document.getElementById('reserveINForm');
	    const formData = new FormData(form);
	    const opt = {
	        method: 'POST',
	        body: formData,
	    };
	    var time = document.querySelector("input[name='reserTime']");
	    var tt = time.value;

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
	            if (result == 1) {
	                alert("예약을 완료했습니다.");
	                location.href = cpath + '/board/selectRest/'+idx;
	            } else if (result == 2) {
	                alert('이미 예약 되어있습니다.');
	            }
	        })
	        .catch(error => {
	            alert('기입 내용을 확인해주세요.');
	            console.error('에러 발생=>', error.message);
	        });
		}
	
</script>
</html>