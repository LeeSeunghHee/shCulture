'use strict';

let date = new Date();
let selectedDate = null;  // 전역 변수로 selectedDate를 선언합니다.

const renderCalender = () => {
    const viewYear = date.getFullYear();
    const viewMonth = date.getMonth();
    
    document.querySelector('.mgYearMonth').textContent = `${viewYear}년 ${viewMonth + 1}월`;
    
    const prevLast = new Date(viewYear, viewMonth, 0);
    const thisLast = new Date(viewYear, viewMonth + 1, 0);

    const PLDate = prevLast.getDate();
    const PLDay = prevLast.getDay();

    const TLDate = thisLast.getDate();
    const TLDay = thisLast.getDay();

    const prevDates = [];
    const thisDates = [...Array(TLDate + 1).keys()].slice(1);
    const nextDates = [];

    if (PLDay !== 6) {
        for (let i = 0; i < PLDay + 1; i++) {
            prevDates.unshift(PLDate - i);
        }
    }

    for (let i = 1; i < 7 - TLDay; i++) {
        nextDates.push(i);
    }

    const dates = prevDates.concat(thisDates, nextDates);
    const firstDateIndex = dates.indexOf(1);
    const lastDateIndex = dates.lastIndexOf(TLDate);
    
    dates.forEach((date, i) => {
        const condition = i >= firstDateIndex && i < lastDateIndex + 1
                          ? 'mgthis'
                          : 'mgother';
        dates[i] = `<div class="mgdate" onclick="selectReserList(event, ${viewYear}, ${viewMonth}, ${date})"><span class=${condition}>${date}</span></div>`;
    });

    document.querySelector('.mgdates').innerHTML = dates.join('');

    const today = new Date();
    if (viewMonth === today.getMonth() && viewYear === today.getFullYear()) {
        for (let date of document.querySelectorAll('.mgthis')) {
            if (+date.innerText === today.getDate()) {
                date.classList.add('mgtoday');
                break;
            }
        }
    }

    // 선택된 날짜 강조
    if (selectedDate && selectedDate.getFullYear() === viewYear && selectedDate.getMonth() === viewMonth) {
        for (let date of document.querySelectorAll('.mgthis')) {
            if (+date.innerText === selectedDate.getDate()) {
                date.classList.add('mgselected');
                break;
            }
        }
    }
};

const selectReserList = async (e, year, month, day) => {
    // 새로운 날짜 선택 기능
    selectedDate = new Date(year, month, day);
    date = new Date(year, month, 1); // 선택된 날짜의 달로 이동

    const selectedDateString = `${year}-${month + 1}-${day}`;
    const currentUrl = new URL(window.location.href);
    const params = new URLSearchParams(currentUrl.search);

    // 기존 selectDate 값을 새로운 selectedDate 값으로 대체
    params.set('selectDate', selectedDateString);

    // URL을 업데이트
    const updatedUrl = `${currentUrl.pathname}?${params.toString()}`;
    window.history.replaceState({}, '', updatedUrl);

    renderCalender();

    // 예약 리스트를 가져오는 비동기 함수 호출
    try {
        await dayReser(params.get('rest'), selectedDateString);
    } catch (error) {
        console.error(error);
    }
};

const prevMonth = () => {
    date.setMonth(date.getMonth() - 1);
    renderCalender();
};

const nextMonth = () => {
    date.setMonth(date.getMonth() + 1);
    renderCalender();
};

const goToday = () => {
    date = new Date();
    renderCalender();
};

// 페이지 로드 시 URL에서 선택된 날짜를 읽어오는 기능
window.addEventListener('load', () => {
    const params = new URLSearchParams(window.location.search);
    const selectedDateParam = params.get('selectDate');
    
    if (selectedDateParam) {
        const [year, month, day] = selectedDateParam.split('-').map(Number);
        selectedDate = new Date(year, month - 1, day);
        date = new Date(year, month - 1, 1);
    }

    renderCalender();
});
