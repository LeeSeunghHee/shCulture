<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../topMenuBar.jsp"%>

<div class="mainBox">
	<div id="manageBox">
	<div id="manageRightBox">
		<div id="manageMenuBar">
			<div class="mmb" onclick="selectCategory(event)">매장관리</div>
			<div class="mmb" onclick="selectCategory(event)">댓글관리</div>
		</div>
		<div id="managerListBox">
		<div id="mhRestList" hidden="true">
			<div id="mhSeRestBox">
				<ul>
					<li onclick="searchMhRest(event)">전체</li>
					<li><input type="search" id="searchmhRest" placeholder="검색어를 입력하세요" autocomplete="off" onkeypress="if(event.keyCode == 13){searchMhRest(event)}"></li>
				</ul>
			</div>
			<table id="mhRestTable">
				<tbody id="mhRestBody">
			<c:forEach var="r" items="${rest }">
				<tr>
					<td>${r.international }</td>
					<td>${r.restName }</td>
					<td>${r.gun}</td>
				<c:if test="${r.ravg != 0 }">
					<td><span class="mhStar">★</span>${r.ravg }</td>
				</c:if>
				<c:if test="${r.ravg == 0 }">
					<td><span class="mhStar">★</span>0</td>
				</c:if>
					<td><button class="mhRestBtn" onclick="deleteRest(event)">삭제</button></td>
					<td hidden="true" class="hiddenIdx">${r.idx }</td>
			</c:forEach>
				</tbody>
			</table>
		</div> 	<!-- end of mhRestList -->
		<div id="mhWarningList" hidden="true">
			<div id="mhSeWar">
				<ul>
					<li onclick="selectWarning(event)" class="selectWarningC">전체</li>
					<li onclick="selectWarning(event)" class="selectWarningC">대기중</li>
					<li onclick="selectWarning(event)" class="selectWarningC">거절</li>
					<li onclick="selectWarning(event)" class="selectWarningC">승인</li>
				</ul>
			</div>
			<table id="mhWarningTable">
				<tbody id="mhWarningBody">
				<c:forEach var="w" items="${warning }">
					<tr onclick="inputWarning(event)">
						<td>${w.reason }
						<td>${w.restName }</td>
						<td>${w.writeDate }</td>
						<c:if test="${w.approval == 0 }">
							<td class="mhApp APone">대기중</td>
						</c:if>
						<c:if test="${w.approval == 1 }">
							<td class="mhApp APtwo">거절</td>
						</c:if>
						<c:if test="${w.approval == 2 }">
							<td class="mhApp APthree">승인</td>
						</c:if>
						<td class="hiddenApp" hidden="true">${w.approval }</td>
						<td class="hiddenmhWIdx" hidden="true">${w.idx }</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>	<!-- end of mhWarningList -->
		</div>	<!-- end of managerListBox -->
	</div>	<!-- end of manageRightBox -->
	
	<c:if test="${sw.idx != null }">
	<div id="manageLeftBox">
		<div id="selectW">
			<div class="swSp"><span>작성일</span><div>${sw.writeDate }</div></div>
			<div class="swSp"><span>매장</span><div>${sw.restName }</div></div>
			<div class="swSp"><span>카테고리</span><div>${sw.reason }</div></div>
			<div class="swSt"><span>신고내용</span><div>${sw.reviewContent }</div></div>
		</div>
		<c:if test="${sw.approval == '0' }">
			<div id="warningfBox">
				<div id="mhWS">
					<ul>
						<li onclick="insertApp(event)">승인</li>
						<li onclick="insertApp(event)">거절</li>
					</ul>
				</div>
				<div id="updateWarning" onclick="updateWarning(event)">제출</div>
				<form id="warningForm">
					<div class="mhWSArea">
						<textarea placeholder="안내사항이 있다면 작성해주세요" name="appPs"></textarea>
					</div>
					<input type="number" name="approval" hidden="true">
					<input type="number" name="idx" value="${sw.idx }" hidden="true">
				</form>
			</div>
		</c:if>
		
		<c:if test="${sw.approval != '0' and sw.appPs != null }">
			<div id="warningfBox">
				<c:if test="${sw.approval == '1' }">
					<div class="wwhhSelect whONe">거절</div>
				</c:if>
				<c:if test="${sw.approval == '2' }">
					<div class="wwhhSelect whTWo">승인</div>
				</c:if>
				<div class="mhWappPs">
					<textarea readonly="readonly" class="appPsText">${sw.appPs }</textarea>
				</div>
			</div>
		</c:if>
	</div>
	</c:if>
	</div>	<!-- end of manageBox -->
</div>	

</body>

