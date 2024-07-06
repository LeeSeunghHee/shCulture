<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../topMenuBar.jsp"%>


<div class="mainBox">
	<div id="mgReviewBox">
		<div id="mgReviewBoxLeft">
			<div id="mypageArrow" onclick="goTo_mypage(event)">←</div>
			<c:forEach var="rest" items="${rest }">
				<div class="mgReserL" onclick="selectReser(event)">
					<div class="mgReserIdx" hidden="true">${rest.idx }</div>
					<div class="mgReserImg"><img src="${cpath }/RestSH/${rest.restImg}"></div>
					<div class="mgReserCon">
						<div class="mgReserName">${rest.restName }</div>
						<div class="mgReserEtc"><span>★</span>&nbsp;${rest.ravg } | ${rest.international }</div>
					</div>
				</div>
			</c:forEach>
		</div>	<!-- end of mgReserBoxLeft -->
		
		<div id="mgReviewRight">
			<div id="mgReviewTop">
				<ul>
					<li id="rankOne" onclick="OptionOne()">최신순</li>
					<li id="rankTwo" onclick="OptionTwo()">추천순</li>
				</ul>
			</div>
			<div id="reviewForOne">
			<c:forEach var="one" items="${rankOne }">
				<div class="reviewFor">
					<div class="mgReviewList">
						<div class="mgReviewListT">
							<div class="reviewPrO">
								<c:if test="${not empty one.profileImg }">
									<img src="${cpath }/MemberSH/${one.profileImg}">
								</c:if>
								<c:if test="${empty one.profileImg }">
									<img src="${cpath}/resources/image/basicProfile.png">
								</c:if>
							</div>
							<div class="reviewPrT">
								<div class="hiddenUser" hidden="true">${one.userId }</div>
								<div class="hiddenReview" hidden="true">${one.idx }</div>
								<div class="reviewNick">${one.nickname }</div>
								<div class="hiddenProStar" hidden="true">${one.star }</div>
								<div class="reviewProStar"></div>
							</div>
						</div> <!-- end of mgReviewListT -->
						<div class="mgReviewOption" onclick="warningFunction(event)">🚨신고</div>
					</div>	<!-- end of reviewList -->
					<div class="reviewImgList" hidden="true">${one.reviewImg }</div>
					<div class="reviewImg">
						<div class="mgListArrow">
							<span class="reviewAllL" onclick="leftEvent(this)">⬅</span>
							<span class="reviewAllR" onclick="rightEvent(this)">➞</span>
						</div>
						<ul class="selectRestUl">
						</ul>
					</div>
					<div class="reviewCon">${one.review }</div>
					<div class="reviewListB">
						<div class="revWriteDate">${one.writeDate }</div>
					</div>
				</div>
			</c:forEach>
			</div>
			<div id="reviewForTwo" class="hidden">
			<c:forEach var="two" items="${rankTwo }">
				<div class="reviewFor">
					<div class="mgReviewList">
						<div class="mgReviewListT">
							<div class="reviewPrO">
								<c:if test="${not empty two.profileImg }">
									<img src="${cpath }/MemberSH/${two.profileImg}">
								</c:if>
								<c:if test="${empty two.profileImg }">
									<img src="${cpath}/resources/image/basicProfile.png">
								</c:if>
							</div>
							<div class="reviewPrT">
								<div class="hiddenUser" hidden="true">${two.userId }</div>
								<div class="hiddenReview" hidden="true">${two.idx }</div>
								<div class="reviewNick">${two.nickname }</div>
								<div class="hiddenProStar" hidden="true">${two.star }</div>
								<div class="reviewProStar"></div>
							</div>
						</div>	<!-- end of mgReviewListT -->
						<div class="mgReviewOption" onclick="warningFunction(event)">🚨신고</div>
					</div>	<!-- end of reviewList -->
					<div class="reviewImgList" hidden="true">${two.reviewImg }</div>
					<div class="reviewImg">
						<div class="mgListArrow">
							<span class="reviewAllL" onclick="leftEvent(this)">⬅</span>
							<span class="reviewAllR" onclick="rightEvent(this)">➞</span>
						</div>
						<ul class="selectRestUl">
						</ul>
					</div>
					<div class="reviewCon">${two.review }</div>
					<div class="reviewListB">
						<div class="revWriteDate">${two.writeDate }</div>
					</div>
				</div>
			</c:forEach>
			</div>
		</div>	<!-- end of mgReviewBoxRight -->
		<div id="warningList">
			<c:forEach var="w" items="${warning }">
				<div class="warningLBox">
					<div class="hiddenApproval" hidden="true">${w.approval }</div>
					<div class="wlTop">
						<div class="wlDate">신청일:&nbsp;${w.writeDate }</div>
						<div class="wlAppro"></div>
					</div>
					<div class="wlBottom">
						<div class="wlSB"><span>신고내용&nbsp; - </span><div class="wlContent">${w.reviewContent }</div></div>
						<div class="wlSB"><span>신고목록&nbsp; - </span><div class="wlReason">${w.reason }</div></div>
					<c:if test="${w.appPs != null }">
						<div class="wlSB"><span>참고사항&nbsp; - </span><div class="wlResult">${w.appPs }</div></div>
					</c:if>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>	<!-- end of mgReviewBox -->
		<div id="warningSubmit">
			<div id="closeWSubmit" onclick="closeW()">✕ </div>
			<div id="radioBox">
				<div><input type="radio" name="selectReason" value="욕설" onclick="checkReason(event)"> 욕설</div>
				<div><input type="radio" name="selectReason" value="허위사실" onclick="checkReason(event)"> 허위사실</div>
				<div><input type="radio" name="selectReason" value="과도한 비방" onclick="checkReason(event)"> 과도한 비방</div>
				<div><input type="radio" name="selectReason" value="관련 없는 내용" onclick="checkReason(event)"> 관련 없는 내용</div>
				<div><input type="radio" name="selectReason" value="기타" onclick="checkReason(event)">기타</div>
			</div>
			<form id="warningForm">
				<input type="number" name="rest" required="required"  hidden="true">
				<input type="number" name="reviewIdx" required="required" hidden="true">
				<input type="text" name="reviewContent" required="required" hidden="true">
				<input type="text" name="userId" required="required" hidden="true">
				<input type="text" name="reason" required="required" placeholder="기타 사유를 입력하세요" hidden="true"> 
				<div><div id="wSubmitBtn" onclick="submitForm()">제출</div></div>
			</form>
		</div>
