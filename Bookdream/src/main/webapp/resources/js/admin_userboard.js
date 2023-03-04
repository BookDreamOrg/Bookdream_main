$(document).ready(function() {
	getVisitGraph();
})

const visit_ctx = document.getElementById('visitChart');

function getVisitGraph() {
	var visitCountList = [];

	$.ajax({
		url : "/countVisit.do",
		type : "GET",
		dataType : "JSON",
		success : function(data) {
			visitCountList = Object.values(data[0]).reverse();
			new Chart(visit_ctx,
					{
						type : 'line',
						data : {
							datasets : [ {
								label : '방문자 수',
								data : visitCountList,
								borderColor : '#a3a4cc',
								backgroundColor : '#d1d1e5',
								
							} ],
							labels : [ '월요일', '화요일', '수요일', '목요일', '금요일',
									'토요일', '일요일' ]
						},
						options : {
							responsive: false,
							scales : {
								y : {
									beginAtZero : true
								}
							}
						}
					});
		},
		error : function() {
			alert("Graph Fail");
		}
	})
}