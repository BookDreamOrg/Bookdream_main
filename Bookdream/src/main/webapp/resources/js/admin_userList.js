const urlParams = new URL(location.href).searchParams;
		const num = urlParams.get('num');
		const prevNum = parseInt(num) - 1;
		const nextNum = parseInt(num) + 1;
		const listUrl = "userListPage.do?num=";
		const page = document.getElementsByClassName('page-link');
		const SearchUserKeyword = $('#SearchUserKeyword').val();
		
		$(function() {

			for (var i = 1; i < page.length - 1; i++) {
				if (page[i].innerText === num) {
					page[i].parentNode.classList.add('active');
				}
			}
			;

			if (num == 1) {
				page[0].parentNode.classList.add("disabled");
			} else if(num == (page.length - 2)) {
				page[page.length-1].parentNode.classList.add("disabled");
			};

			$('#getUserModal').on('show.bs.modal',function(event) {
								const btn = $(event.relatedTarget);
								const getUserNo = parseInt(btn[0].parentNode.parentNode.childNodes[1].innerText);
								$.ajax({
									url : "/admin/user/getUserByNo.do",
									type : "POST",
									data : {
										user_no : getUserNo
									},
									success : function(data) {
										console.log(data);
										$('#getUSerByNoTitle').html(
												data.user_name);
										$('#getUSerByNoNo').html(data.user_no);
										$('#getUSerByNoName').html(
												data.user_name);
										$('#getUSerByNoTel')
												.html(data.user_tel);
										$('#getUSerByNoEmail').html(
												data.user_email);
										$('#getUSerByNoPoint').html(
												data.user_point);
										$('#getUSerByNoLevel').html(
												data.user_level);
										$('#getUSerByNoBlack').html(
												data.blacklist_yn);
										$('#getUSerByNoType').html(
												data.flatform_type);
									},
									error : function() {
										alert("error");
									}
								})
							});
			$('#blackListChange').click(function(event) {
				const val = $('#getUSerByNoNo');
				const blackNum = parseInt(val[0].innerText);
				$.ajax({
					url : "/admin/user/blackList.do",
					type : "POST",
					data : {
						user_no : blackNum
					},
					success : function(data) {
						alert("블랙리스트 수정 성공!");
						window.location.reload();
					},
					error : function() {
						alert("error");
					}
				})
			})
		});

		function prev() {
			if(SearchUserKeyword === null){
				window.location = listUrl + prevNum;	
			} else{
				window.location = listUrl + prevNum + "&SearchUserKeyword=" + SearchUserKeyword;
			}
		};
		function next() {
			if(SearchUserKeyword == null){
				window.location = listUrl + nextNum;
			} else{
				window.location = listUrl + nextNum + "&SearchUserKeyword=" + SearchUserKeyword;
			}
		};

		
		//유저검색
		function searchUser(){
			var searchUserKeyword = $('#searchUserKeyword').val();
			var user_select = $('select[name=user_select] > option:selected').val();
			console.log('search함수: '+searchUserKeyword);
			console.log('search함수: '+user_select);
			
			location.href="/admin/user/userListPage.do?num=1"+"&searchUserKeyword=" + searchUserKeyword +"&searchUserType="+user_select;
		}
		
//		 $("input[type=search]").keypress(function (evt) {
//
//		        if (evt.keyCode == 13)
//		        	searchUser();
//		 });
		 function show_name(e){
			 var searchUserKeyword = $('#searchUserKeyword').val();
				var user_select = $('select[name=user_select] > option:selected').val();
	           if(e.keyCode == 13){
	        	   return false;
	           }
	        }
		