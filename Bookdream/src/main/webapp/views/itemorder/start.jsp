<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스트페이지</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_orange.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>

</head>
<body>

<div class="col-6">
    <label class="form-label" for="birth">학생 생년월일</label>
    <input class="form-control" id="birth" pattern="\d{4}-\d{2}-\d{2}" placeholder=""
           required th:field="*{birth}" type="text" value="">
    <div class="invalid-feedback">
        학생 생년월일을 입력해주세요.(예시 2021-01-01)
    </div>
</div>

<script type="text/javascript">


	var fp = flatpickr(document.getElementById("birth"), {
		'monthSelectorType' : 'static',
		"locale": "ko" 
	
	});
	fp.setDate();


</script>

</body>
</html>


