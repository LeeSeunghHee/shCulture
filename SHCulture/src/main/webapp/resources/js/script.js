'use strict';

function locationList() {
    let url = 'https://apis.data.go.kr/6260000/FoodService/getFoodKr'    
    const params = {
        serviceKey: 'bBtMLGokMBG1tFycSHwRbAAJcqnjMJ%2FBtIUrbUPWsY7XPFKZhnbwkmz2yRmCn3jEIBcadxnmotycWG%2FjbRDelw%3D%3D',
        pageNo: 1,
        numOfRows: 50,
        resultType: 'json',
    }
    url += '?'
    for(let key in params) {
        url += key + '=' + params[key] + '&'
    }
    console.log(url.substring(0, url.length-1))
	
    fetch(url)
    .then(resp => resp.json())
    .then(json => {
      let arr = json.getFoodKr.item.map(ob => {
        const ret = {
          gugun_nm: ob.GUGUN_NM
        };
        return ret;
      });

      console.log(arr);
      let arr1 = Array.from(new Set(arr.map(ob => ob.gugun_nm)));

      console.log(arr1);

      let tag = "";
      arr1.forEach(ob => {
        tag += `<p><input type="checkbox" value="{ob}" id="gugunes">`;
        tag += ` <label for="gugunes"></label>${ob}</p>`;
      });

      // 해당 ID를 가진 요소를 선택하고 내용을 변경합니다.
      let gugunListElement = document.getElementById('detailsList');
      if (gugunListElement) {
        gugunListElement.innerHTML = tag;
      } else {
        console.error("Element with id 'gugunLs' not found.");
      }
    });
};



