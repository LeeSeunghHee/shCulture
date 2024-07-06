<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../topMenuBar.jsp"%>

<div class="mainBox">
	<div id="memberBKbox">
		<c:forEach var="resr" items="${reser }">
			<div class="memberReseres">
				<div class="reserFB">
					<div class="reserFimg"><img src="${cpath }/RestSH/${resr.restImg}"></div>
					<a href="${cpath }/board/selectRest/${resr.rest}">
					<div class="reserFEtc">
						<div class="reserFName">${resr.restName }</div>
						<div class="reserFTime">${resr.reserDate }&ensp;|&ensp;${resr.reserTime }</div>					
						<div class="hiddenReserDate" hidden="true">${resr.reserDate }</div>
					</div>
					</a>
				</div>
				
				<div class="reserSecB">
					<div class="reserSecFBox">
						<c:if test="${resr.review != null}">
								<div class="reserSBS">
									<div class="reserSBStar"><span>★</span>${resr.star }</div>
									<div class="reserSBDate">${resr.writeDate }</div>
								</div>
							 	<div class="reserSBnotN">
							 		<div class="reserSBReview">${resr.review }</div>
							 		<div class="hiddenImg" hidden="true">${resr.reviewImg }</div>
							 		<div class="reserSBImg"></div>
							 	</div>
						</c:if>
						<c:if test="${resr.review  == null}">
							<div class="reserSBnN">
								<div onclick="writeReview(event)">✎_리뷰작성</div>
							</div>
						</c:if>
					</div> <!-- end of reserSecFBox -->
					
					<div class="reserSecSBox">
						<div class="reserSecInfo">
							<span>예약자</span>
							<div>${resr.userName }</div>
						</div>
						<div class="reserSecInfo">
							<span>인원</span>
							<div>${resr.people }</div>
						</div>
						<c:if test="${resr.etc != null }">
						<div class="reserSecInfo">
							<span>참고사항</span>
							<div>${resr.etc }</div>
						</div>
						</c:if>
					</div>
				</div>	<!-- end of reserSecB -->
			</div>
		</c:forEach>
	</div>
</div>


<script>
	document.addEventListener("DOMContentLoaded", function () {
	    const imgStr = document.querySelectorAll(".hiddenImg");
	    if (imgStr.length > 0) {
	        imgStr.forEach(i => {
	            const imgBox = i.nextElementSibling; 
	            if (imgBox && imgBox.classList.contains('reserSBImg')) {
	                if (i.textContent.trim() !== '') {
	                    let arr = i.textContent.split(',').map(item => item.replace(/['"]/g, '').trim());
	                    const src = arr[0];
	                    const img = document.createElement('img');
	                    img.src = `${cpath}/ReviewSH/` + src;
	                    imgBox.appendChild(img);
	                }
	            }
	        });
	    }
	});

	
	function writeReview(e){
		const closest = e.target.closest('.memberReseres');
		const reserDate = closest.querySelector(".hiddenReserDate").innerText;
		console.log(reserDate);
		var current =  new Date();
		var reser = new Date(reserDate);
			reser.setDate(reser.getDate()+1);
			
		var limit = new Date(reser);
			limit.setDate(reser.getDate()+7);
			
		
		if(reser < current){
			if(limit > current){
				location.href = cpath + '/member/writeReview';
			} else if(limit < current){
				alert('리뷰 작성 기간이 만료되었습니다');
			} 
		} else {
			alert('작성 기간이 아닙니다');
		}
	}
</script>

</body>
</html>