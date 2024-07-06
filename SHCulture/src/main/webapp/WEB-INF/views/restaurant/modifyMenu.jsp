<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<div id="pilsu">(*)필수 입력</div>
<div id="insertBox">
	<div class="restD">메뉴 수정</div>
	<ul id="formList">
		<c:forEach var="dto" items="${dto }">
			<li class="InsertList">
				<div class="InsertMenuBox">
					<form method="POST" class="MenuForm" enctype="multipart/form-data">
						<input type="number" name="idx" value="${dto.idx}" hidden="true">
						<input type="number" name="rest" value="${dto.rest}" hidden="true">
						<div>
							<c:if test="${not empty dto.menuImg }">
								<img class="MenuImage" src="${cpath }/MenuSH/${dto.menuImg}"
									onclick="fileInputHandler(this)">
							</c:if>
							<c:if test="${empty dto.menuImg }">
								<img class="MenuImage"
									src="${cpath}/resources/image/defaultMenu.png"
									onclick="fileInputHandler(this)">
							</c:if>
							<input type="file" class="fileInput" accept="image/*"
								name="menuUpload" hidden="true">
						</div>
						<div class="menuInfoFi">
							<div>
								<input type="text" placeholder="메뉴 이름을 입력해주세요." name="menuName"
									autocomplete="off" required="required" value="${dto.menuName }">
								<input type="text" placeholder="가격을 입력해주세요.(ex 20000)"
									name="price" autocomplete="off" required="required"
									value="${dto.price }">
							</div>
							<div>
								<textarea placeholder="메뉴 설명을 입력해주세요" name="menuInfo"
									autocomplete="off">${dto.menuInfo }</textarea>
							</div>
						</div>
					</form>
					<div>
						<button onclick="addMenu()" class="addMenuBtn">+</button>
					</div>
					<div>
						<a href="${cpath }/restaurant/deleteMenu/${dto.idx}"><button
								class="deleteMenuBtn">─</button></a>
					</div>
				</div>
			</li>
		</c:forEach>
	</ul>
	<div id="MenuSubBtn">
		<button onclick="submitMenu(event)">등록</button>
	</div>
</div>


<script>
function fileInputHandler(image) {
	var list = image.closest('li');
	var fileInput = list.querySelector('.fileInput');
	
	fileInput.click();
	
	fileInput.addEventListener('change', function() {
        previewMenu(fileInput, image);
    });
}

function previewMenu(input, menuImage) {
    var selectImage = input.files[0];
    var reader = new FileReader();

    reader.onloadend = function() {
        menuImage.src = reader.result;
    }

    if (selectImage) {
        reader.readAsDataURL(selectImage);
    } else {
        menuImage.src = "${cpath}/resources/image/defaultMenu.png";
    }
}

function addMenu() {
	   var originalList = document.querySelector('.InsertMenuBox');
	   var cloneList = originalList.cloneNode(true);
	   
	   cloneList.querySelector('.MenuForm').className = "insertMenuForm";
	   cloneList.querySelector('input[name="menuUpload"]').value = "";
	   cloneList.querySelector('input[name="menuName"]').value = "";
	   cloneList.querySelector('input[name="price"]').value = "";
	   cloneList.querySelector('textArea').value = "";
	   cloneList.querySelector('.MenuImage').src = "${cpath}/resources/image/defaultMenu.png";
	   var deleteButton = cloneList.querySelector('.deleteMenuBtn');
	   if (deleteButton) {
	        deleteButton.parentNode.removeChild(deleteButton);
	    }
	   var div = document.createElement('div'); 
	   
	   var Mbutton = document.createElement('button');
	   Mbutton.textContent = "─";
	   Mbutton.className = "minusMenuBtn";
	   Mbutton.onclick = function(){
		   minusMenu(this);;
	   }
	   var li = document.createElement('li');
	   li.className = "InsertList";
	   
	   div.appendChild(Mbutton);
	   cloneList.appendChild(div);
	   li.appendChild(cloneList);
	   
	   var ul = document.getElementById('formList');
	   ul.appendChild(li);
	   console.log( cloneList.querySelector('.MenuImage').src )
}


function minusMenu(button) {
	var menuBox = button.closest('.InsertList');
	menuBox.parentNode.removeChild(menuBox);
};

async function submitMenu(event) {
    event.preventDefault();
    let count = 0;
    const forms = document.querySelectorAll('form');
    for (const form of forms) {
        const formClass = form.className;
		console.log(formClass);
		
        if (formClass === 'MenuForm') {
            const Ourl = cpath + '/restaurant/modifyMenu';
            const OformData = new FormData(form);

            const Ooptions = {
                method: 'POST',
                body: OformData,
            };

            try {
                const response = await fetch(Ourl, Ooptions);
                console.log(Ooptions)
                if (response.ok) {
                    const result = await response.text();
                    console.log('수정 성공적인 응답 데이터:', result);
                    if (result === '1') {
                        count += 1;
                    }
                } else {
                    throw new Error('서버 에러: ' + response.status);
                }
            } catch (error) {
                console.error('수정 에러 발생=> ', error.message);
            }
        } else if (formClass === 'insertMenuForm') {
            const Turl = cpath + '/restaurant/insertMenu';
            const TformData = new FormData(form);

            const Toptions = {
                method: 'POST',
                body: TformData,
            };

            try {
                const response = await fetch(Turl, Toptions);
                console.log(Toptions)
                if (response.ok) {
                    const result = await response.text();
                    console.log(form);
                    console.log('추가 성공적인 응답 데이터:', result);
                    if (result === '1') {
                        count += 1;
                    }
                } else {
                    throw new Error('서버 에러: ' + response.status);
                }
            } catch (error) {
                console.error('추가 에러 발생=> ', error.message);
            }
        }
    }

    if (count == forms.length) {
        alert('수정이 완료되었습니다.');
        window.location.href = "${cpath}/restaurant/userRest";
    } else {
        alert('기입 내용을 다시 확인해주세요.');
    }

    
};



</script>

</body>
</html>