<script>
	document.addEventListener('DOMContentLoaded', function(){
		const login = '${login.userId}';
		if(login !== 'manager01'){
			alert('올바른 경로가 아닙니다')
			window.location.href = cpath;
		}
		let category ='';
		let search = '';
		let url  = new URL(window.location.href);
		let param = new URLSearchParams(url.search);
		category = param.get('selectCate');
		search = param.get('search');
		const selectCategory = document.querySelectorAll('.mmb');
		const restL = document.getElementById('mhRestList');
		const warningL = document.getElementById('mhWarningList');
		const warning = document.querySelectorAll('.selectWarningC');
		selectCategory.forEach((i) => {
			if(i.innerText === category){
				i.style.background = 'white';
				i.style.color = 'black';
				i.style.boxShadow = 'rgba(0, 0, 0, 0.05) 0px 6px 24px 0px, rgba(0, 0, 0, 0.08) 0px 0px 0px 1px';
				i.style.borderRight = 'none';
			}
		})
		if(category === '매장관리'){
			restL.hidden = false;
			warningL.hidden = true;
		} else if (category === '댓글관리'){
			warningL.hidden = false;
			restL.hidden = true;
			select_CateSearch(search);
		}
		
		warning.forEach((i) => {
			if(i.innerText === search){
				i.style.color = '#939396';
			}
		})
		
		const app = document.querySelectorAll('.mhApp');
		app.forEach((i) => {
			let appText = i.innerText;
			if(appText === '대기중'){
				i.style.color = '#229CFF';
			} else if(appText === '승인'){
				i.style.color = '#4AD86C';
			} else if(appText === '거절'){
				i.style.color = '#FD5F49';
			}
		})
		
		function select_CateSearch(search){
			let innerSearch = '';
			if(search == ''){
				innerSearch = '전체';
			} else if(search == '1'){
				innerSearch = '거절';	
			} else if(search == '2'){
				innerSearch = '승인';
			} else if(search == '0'){
				innerSearch = '대기중';
			}
			warningUL(innerSearch);
		}
		
		function warningUL(innerSearch) {
			const li = document.querySelectorAll('.selectWarningC');
			li.forEach((i) => {
				if(i.innerText === innerSearch){
					i.style.color = '#222225';
				}
			});
		}
	});
	
	function selectCategory(e){
		let selec = e.target.innerText;
		gotoCate(selec);
	}
	async function gotoCate(select){
		const url = cpath + '/manager/manageHome?selectCate=' + select + '&search=&idx=';
		const response = await fetch(url);
		if(response.ok){
			window.location.href = url;
		} else {
			alert('서버 응답에 실패하였습니다.');
			console.log(response.status);
			throw new Error('서버 응답에 실패하였습니다.');
		}
	}
	
	async function searchMhRest(e){
		let search = e.target.value;
		if(search === 0){
			search = '';
		}
		const url = cpath + '/manager/manageHome?selectCate=매장관리' + '&search=' + search + '&idx=';
		const response = await fetch(url);
		if(response.ok){
			window.location.href = url;
		} else {
			alert('서버 응답에 실패하였습니다.');
			console.log(response.status);
			throw new Error('서버 응답에 실패하였습니다.');
		}
	}
	
	
	async function deleteRest(e){
		const url = cpath + '/manager/deleteRest';
		const hidden = e.target.closest('tr').querySelector('.hiddenIdx');
		const idx = hidden.innerText;
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
		const result = await fetch(url, opt).then(resp => resp.text());
		if(result == 1){
			alert('매장이 제거되었습니다');
			location.reload();
		}
	}
	let war = '';
	async function selectWarning(e){
		war = e.target.innerText;
		if(war === '전체'){
			war = '';
		} else if(war === '대기중'){
			war = '0';
		} else if(war === '거절'){
			war = '1';
		} else if(war === '승인'){
			war = '2';
		}
		const url = cpath + '/manager/manageHome?selectCate=댓글관리' + '&search=' + war + '&idx=';
		const response = await fetch(url);
		if(response.ok){
			window.location.href = url;
		} else {
			alert('서버 응답에 실패하였습니다.');
			console.log(response.status);
			throw new Error('서버 응답에 실패하였습니다.');
		}
	}
	
	async function inputWarning(e){
		let hiddenIdx = e.target.closest('tr').querySelector('.hiddenmhWIdx');
		let app = e.target.closest('tr').querySelector('.hiddenApp');
		let approval = app.innerText;
		let idx = hiddenIdx.innerText;
		let param  = idx + '_' + approval;
		const url = cpath + '/manager/manageHome?selectCate=댓글관리' + '&search=' + war + '&idx=' + param;
		const response = await fetch(url);
		if(response.ok){
			window.location.href = url;
		} else {
			alert('서버 응답에 실패하였습니다.');
			console.log(response.status);
			throw new Error('서버 응답에 실패하였습니다.');
		}
	}
	
	function insertApp(e){
		const li = e.target;
	    const liInner = li.innerText;
	    const app = document.querySelector('input[name="approval"]');
	    const allLi = document.querySelectorAll('ul li');

	    allLi.forEach(function(item) {
	        item.style.color = ''; 
	        item.style.fontWeight = 'normal';
	    });
	    
	    if(liInner === '승인'){
	        app.value = 2;
	        li.style.color = '#222225';
	        li.style.fontWeight = 'bold';
	    } else {
	        app.value = 1;
	        li.style.color = '#222225';
	        li.style.fontWeight = 'bold';
	    }
	}
	
	async function updateWarning(e){
		const url = cpath + '/manager/updateWarning';
		const form = document.getElementById('warningForm');
		const formData = new FormData(form);
		const opt = {
				method: 'POST',
				body: formData,
		};
		
		const result = await fetch(url, opt).then(resp => resp.text());
		if(result == 1){
			window.location.reload();
		} else {
			alert('잠시후 다시 시도해주세요')
		}
	}
</script>

</html>