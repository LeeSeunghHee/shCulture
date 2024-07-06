<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>


<div id="checkMemberBox">
	<div class="memberCheck">
		<div class="OM">
			<a href="${cpath }/member/joinM">
				<div class="mn">일반회원</div>
				<div class="sub">맛집 탐색을 원하세요?</div>
				<div class="arrow">➜</div>
			</a>
		</div>
		
		<div class="MM">
			<a href="${cpath }/member/joinO">
				<div class="mn">사장님</div>
				<div class="sub">가게 등록을 원하세요?</div>
				<div class="arrow">➜</div>
			</a>
		</div>
	</div>
</div> 
</body>
</html>