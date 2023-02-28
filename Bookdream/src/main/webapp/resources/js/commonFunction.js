/***************************** getElementById function *****************************/
function ById(id) {
	return document.getElementById(id);
}


/***************************** uncomma function *****************************/
function uncomma(value) {
	
	var comma = value.replace(/[^\d]+/g, '');
	
	return comma;	

}

/***************************** comma function *****************************/
function comma(value) {
	
	var comma = value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');

	return comma;
}


/***************************** 날짜 형식 변경 function *****************************/
function timestamp(date){
    var today = new Date(date);
    today.setHours(today.getHours() + 9);
    return today.toISOString().replace('T', ' ').substring(0, 16); //년도~분까지 표시
}


/***************************** 날짜 형식 변경(년월일시분) function *****************************/
function time(timestamp) {
	
	const date = new Date(timestamp)

	// 년월일 표시
	const year = date.getFullYear().toString().slice(-2) // 20 생략
	const month = date.getMonth() + 1 // 0부터 시작하므로 1 더하기
	const day = date.getDate()
	
	//console.log(`${year}년 ${month}월 ${day}일`)

	// 요일 표시
	const weekdays = ['일', '월', '화', '수', '목', '금', '토']
	const weekdayIndex = date.getDay()
	const weekday = weekdays[weekdayIndex]
	
	//console.log(`(${weekday})`)

	// 시분 표시
	const hours = date.getHours()
	const minutes = date.getMinutes()
	
	//console.log(`${hours}시 ${minutes}분`)
	
	return `${year}년 ${month}월 ${day}일 (${weekday}) ${hours}시 ${minutes}분`
}

/***************************** alert function *****************************/
function alert(title, text, icon) {
	
    Swal.fire({
        icon: icon,
        title: title,
        text: text
      });
}

/***************************** toast function *****************************/
function toast(text) {
	

    const Toast = Swal.mixin({
      toast: true,
      position: 'top',
      showConfirmButton: false,
      timer: 2000,
      timerProgressBar: true,
      didOpen: (toast) => {
        toast.addEventListener('mouseenter', Swal.stopTimer)
        toast.addEventListener('mouseleave', Swal.resumeTimer)
      }
    })

    Toast.fire({
      icon: 'success',
      iconColor: '#4BC0C0',      
      title: text
    })
 
 }

/***************************** confirmed function *****************************/
function confirmed(title, text, icon, msg, confirmFunction) {
	
	 Swal.fire({
	      title: title,
	      text: text,
	      icon: icon,
	      showCancelButton: true,
	      confirmButtonColor: '#36A2EB',
	      cancelButtonColor: '#FF6384',
	      confirmButtonText: '확인',
	      cancelButtonText: '취소',
	      reverseButtons: true, // 버튼 순서 거꾸로
	      
	  }).then((result) => {
		    if (result.isConfirmed) {
		    	
		      Swal.fire({
		        title: '',
		        text: msg,
		        icon: 'success',
			    confirmButtonColor: '#36A2EB',		        
		        timer: 2000, // 확인 버튼을 누르면 타이머가 작동
		        timerProgressBar: true, // 타이머 프로그래스바 활성화
		        
		      }).then(() => {
		        if (confirmFunction) {
		          confirmFunction();
		        }
		      })
		    }
		  })
}

