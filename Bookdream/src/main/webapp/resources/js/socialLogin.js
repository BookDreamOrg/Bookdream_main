function kakaoLogin(){
	var url = "https://kauth.kakao.com/oauth/authorize?";
	var client_id = "47ad839005d8b9a94d3007b30a956894";
	var redirect_uri = "http://localhost:8000/views/user/kakaoLogin";
		
	var kakaoUrl = url + 
				  "client_id=" + client_id + 
				  "&redirect_uri=" + redirect_uri + 
				  "&response_type=code";
	document.location.href = kakaoUrl;
	
//	"https://kauth.kakao.com/oauth/authorize?client_id=47ad839005d8b9a94d3007b30a956894&redirect_uri=http://localhost:8000/views/user/kakaoLogin&response_type=code"

}