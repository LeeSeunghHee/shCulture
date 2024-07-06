<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../topMenuBar.jsp"%>


<div class="mainBox">
	
	<div id="mgReserBox">
		<div id="mgReserBoxLeft">
		<div id="mypageArrow" onclick="goTo_mypage(event)">←</div>
			<c:forEach var="rest" items="${restaurant }">
				<div class="mgReserL" onclick="selectReser(event)">
					<div class="mgReserIdx" hidden="true">${rest.idx }</div>
					<div class="mgReserImg"><img src="${cpath }/RestSH/${rest.restImg}"></div>
					<div class="mgReserCon">
						<div class="mgReserName">${rest.restName }</div>
						<div class="mgReserEtc"><span>★</span>&nbsp;${rest.ravg } | ${rest.international }</div>
					</div>
					<div class="hiddenApp" hidden="true">${rest.app }</div>
				</div>
			</c:forEach>
		</div>	<!-- end of mgReserBoxLeft -->
		
		<div id="mgReserBoxMiddle">
			<div id="mgRBRTop">
				<ul id="mgRBRUl">
					<li class="mgRBRLiW" onclick="selectLiW(event)">대기중</li>
					<li class="mgRBRLiD" onclick="selectLiD(event)">거절</li>
				</ul>
			</div>
			<div id="mgRBRListW">
				<c:forEach  var="w" items="${listW }">
					<div class="wListBox">
						<div class="wbox">
							<div class="reserIdx" hidden="true">${w.idx }</div>
							<div class="resrName"><span>예약자</span>${w.userName }</div>
						</div>
						<div class="wbox">
							<div class="reserDate"><span>예약일</span>${w.reserDate }&nbsp;(${w.reserTime })</div>
						</div>
						<div class="wbox">
							<div class="resrPe"><span>인원</span>${w.people }명</div>
						</div>
						<c:if test = "${not empty w.etc}">
							<div class="wbox">
								<div class="resrEtc"><span>참고</span>${w.etc }</div>
							</div>
						</c:if>
						<div class="wbox">
							<div class="approvalBtnBox">
								<button class="acceptBtn" onclick="updateFunction(event)">승인</button>
								<button class="rejectBtn" onclick="updateFunction(event)">거절</button>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			
			<div id="mgRBRListD" class="hidden">
				<c:forEach  var="d" items="${listD }">
					<div class="dListBox">
						<div class="reserIdx" hidden="true">${d.idx }</div>
						<div class="wbox">
							<div class="resrName"><span>예약자</span>${d.userName }</div>
						</div>
						<div class="wbox">
							<div class="reserDate"><span>예약일</span>${d.reserDate }&nbsp;(${d.reserTime })</div>
						</div>
						<div class="wbox">
							<div class="resrPe"><span>인원</span>${d.people }명</div>
						</div>
						<c:if test = "${not empty d.etc}">
							<div class="wbox">
								<div class="resrEtc"><span>참고</span>${d.etc }</div>
							</div>
						</c:if>
					</div>
				</c:forEach>
			</div>
		</div> <!-- end of mgReserBoxMiddle -->
		
		<div id="mgReserBoxRight">
			<div id="mgReRbody">
			<div id="mgReserCalender">
				<div class="mgHeader">
					<div class="mgYearMonth"></div>
					<div class="mgnav">
						<button class="nav-btn go-prev" onclick="prevMonth()">&lt;</button>
		                <button class="nav-btn go-today" onclick="goToday()">today</button>
		                <button class="nav-btn go-next" onclick="nextMonth()">&gt;</button>
					</div>
				</div>
				
				<div class="mgCalmain">
		        	<div class="mgdays">
		                <div class="mgday">일</div>
		                <div class="mgday">월</div>
		                <div class="mgday">화</div>
		                <div class="mgday">수</div>
		                <div class="mgday">목</div>
		                <div class="mgday">금</div>
		                <div class="mgday">토</div>
		            </div>
	            	<div class="mgdates"></div>
				</div>
			</div> <!-- end of mgReserCalender -->
			
			<div id="selectDRBox">
				<c:forEach var="sd" items="${selectD }">
					<div class="selectDR">
						<div class="wbox">
							<div class="resrName"><span>예약자</span>${sd.userName }</div>
						</div>
						<div class="wbox">
							<div class="reserDate"><span>예약일</span>${sd.reserDate }&nbsp;(${sd.reserTime })</div>
						</div>
						<div class="wbox">
							<div class="resrPe"><span>인원</span>${sd.people }명</div>
						</div>
						<c:if test = "${not empty sd.etc}">
							<div class="wbox">
								<div class="resrEtc"><span>참고</span>${sd.etc }</div>
							</div>
						</c:if>
					</div>
				</c:forEach>
			</div>
			</div> <!-- end of mgReRbody -->
		</div>  <!-- end of mgReserBoxRight  -->
	</div>	<!-- end of mgReserBox -->
	
