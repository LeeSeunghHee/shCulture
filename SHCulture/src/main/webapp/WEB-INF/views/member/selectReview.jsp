<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../topMenuBar.jsp"%>

<div class="mainBox">

	<div id="mypageBox">
		<div id="mypageReser">
			<div id="mypageArrow" onclick="hiddenMyReser()">←</div>
			<div id="reserInfomation">리뷰 작성은 예약일 하루 뒤 가능합니다</div>
			<div>
				<c:forEach var="s" items="${reser }">
					<div class="myReserBox" onclick="writeReview(event)">
						<div class="hiddenCount" hidden="true">${s.countReview }</div>
						<div class="hiddenDate" hidden="true">${s.reserDate }</div>
						<div class="reserRestIdx" hidden="true">${s.rest }</div>
						<div class="myReserImg"><img src="${cpath }/RestSH/${s.restImg}"></div>
						<div class="myReserInfo">
							<div class="myReserDate">${s.reserDate }&ensp;${s.reserTime }</div>
							<div class="myReserName">${s.restName }</div>
							<div class="myReserEtc"><span>★</span>&nbsp;${s.rstar }&nbsp;|&nbsp;${s.international }</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div> <!-- end of mypageReser -->
		<div id="mypageReview" class="hidden">
			<div>
				<span id="RestName"></span>
				<div class="insertReview">
					<div class="ReviewFinfo">* 사진은 최대 4장까지 첨부할 수 있습니다.</div>
					<button class="addReviewBtn" onclick="fileClick(event)">사진 첨부</button>
					<form id="reviewInput" enctype="multipart/form-data">
						<input type="text" name="userId" value="${login.userId }" hidden="true">
						<input type="number" name="rest" hidden="true">
						<input type="file" name="uploadReview"  id="inputReImg"
							hidden="true" accept="image/*" multiple>
						<div class="reviewImgF">
							<ul class="reviewUl">
							</ul>
						</div>
						<div id="reviewStarBox">
							<div class="reviewStar">
							<input type="radio" value="5" id="rate1" name="star" class="selectStar">
									<label for="rate1" class="selectLabel">★</label>
								<input type="radio" value="4" id="rate2" name="star" class="selectStar">
									<label for="rate2" class="selectLabel">★</label>
								<input type="radio" value="3" id="rate3" name="star" class="selectStar">
									<label for="rate3" class="selectLabel">★</label>
								<input type="radio" value="2" id="rate4" name="star" class="selectStar">
									<label for="rate4" class="selectLabel">★</label>
								<input type="radio" value="1" id="rate5" name="star" required="required" class="selectStar">
									<label for="rate5" class="selectLabel">★</label>
							</div>
							<div class="selectedRating"></div>
						</div>
						<textarea name="review" maxlength="200" placeholder="200자 이내로 작성해주십시오"></textarea>
						</form>
				</div> <!-- end of insert Review -->
				<div id="reviewBtnBox">
					<button id="ReviewCancle" onclick="cancleReview(event)">취소</button>
					<button id="ReviewBtn" onclick="addReview(event)">작성</button>
				</div>
			</div>
		</div> <!-- end of mypageReview -->
		
		
		<div id="modifyReview" class="hidden">
			<div>
				<div class="insertReview">
					<div id="MoRestName">${dto.restName }</div>
					<form id="reviewModify" enctype="multipart/form-data">
						<input type="text" name="userId" value="${login.userId }" hidden="true">
						<input type="number" name="idx" value="${dto.idx }" hidden="true">
						<input type="number" name="rest" hidden="true" value="${dto.rest }" class="modifyRestNum">
						<div id="reviewStarBox">
							<div class="modifyStarBox">
								<input type="radio" value="5" id="modify1" name="star" class="modifyStar">
									<label for="modify1"  class="modifyLabel">★</label>
								<input type="radio" value="4" id="modify2" name="star" class="modifyStar">
									<label for="modify2" class="modifyLabel">★</label>
								<input type="radio" value="3" id="modify3" name="star" class="modifyStar">
									<label for="modify3" class="modifyLabel">★</label>
								<input type="radio" value="2" id="modify4" name="star" class="modifyStar">
									<label for="modify4" class="modifyLabel">★</label>
								<input type="radio" value="1" id="modify5" name="star" required="required" class="modifyStar">
									<label for="modify5" class="modifyLabel">★</label>
							</div>
							<div class="modifyRating"></div>
						</div>
						<textarea name="review" maxlength="200" placeholder="200자 이내로 작성해주십시오">${dto.review }</textarea>
						</form>
				</div> <!-- end of insert Review -->
				<div id="reviewBtnBox">
					<button id="ReviewCancle" onclick="cancleModify(event)">취소</button>
					<button id="ReviewBtn" onclick="modifyReview(event)">수정</button>
				</div>
			</div>
		</div> <!-- end of mypageReview -->
		
		<div id="selectReviewBox">
			<div id="selectRTop">
				<div id="selectRName">${dto.restName }</div>
				<details class="selectRMenu">
					<summary>...</summary>
					<ul class="selectRMul">
						<li onclick="modifyReviewBtn(event)">수정</li>
						<li onclick="deleteReviewBtn(event)">삭제</li>
					</ul>
				</details>
			</div>
			<div id="selectRStar"></div>
			<div class="selectRImgBox">
				<div class="reviewImgArrow">
					<span class="reviewL">⬅</span>
					<span class="reviewR">➞</span>
				</div>
				<ul class="selectReviewUl">
				</ul>
			</div>
			<div id="selectRComment">${dto.review }</div>
			<div id="selectREtc">
				<div class="selectRE"><span>추천</span>${dto.recommend }</div>
				<div class="selectRE">${dto.writeDate }</div>
			</div>
		</div>
	</div>	<!-- end of mypageBox -->
	
