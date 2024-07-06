<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>


<div id="insertBox">
		<div id="reserveName">예약 운영시간</div>
		<div class="reserveOption">예약 받는 시간 간격은 어떻게 되나요?</div>
		<div id="timeInterval">
			<input type="radio" id="select1" name="interval" value="30" onclick="intervalValue(event)">
				<label for="select1">30분 단위로</label>
			<input type="radio" id="select2" name="interval" value="60" onclick="intervalValue(event)">
				<label for="select2">1시간 단위로</label>
		</div>
		<div class="reserveOption">예약 운영 시간을 알려주세요.</div>
		<div id="intervalBooking">
			<div id="intervalL"><div>운영시간</div></div>
			<ul id="intervalR">
				<li class="ReserveList">
					<div class="breakTiInsert">
						<c:forEach var="dto" items="${dto }">
							<form class="reserveForm">
								<input type="number" name="rest" value="${rst.idx }" hidden="true">
								<span class="reserTc">시작</span><input type="time" name="breakTiOne" value="${dto.breakTiOne }">
									<span>&nbsp;~&nbsp;</span>
								<span class="reserTc">마지막</span><input type="time" name="breakTiTwo" value="${dto.breakTiTwo }">
								<input type="number" name="rotation" hidden="true">
							</form>
						</c:forEach>
					</div>
				</li>
			</ul>
		</div>
		<div id="addBreakTime"><span onclick="addBreakTFunction(event)">＋ 시간 추가</span></div>
		<div id="insertReserve"><button onclick="insertReserveBtn(event)">다음</button></div>
</div>


<script>
	var interval = '';
	
	document.addEventListenter('DOMContentLoaded', function(){
		var rotation = "${dto.rotation}";
		
		if(rotation == 30){
			var select1 = document.getElementById('selec1');
			select1.checked = 'true';
		} else if (rotation == 60){
			var select2 = document.getElementById('select2');
			select2.checked = 'true';
		}
	});
	
	function intervalValue(event) {
		const rotation = document.querySelector('input[name="rotation"]');
		var target = event.target;
		interval = target.value;
		rotation.value = interval;
	}
	
	function addBreakTFunction(event){
		var intervalR = document.getElementById('intervalR');
		var original = document.querySelector('.breakTiInsert');
		var clone = original.cloneNode(true);
		clone.querySelector('input[name=breakTiOne]').value = '';
		clone.querySelector('input[name=breakTiTwo]').value = '';
		
		var deleteBtn = document.createElement('button');
		deleteBtn.classList.add('deleteBtn');
		deleteBtn.textContent = '×';
		deleteBtn.onclick = function(){
			deleteTime(this);
		}
		
		var li = document.createElement('li');
		li.className = 'ReserveList';
		
		li.appendChild(deleteBtn);	
		li.appendChild(clone);
		intervalR.appendChild(li);
	}
	
	function deleteTime(button){
		var breakBox = button.closest('.ReserveList');
		breakBox.parentNode.removeChild(breakBox);
	}
	
	async function insertReserveBtn(event){
		const url = cpath + '/restaurant/modifyReserve';
		const forms = document.querySelectorAll('.reserveForm');
		let cnt = 0;
		
		for(const form of forms){
			const formData = new FormData(form);
			
			const opt = {
					method: 'POST',
					body: formData,
			};
			
			try{
				const response = await fetch(url, opt);
				
				if(response.ok){
					const result = await response.text();
					console.log('성공적인 응답 데이터: ', result);
					cnt += 1;
				} else {
					throw new Error('서버에러: ', response.status);
				}
			} catch (error) {
		        // 네트워크 오류나 기타 예외 발생 시
		        alert('서버와 통신 중 오류가 발생했습니다. 다시 시도해주세요.');
		        console.error('에러 발생 =>', error.message);
		    }
		}
		if(cnt == forms.length){
			window.location.href = '${cpath}/restaurant/insertMenu';
		} else {
			alert('기입 내용을 다시 확인해주세요.')
		}
	}
</script>

</body>
</html>