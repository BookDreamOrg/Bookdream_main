/*  */
$(function() {

})

/***************************** getElementById function *****************************/
function ById(id) {
	return document.getElementById(id);
}

/***************************** comma function *****************************/
function comma(value) {
	
	var comma = value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');

	return comma;
}

/***************************** switch case function *****************************/
function switchCase(data) {
	
	switch (data) {
	    case 10: return "결제취소요청"
	    case 12: return "반품요청"	 
	}

}

