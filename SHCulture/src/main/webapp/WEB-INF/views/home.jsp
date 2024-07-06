<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="topMenuBar.jsp"%>
<script src="${cpath }/resources/js/script.js"></script>

<div class="mainBox">
	<div id="homeMainBox">
		<div id="bannerBox">
			<div class="bannerImgBox">
				<img src="${cpath }/resources/image/banner1.png" class="bannerImg">
			</div>
			<div class="bannerImgBox">
				<img src="${cpath }/resources/image/banner2.png" class="bannerImg">
			</div>
			<div class="bannerImgBox">
				<img src="${cpath }/resources/image/banner3.png" class="bannerImg">
			</div>
			<ul class="slide_pagination"></ul>
		</div> <!-- end of bannerBox -->
		
		<div id="restRankBox">
			<div id="restRTop"><span class="deco stOne">⯌</span><div>오늘의맛집 Top10<span class="deco stTwo">⯌</span></div></div>
			<div id="rankBox">
				<c:forEach var="dto" items="${dto }">
					<div class="rRestB" onclick="selectRest(event)">
						<div hidden="true" class="hiddenRbIdx">${dto.idx }</div>
						<div class="rRBImg"><img src="${cpath }/RestSH/${dto.restImg}"></div>
						<div class="rRBName">${dto.restName }</div>
						<div class="rRBEtc">
							<div><span class="rRBStar">★</span>${dto.ravg }</div>
							<div>${dto.international }</div>
							<div>${dto.gun }</div>
						</div>
					</div>
				</c:forEach>
				<div id="rRestMbBox">
					<div onclick="leftEvent(this)">⬅</div>
					<div onclick="rightEvent(this)">➞</div>
				</div>
			</div>
		</div>
		
	</div>
</div>
</body>
<script src="${cpath }/resources/js/home.js"></script>
<script>
	function selectRest(e){
		const idx = e.target.closest('.rRestB').querySelector('.hiddenRbIdx').innerText;
		const url = cpath + '/board/selectRest/' + idx;
		window.location.href = url;
	}
	
	 function leftEvent(element) {
	        const div = document.querySelector('#rankBox');
	        Imgslide(div, -1); 
	    }

	    function rightEvent(element) {
	        const div = document.querySelector('#rankBox');
	        Imgslide(div, 1); 
	    }

	    function Imgslide(div, direction) {
	        if (!div) return; 
	        const scrollAmount = div.offsetWidth * direction;
	        div.scrollTo({
	            left: div.scrollLeft + scrollAmount,
	            behavior: 'smooth' 
	        });
	    }

</script>
</html>