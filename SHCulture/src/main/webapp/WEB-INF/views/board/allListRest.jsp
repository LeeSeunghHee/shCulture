<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../topMenuBar.jsp" %>


<div class="mainBox">
	
	<div id="restListM">
		<div id="checkM">
			<div id="checkMBox">
				<c:forEach var="b" items="${busan }">
					<span class="checkbox">
						<input type="checkbox" name="bg" id="bg_${b.bg}" value="${b.bg }">
						<label for="bg_${b.bg}" class="bgLabel">${b.bg }</label>
					</span>
				</c:forEach>
				<div id="interCheck">
					<c:forEach var="i" items="${intern }">
						<span class="checkbox">
						<input type="checkbox" name="name" id="name_${i.name}" value="${i.name }">
						<label for="name_${i.name}" class="nameLabel">${i.name }</label>
					</span>
					</c:forEach>
				</div>
				<div id="searchBtn">
					<button onclick="searchFunction(event)">검색</button>
				</div>
			</div>
		</div>	
		<div id="restListB">
			<c:forEach var="rst" items="${restList}">
				<div class="restL">
					<div><a href="${cpath }/board/selectRest/${rst.idx}"><img src="${cpath }/RestSH/${rst.restImg}"></a></div>
					<div class="restLN">${rst.restName }</div>
					<div class="restLE">&nbsp;<span>★</span>&nbsp;${rst.ravg } | ${rst.international } | <span class="closeDay">${rst.closeDay }</span></div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div id="allListTopBtn">
		<div class="listTopO" onclick="boarTop(event)">⌅</div>
		<div class="listTopT"><a href="${cpath }/board/allListRest">전체보기</a></div>
	</div>
	
</div>

<script>
	
	var closeDay = document.querySelectorAll('.closeDay');
	
	closeDay.forEach(function(closeDay){
		var close = closeDay.textContent;
		
		if(close.trim() === "휴무" || close.trim() === "영업종료"){
			closeDay.style.color = "#FE624C";
		} else if(close.trim() === "영업전") {
			closeDay.style.color = "#646262";
		} 
		else {
			closeDay.style.color = "#18C63B";
		}
	});
	
	function searchFunction(event) {
    	var gunArr = [];
    	var gunChecked = document.querySelectorAll('input[name="bg"]');
    	var interArr = [];
    	var interChecked = document.querySelectorAll('input[name="name"]');
		
    	
    	if (gunChecked != '') {
    	    var gunArr = [];
    	    for (var i = 0; i < gunChecked.length; i++) {
    	        if (gunChecked[i].checked) {
    	            gunArr.push(gunChecked[i].value);
    	        }
    	    }
    	    var gunString = gunArr.join(",");
    	}

    	if (interChecked != '') {
    	    var interArr = [];
    	    for (var i = 0; i < interChecked.length; i++) {
    	        if (interChecked[i].checked) {
    	            interArr.push(interChecked[i].value);
    	        }
    	    }
    	    var interString = interArr.join(",");
    	}

    	if (gunString || interString) {
    	    searchOption(gunString, interString);
    	}
    	else{
    		console.log("에러")
    		console.log(interChecked)
    	}
    	
	}
	
	function boarTop(event){
		window.scrollTo(0,0);
	}
	
	async function searchOption(gunString, interString){
		var gun = gunString;
		var inter = interString;
		var gun = '';
		var inter = '';
		const data = {};
		if(gun != null) {
			gun = gunString;
		}
		if(inter != null){
			inter = interString;
		}
		
		const baseUrl = cpath + '/board/searchOption';
		const url = baseUrl + '?gun=' + encodeURIComponent(gun) + '&inter=' + encodeURIComponent(inter);
		
		const response = await fetch(url);
		const responseData = await response.text(); 
		console.log(responseData);
		
		 window.location.href =  url;
	}
	

</script>

</body>
</html>