</div>
	

<script>

	document.addEventListener("DOMContentLoaded", function(){
		
		const starBox = document.getElementById('selectRStar');
		const count = '${dto.star}';
		console.log(count);
		for(let i = 0; i < 5; i++){
			const span = document.createElement('span');
			if(i < count){
				span.innerText += '★';
				span.classList.add('innerStar');
				span.style.color = '#FE624C';
				
				starBox.appendChild(span);
			}else {
				const span = document.createElement('span');
				span.innerText += '★';
				span.style.color = '#BFBFBF';
				span.classList.add('innerStar');
				
				starBox.appendChild(span);
			}
			
		}
		const rating = '('+count+'점'+')';
		const s = document.createElement('span');
			s.innerText = rating;
			s.classList.add(rating);
			
		starBox.appendChild(s);
		
		const modifyStar = document.querySelectorAll('.modifyStar');
		const inner = document.querySelectorAll('.modifyRating');
		
		inner.forEach(span => {
	    	span.textContent = rating;
	    });
		modifyStar.forEach(star => {
			if(star.value === count){
				star.checked = true;
			}
		})
		
		const str = "${dto.reviewImg}";
		let arr = [];		
		const ul = document.querySelector('.selectReviewUl');
		const box = document.querySelector('.reviewImgArrow');
		const imgB = document.querySelector('.selectRImgBox');
		if(str != ''){
			if(str.includes(",")){
				arr = str.split(',');
				arr = arr.map(item => item.replace(/['"]/g, '').trim());
				arr.forEach(i => {
					const li = document.createElement('li');
						li.classList.add("selectRLi");
					const img = document.createElement('img');
					const src = '${cpath}/ReviewSH/'+i;
					img.setAttribute('src',src);
					
					box.style.visibility = 'visible';
					li.appendChild(img);
					ul.appendChild(li);
				});
			} else {
				const li = document.createElement('li');
				li.classList.add("selectRLi");
				const img = document.createElement('img');
				img.classList.add('selectRimg');
				const src = '${cpath}/ReviewSH/'+str;
				img.setAttribute('src',src);
				box.style.visibility = 'hidden';
				
				li.appendChild(img);
				ul.appendChild(li);
			}
		} else {
			imgB.style.visibility = 'hidden';
			box.style.visibility = 'hidden';
		}
		
	});
	
	const reviewL = document.querySelector('.reviewL');
	const reviewR = document.querySelector('.reviewR');
	const selectReviewUl = document.querySelector('.selectReviewUl');
	let currentIndex = 0;
	
	reviewL.addEventListener('click', function() {
	    if (currentIndex > 0) {
	        currentIndex--;
	        updateSlide();
	    }
	});
	
	reviewR.addEventListener('click', function() {
		const test = selectReviewUl.children.length;
	    if (currentIndex < selectReviewUl.children.length - 2) {
	        currentIndex++;
	        updateSlide();
	    }
	});
	
	function updateSlide() {
	    const slideWidth = selectReviewUl.children[0].offsetWidth; 
	    const maxIndex = selectReviewUl.children.length - 2;
	    const translateValue = Math.min(currentIndex * slideWidth, maxIndex * slideWidth);
	    selectReviewUl.style.transform = "translateX(-" + translateValue + "px)";
	}
	
	function hiddenMyReser(){
		location.href = cpath + '/member/mypageM';
	};
	
	function fileClick(e){
	    const input = document.getElementById('inputReImg');
	    
	    input.click();
	    
	    input.addEventListener('change', setDetailImage);
	};
	


	function modifyReviewBtn(e){
		const reviewBox = document.getElementById('selectReviewBox');
		const modifyBox = document.getElementById('modifyReview');
		
		reviewBox.classList.add('hidden');
		modifyBox.classList.remove('hidden');
	}
	
	function setDetailImage(e) {
	    const fileList = e.target.files;
	    const ul = document.querySelector('.reviewUl');
	    const mypage = document.getElementById("mypageReview");
	    
	    if (fileList.length <= 5) {
	        for (let i = 0; i < fileList.length; i++) {
	            const reader = new FileReader();
	            const file = fileList[i];
	            var count = document.querySelectorAll('.countLi');
	            if(count.length > 4){
	            	alert('사진은 최대 5장까지 가능합니다.');
	            	break;
	            }
	            reader.onload = (function(file) {
	                return function(event) {
	                	console.log(count.length)
	                    const li = document.createElement('li');
	                    li.classList.add("countLi");
	                    const img = document.createElement('img');
	                    img.src = event.target.result;
	                    const span = document.createElement('span');
	                    span.classList.add('previewDelete');
	                    span.addEventListener('click', function() {
	                    	var index = parseInt(this.getAttribute('data-index'));
	                    	deleteImg(index);
	                    });
	                    span.innerText = '×';
	                    span.setAttribute('data-index', count.length);
	                    
	                    li.appendChild(span);
	                    li.appendChild(img);
	                    ul.appendChild(li);
	                   
	                };
	            })(file, i);
	         	
	           
	            reader.readAsDataURL(file);
	            console.log(file)
	        }
	    } else {
	        alert('사진은 최대 5장까지 가능합니다.');
	    }
	    
	};


	function deleteImg(index){
		const span = document.querySelector('span[data-index="' + index + '"]');
		if (span) {
			const li = span.parentElement;
			if (li) {
				li.remove();
		    }
		}
		console.log(index)
		const input = document.getElementById('inputReImg');
		const dt = new DataTransfer();
		const files = input.files;
		for(let i = 0; i < files.length; i++){
			const file = files[i];
			if(index !== i){
				dt.items.add(file);
			}
		}
		input.files = dt.files;
	};


	
	function writeReview(e){
		var target = e.target;
		var current = new Date();
		var rest = document.querySelector('input[name="rest"]');
		var name = document.getElementById("RestName");
		
		while (target && !target.classList.contains('myReserBox')) {
	        target = target.parentElement;
	    }

	    if (target) {
	    	var count = target.querySelector('.hiddenCount').innerText;
	        var reserDate = target.querySelector('.hiddenDate').innerText;
	        var idx = target.querySelector('.reserRestIdx').innerText;
	        var reserName = target.querySelector('.myReserName').innerText;
	        
	        var reser = new Date(reserDate);
	        	reser.setDate(reser.getDate()+1);
	        var limit = new Date(reser);
	        	limit.setDate(reser.getDate()+7);
	        	
	        if(count == 0) {
		        if(reser < current){
		        	if(limit > current){
		        		console.log('success')
		        		rest.value = idx;
		        		name.innerText = reserName;
		        		openReviewBox();
		        		
		        	} else if(limit < current){
		        		alert('리뷰 작성 기간이 만료되었습니다.');
		        	}
		        } else{
		        	alert('작성 기간이 아닙니다.')
		        }
	   		}  else if(count == 1){
	   			location.href = cpath + '/member/selectReview/'+idx;
	   		}
	    }
	};
	
	
	
	
	
	function openReviewBox() {
		const reviewBox = document.getElementById("mypageReview");
		const selectReviewBox = document.getElementById('selectReviewBox');
		const modifyReviewBox = document.getElementById('modifyReview');
			selectReviewBox.classList.add('hidden');
			modifyReviewBox.classList.add('hidden');
			reviewBox.classList.remove('hidden');
	}
	
	function cancleReview(e){
		const reviewBox = document.getElementById("mypageReview");
			reviewBox.classList.add('hidden');	
	}
	
	function cancleModify(e){
		const modifyBox = document.getElementById('modifyReview');
		modifyBox.classList.add('hidden');
	}
	
	function deleteReviewBtn(e){
		if(window.confirm('정말 삭제하시겠습니까?')){
			deleteReview();		
		}
	}
	
	async function deleteReview(){
		console.log("deleteReview");
		const rest = document.querySelector('.modifyRestNum').value;
		const url = cpath + '/member/deleteReview';
		const data = {
				rest: rest
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
			alert('작성하신 리뷰가 삭제되었습니다.')
			window.location.href = cpath + '/member/writeReview';
		} else {
			alert('삭제에 실패하였습니다')
		}
	};
	
	
	const ratingInputs = document.querySelectorAll('.selectStar');
	function displaySelectedRating() {
		const selectedRatingSpan = document.querySelector('.selectedRating');
	    let selectedRating = null;
	    ratingInputs.forEach(input => {
	        if (input.checked) {
	            selectedRating = input.value;
	        }
	    });
	    if (selectedRating !== null) {
	        selectedRatingSpan.textContent = "(" + selectedRating + '점' + ")";
	    } else {
	        selectedRatingSpan.textContent = '';
	    }
	}
	
	const modifyStar = document.querySelectorAll('.modifyStar');
	function displayModifyRating() {
		const selectedRatingSpan = document.querySelector('.modifyRating');
	    let selectedRating = null;
	    modifyStar.forEach(input => {
	    	if(input.checked){
	            selectedRating = input.value;
	    	}
	    });
	    if (selectedRating !== null) {
	        selectedRatingSpan.textContent = "(" + selectedRating + '점' + ")";
	    } else {
	        selectedRatingSpan.textContent = '';
	    }
	}
	
	ratingInputs.forEach(input => {
	    input.addEventListener('change', displaySelectedRating);
	});
	modifyStar.forEach(input => {
	    input.addEventListener('change', displayModifyRating);
	});
	
	async function modifyReview(e){
		const url = cpath + '/member/updateReview';
		const data = document.getElementById('reviewModify');
		const formData = new FormData(data);
		const opt = {
				method: 'POST',
				body: formData,
		}
		
		const result = await fetch(url, opt).then(resp => resp.text());
		if(result == 1){
			location.reload();
		} else {
			alert('리뷰 수정에 실패하였습니다.');
		}
	}

	
	async function addReview(e){
		const form = document.getElementById('reviewInput');
		const url = cpath + '/member/writeReview';
		const formData = new FormData(form);
		const rest = document.querySelector('input[name="rest"]');
		const idx = rest.value;
		const opt = {
				method: 'POST',
				body: formData,
		}
		const result = await fetch(url, opt)
			.then(resp => {
				if(resp.ok){
					return resp.text();
				} else {
					throw new Error('서버에러: ', resp.status);
				}
			}).then (result => {
				if(result == 1){
					alert('리뷰가 등록되었습니다')
					location.reload();
				} else {
					alert('리뷰 등록에 실패하였습니다.')
				}
			})
			.catch(error => {
				console.log('에러 발생: ', error.message);
			})
	};

</script>

</body>
</html>