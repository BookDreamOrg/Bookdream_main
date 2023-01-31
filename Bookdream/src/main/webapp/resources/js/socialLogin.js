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

function naverLogin() {
//	let naverurl = "https://nid.naver.com/oauth2.0/authorize?";
//	let naverresponse_type = "code";
//	let naverclient_id = "0328Vi7efumpXAgBjKZA";
//	let naverstate = "STATE_STRING";
//	let nvaerredirect_uri = "http://localhost:8000/auth/naver/callback";
//	
//	let naverUrl = naverurl + 
//					"response_type=" + naverresponse_type + 
//					"&client_id=" + naverclient_id
//					"&state=" + naverstate + 
//					"&redirect_uri=" + naverredirect_uri;
//	console.log(naverUrl);
	document.location.href = "https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=0328Vi7efumpXAgBjKZA&state=STATE_STRING&redirect_uri=http://localhost:8000/auth/naver/callback";
// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=0328Vi7efumpXAgBjKZA&state=STATE_STRING&redirect_uri=http://localhost:8000/auth/naver/callback"
}

function googleLogin() {
//	console.log("googleLogin");
//	let googleurl = "https://accounts.google.com/o/oauth2/v2/auth?";
//	let googlescpoe = "profile+email"
//	let googleresponse_type = "code";
//	let googleclient_id = "759629996127-2168hvg19ogj7kah4thgo16a2seoc50q.apps.googleusercontent.com";
//	let googleredirect_uri = "http://localhost:8000/auth/google/callback";
//	
//	let googleUrl = googleurl + 
//					"scope=" + googlescope +
//					"&response_type=" + googleresponse_type + 
//					"&client_id=" + googleclient_id + 
//					"&redirect_uri=" + googleredirect_uri;
	
	document.location.href = "https://accounts.google.com/o/oauth2/v2/auth?scope=profile+email&response_type=code&client_id=759629996127-2168hvg19ogj7kah4thgo16a2seoc50q.apps.googleusercontent.com&redirect_uri=http://localhost:8000/auth/google/callback";
// https://accounts.google.com/o/oauth2/v2/auth?scope=profile+email&response_type=code&client_id=759629996127-2168hvg19ogj7kah4thgo16a2seoc50q.apps.googleusercontent.com&redirect_uri=http://localhost:8000/auth/google/callback"	
}