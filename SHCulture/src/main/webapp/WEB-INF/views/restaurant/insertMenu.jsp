<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<div id="pilsu">(*)필수 입력</div>
<div id="insertBox">
	<div class="restD">메뉴 등록</div>
	<ul id="formList">
		<li class="InsertList">
		<div class="InsertMenuBox">
			<form method="POST" class="MenuForm" enctype="multipart/form-data">
				<input type="number" name="rest" value="${rst.idx}" hidden="true">
				<div>
					<img src="${cpath }/resources/image/defaultMenu.png" class="MenuImage" onclick="fileInputHandler(this)">
					<input type="file" class="fileInput" accept="image/*" name="menuUpload" hidden="true">
				</div>
				<div class="menuInfoFi">
					<div>
						<input type="text" placeholder="메뉴 이름을 입력해주세요." name="menuName" autocomplete="off" required="required">
						<input type="text" placeholder="가격을 입력해주세요.(ex 20000)" name="price" autocomplete="off" required="required">
					</div>
					<div>
						<textarea placeholder="메뉴 설명을 입력해주세요" name="menuInfo" autocomplete="off"></textarea>
					</div>
				</div>
			</form>
			<div>
				<button onclick="addMenu()" class="addMenuBtn">+</button>
			</div>
		</div>
		</li>
	</ul>
	<div id="MenuSubBtn"><button onclick="submitMenu(event)">등록</button></div>
</div>


<script>
var rst = document.querySelector('input[name="rest"]').value;

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
	   
	   cloneList.querySelector('input[name="menuUpload"]').value = "";
	   cloneList.querySelector('input[name="menuName"]').value = "";
	   cloneList.querySelector('input[name="price"]').value = "";
	   cloneList.querySelector('textArea').value = "";
	   cloneList.querySelector('.MenuImage').src = "${cpath}/resources/image/defaultMenu.png";
	   
	   var div = document.createElement('div'); 
	   
	   var Mbutton = document.createElement('button');
	   Mbutton.textContent = "─";
	   Mbutton.className = "outMenuBtn";
	   Mbutton.onclick = function(){
		   minusMenu(this);
	   }
	   var li = document.createElement('li');
	   li.className = "InsertList";
	   
	   div.appendChild(Mbutton);
	   cloneList.appendChild(div);
	   li.appendChild(cloneList);
	   
	   var ul = document.getElementById('formList');
	   ul.appendChild(li);
}


function minusMenu(button) {
	var menuBox = button.closest('.InsertList');
	menuBox.parentNode.removeChild(menuBox);
};

async function submitMenu(event) {
    let count = 0;
    const url = cpath + '/restaurant/insertMenu';
    const forms = document.querySelectorAll('.MenuForm');

    for (const form of forms) {
        const formData = new FormData(form);

        const options = {
            method: 'POST',
            body: formData,
        };

        try {
            const response = await fetch(url, options);

            if (response.ok) {
                const result = await response.text();
                console.log('성공적인 응답 데이터:', result);
                count += 1; 
            } else {
                throw new Error('서버 에러: ', response.status);
            }
        } catch (error) {
            console.error('에러 발생=> ', error.message);
        }
    }
    console.log('count: ', count)
    console.log('forms.length: ', forms.length)
    if (count == forms.length) {
        alert('매장 등록이 완료되었습니다.');
        window.location.href = cpath;
    } else {
        alert('기입 내용을 다시 확인해주세요.');
    }
};

</script>
</body>
</html>