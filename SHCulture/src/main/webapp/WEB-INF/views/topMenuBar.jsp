<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<div id="fixTop">
	<div class="topSize">
		<a class="matzipLogo" href="${cpath }">오늘의맛집</a>
		<a class="topListA" href="${cpath }/board/allListRest">맛집탐색</a>
		<c:if test="${login.userId != 'manager01' }">
		<a class="topListA" href="${cpath }/manager/qnaPage">고객센터</a>
		</c:if>
		
		<div id="topSearch" ><span>⌕</span><input type="search" placeholder="통합검색" class="searchTop" oninput="changeColor()" onkeypress="if(event.keyCode == 13){searchTop()}"></div>
		<c:if test="${not empty login }">
			<ul class="Login">
				<c:if test="${login.memberType eq 'M' and login.userId != 'manager01'}">
					<li class="memberLi"><a href="${cpath }/member/myPick">❤</a></li>
					<li class="memberLi"><a href="${cpath }/member/writeReview">✎</a></li>
				</c:if>
				<c:if test="${login.memberType eq 'O' and login.userId != 'manager01'}">
					<li class="memberLi"><a href="${cpath }/restaurant/manageReser">✔</a></li>
					<li class="memberLi"><a href="${cpath }/restaurant/manageReview">✎</a></li>
				</c:if>
				<c:if test="${login.userId eq 'manager01'}">
					<li class="managerLi"><a href="${cpath }/manager/manageHome?selectCate=매장관리&search=&idx=">관리자페이지</a></li>
					<li class="managerLi"><a href="${cpath }/manager/manageQna?checkOp=전체&search=&idx=">문의페이지</a></li>
				</c:if>
				<c:if test="${not empty login.profileImg}">
					<li><img class="homeProfile"
						src="${cpath}/MemberSH/${login.profileImg}"
						onclick="controllUnderBar()">
						<ol id="profileUnderBox" class="underBarHidden">
							<c:if test="${login.memberType eq 'M' and login.userId != 'manager01'}">
								<li><a href="${cpath }/member/mypageM">마이페이지</a></li>
							</c:if>
							<c:if test="${login.memberType eq 'O' and login.userId != 'manager01'}">
								<li><a href="${cpath }/member/mypageO">마이페이지</a></li>
							</c:if>
							<c:if test="${login.memberType eq 'O' and login.userId != 'manager01'}">
								<li><a href="${cpath }/restaurant/insertRest">매장등록</a></li>
								<li><a href="${cpath }/restaurant/userRest">매장관리</a></li>
							</c:if>
							<li><a href="${cpath }/logout">로그아웃</a></li>
						</ol>
					</li>
				</c:if>	
           		<c:if test="${empty login.profileImg}">
					<li><img class="homeProfile"
						src="${cpath}/resources/image/basicProfile.png" onclick="controllUnderBar()">
							<ol id="profileUnderBox" class="underBarHidden">
							<c:if test="${login.memberType eq 'M'}">
								<li><a href="${cpath }/member/mypageM">마이페이지</a></li>
							</c:if>
							<c:if test="${login.memberType eq 'O'}">
								<li><a href="${cpath }/member/mypageO">마이페이지</a></li>
							</c:if>
							<c:if test="${login.memberType eq 'O' }">
								<li><a href="${cpath }/restaurant/insertRest">매장등록</a></li>
								<li><a href="${cpath }/restaurant/userRest">매장관리</a></li>
							</c:if>
							<li><a href="${cpath }/logout">로그아웃</a></li>
						</ol>
					</li>
				</c:if>
			</ul>
		</c:if>
		<c:if test="${empty login }">
			<ul class="notLogin">
				<li><a href="${cpath }/member/login">로그인</a></li>
				<li><a href="${cpath }/member/checkMember">회원가입</a></li>
			</ul>
		</c:if>
	</div>
</div>

<script>
	function controllUnderBar() {
		if(document.getElementById('profileUnderBox').classList.contains('underBarHidden')){
			document.getElementById('profileUnderBox').classList
					.remove('underBarHidden');
		} else {
			document.getElementById('profileUnderBox').classList
			.add('underBarHidden')
		}
	}
	
	function changeColor() {
	    var inputElement = document.querySelector('input[type="search"]');
	    var inputValue = inputElement.value;

	    if (inputValue.trim() !== '' && inputElement === document.activeElement) {
	        document.getElementById('topSearch').style.border = "1px solid #DFA89E";
	    } else {
	        document.getElementById('topSearch').style.border = "1px solid #DDDDDD";
	    }
	}
	
	function searchTop(){
		var searchData = document.querySelector('.searchTop').value;
		
		if(searchData != ''){
			 searchSubmit(searchData);
		} else {
			alert('검색어를 확인해주세요.')
		}
	}
	
	
	
	async function searchSubmit(searchData){
	    const baseUrl = cpath + '/board/searchAll';
	    var search = encodeURIComponent(searchData);
	    console.log(search)
	    var url = baseUrl + '?search=' + search; 
	    const response = await fetch(url);
	    if(response.ok){
	        window.location.href = url;
	    } else {
	        console.log(response.status)
	        throw new Error('서버 응답에 실패하였습니다.')
	    }
	}
</script>
</html>