</div>

<script src="${cpath }/resources/js/mgCalender.js"></script>
<script>
	document.addEventListener('DOMContentLoaded', function(){
	    const apps = document.querySelectorAll('.hiddenApp');
	    
	    apps.forEach(function(app){
	        const result = parseInt(app.innerText);
	        if(!isNaN(result) && result !== 0){
	            const parent = app.closest('.mgReserL');
	            if(parent){
	                const div = document.createElement('div');
	                div.classList.add('mgReserApp');
	                div.innerText = result;
	                parent.appendChild(div);
	            }
	        }
	    });
	});
	
	const wList = document.getElementById("mgRBRListW");
	const dList = document.getElementById("mgRBRListD");
	const w = document.querySelector('.mgRBRLiW');
	const d = document.querySelector('.mgRBRLiD');
	
	function selectLiW(e){
		w.style.color = "#222225";
		d.style.color = "#939396";
		wList.classList.remove("hidden");
		dList.classList.add("hidden");
	}
	
	function selectLiD(){
		d.style.color = "#222225";
		w.style.color = "#939396";
		dList.classList.remove("hidden");
		wList.classList.add("hidden");
	}
	
	function goTo_mypage(){
		location.href = cpath + '/member/mypageO';
	}
	
	async function selectReser(e){
		let rest;
		const target = e.target.closest('.mgReserL').querySelector('.mgReserIdx');
		if(target){
			rest = parseInt(target.innerText);
		}
		const  today = new Date();
		const selectDate = today.toISOString().split('T')[0];
		const baseUrl = cpath + '/restaurant/manageReserList';
		var url = baseUrl + '?rest=' + rest + '&selectDate=' + selectDate;
		const response = await fetch(url);
		if(response.ok){
			window.location.href = url;
		} else {
			console.log(response.status);
			throw new Error("서버 응답에 실패하였습니다.");
		}
	}
	
	async function dayReser(rest, date){
		const baseUrl = cpath + '/restaurant/manageReserList';
		var url = baseUrl + '?rest=' + rest + '&selectDate=' + date;
		const response = await fetch(url);
		if(response.ok){
			window.location.href = url;
		} else {
			console.log(response.status);
			throw new Error("서버 응답에 실패하였습니다.");
		}
	}
	
	function updateFunction(e){
		const condition = e.target.innerText;
		const idx = e.target.closest('.wListBox').querySelector('.reserIdx').innerText;
		let approval;
		if(condition === '승인'){
			if(window.confirm('승인하시겠습니까?')){
				approval = 2;
				approvalFunction(idx,approval);
			}		
		} else if (condition === '거절'){
			if(window.confirm('거절하시겠습니까?')){
				approval = 1;
				approvalFunction(idx,approval);
			}
		}
	}
	
	async function approvalFunction(idx, approval){
		const url = cpath + '/restaurant/updateReser';
		console.log(idx)
		console.log(approval)
		const data = {
				idx: idx,
				approval: approval
		};
		const opt = {
				method: 'POST',
				body: JSON.stringify(data),
				headers: {
					'Content-Type': 'application/json; charset=utf-8'
				}
		};
		
		const result = await fetch(url, opt).then (resp => resp.text());
		if(result == 1){
			location.reload();
		}
		else {
			alert('잠시 후 시도해주세요')
		}
	} 
</script>


</body>
</html>