</div>

<script>

	document.addEventListener('DOMContentLoaded', function() {
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
		const box = document.querySelectorAll('.mgListArrow');
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
		
		const approval = document.querySelectorAll('.hiddenApproval');
		approval.forEach(i => {
			const app = i.innerText;
			const appBox = i.parentElement.querySelector('.wlAppro');
			if(app == 0){
				appBox.innerText = '대기중';
				appBox.style.color = '#555555';
			} else if(app == 1){
				appBox.innerText = '반려';
				appBox.style.color = '#FD4C34';
			} else if(app == 2){
				appBox.innerText = '승인';
				appBox.style.color = '#3CCB5F';
			}
		});
		
	});
	
	function leftEvent(element) {
	    const ul = element.parentNode.nextElementSibling; 
	    slide(ul, -1); 
	}

	function rightEvent(element) {
	    const ul = element.parentNode.nextElementSibling; 
	    slide(ul, 1);
	}

	function slide(ul, direction) {
	    const liWidth = ul.querySelector('li').offsetWidth; 
	    const scrollAmount = liWidth * direction;
	    ul.scrollBy({ left: scrollAmount, behavior: 'smooth' });
	}

	function OptionOne(e){
		const one = document.getElementById('reviewForOne');
		const two = document.getElementById('reviewForTwo');
		const rankOne = document.getElementById("rankOne");
		const rankTwo = document.getElementById("rankTwo");
		
		one.classList.remove('hidden');
		two.classList.add('hidden');
		rankOne.style.color = '#222225';
		rankTwo.style.color = '#939396';
	};
	
	function OptionTwo(e){
		const one = document.getElementById('reviewForOne');
		const two = document.getElementById('reviewForTwo');
		const rankOne = document.getElementById("rankOne");
		const rankTwo = document.getElementById("rankTwo");
		
		one.classList.add('hidden');
		two.classList.remove('hidden');
		rankOne.style.color = '#939396';
		rankTwo.style.color = '#222225';
	};
	
	async function selectReser(e){
		let rest;
		const target = e.target.closest(".mgReserL").querySelector('.mgReserIdx');
		if(target){
			rest = parseInt(target.innerText);
		}
		const baseUrl = cpath + '/restaurant/manageReviewList';
		var url = baseUrl + '?rest=' + rest;
		const response = await fetch(url);
		if(response.ok){
			window.location.href = url;
		} else {
			console.log(response.status);
			throw new Error('서버 응답에 실패하였습니다.')
		}
	};
	
	function goTo_mypage(){
		location.href = cpath + '/member/mypageO';
	};
	
	async function warningFunction(e) {
		const y = document.querySelectorAll(".mgReviewOption");
	    const warningBox = document.getElementById('warningSubmit');
	    const mgReviewBox = document.getElementById('mgReviewBox');
		y.forEach(i => {
			i.style.color = '#505050'; 
		})
		
		const w = e.target.closest(".mgReviewList").querySelector(".mgReviewOption");
		if(w){w.style.color = 'red';}
		const idx = e.target.closest(".mgReviewList").querySelector(".hiddenReview").innerText;
		const url = cpath + '/restaurant/countWarning';
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
		const count = await fetch(url, opt).then(resp => resp.text());
		if(count == 1){
			alert('이미 신고가 등록된 리뷰입니다')
		} else {
		    innerWarning(e);
		    initRadio();
	        
		    warningBox.classList.add('show');
	        mgReviewBox.classList.add('moveRight');
		}
		console.log(idx);
		console.log(count);
     	
	};
	
	function innerWarning(e){
		const urlParam = new URLSearchParams(window.location.search);
	    const restNum = urlParam.get('rest');
	    const reviewNum = e.target.closest(".mgReviewList").querySelector(".hiddenReview").innerText;
	    const content = e.target.closest(".reviewFor").querySelector(".reviewCon").innerText;
	    const userId = e.target.closest(".reviewFor").querySelector(".hiddenUser").innerText;
	        
		const innerReview = document.querySelector('input[name="reviewIdx"]');
	    const innerRest = document.querySelector('input[name="rest"]');
	    const innerContent = document.querySelector('input[name="reviewContent"]');
	    const innerUser = document.querySelector('input[name="userId"]');
	    
		innerReview.value = reviewNum;
	    innerRest.value = restNum;
	    innerContent.value = content;
	    innerUser.value = userId;
	};
	
	
	function checkReason(e){
		const input = document.querySelector('input[name="reason"]');
		let reason = e.target.value;
		input.value = '';
		if(reason === '기타'){
			input.hidden = false;
			input.disabled = false;	
			input.value = '';
		} else {
			input.hidden = true;
			input.value = reason;
		}
	};
	
	function closeW(){
		const box = document.getElementById('warningSubmit');
		const y = document.querySelectorAll(".mgReviewOption");
		y.forEach(i => {
			i.style.color = '#505050'; 
		})
		
		const input = document.querySelectorAll('input');
		input.forEach(i => {
			i.value = '';
		})
		
		box.classList.remove('show');
		box.classList.remove('moveRight');
	};
	
	function initRadio(){
		const radios = document.querySelectorAll('input[type="radio"]');
		radios.forEach(r => {
			r.checked = false;
		})
		const input = document.querySelector('input[name="reason"]');
		input.value = '';
	};

	async function submitForm(){
		const url = cpath + '/restaurant/submitWarning';
		const form = document.getElementById('warningForm');
		const formData = new FormData(form);
		const opt = {
				method: 'POST',
				body: formData,
		}
		if(confirm('제출하시겠습니까?')){
			const result = await fetch(url, opt).then(resp => resp.text());
			if(result == 1){
				location.reload()
			} else {
				alert('서비스 오류로 잠시후 시도해주세요')
			}
		} else {
			closeW();
		}
	};
	
</script>

</body>
</html>