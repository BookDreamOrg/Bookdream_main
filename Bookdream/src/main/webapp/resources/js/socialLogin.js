function onClickgoogleLogin() {
	document.location.href = "https://accounts.google.com/o/oauth2/v2/auth?scope=profile+email&response_type=code&client_id=759629996127-2168hvg19ogj7kah4thgo16a2seoc50q.apps.googleusercontent.com&redirect_uri=http://localhost:8000/auth/google/callback"
}

function onClickNaverLogin() {
	document.location.href = "https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=0328Vi7efumpXAgBjKZA&state=STATE_STRING&redirect_uri=http://localhost:8000/auth/naver/callback";
}