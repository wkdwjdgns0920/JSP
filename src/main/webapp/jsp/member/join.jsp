<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<div>
		<a href="../home/main">메인페이지로 이동</a>
	</div>

	<h1>회원가입</h1>
	
	<script type="text/javascript">
		
		var JoinForm__sumitDone = false;
		function JoinForm__submit(form) {
			
			if(JoinForm__sumitDone){
				alert('처리중입니다');
				return;
			}
			
			var loginId = form.loginId.value.trim();
			var loginPw = form.loginPw.value.trim();
			var loginPwConfirm = form.loginPwConfirm.value.trim();
			var name = form.name.value.trim();
			
			if(loginId == 0) {
				alert('아이디를 입력해주세요');
				form.loginId.focus();
				return;
			}
			if(loginPw == 0) {
				alert('비밀번호를 입력해주세요');
				form.loginPw.focus();
				return;
			}
			if(loginPwConfirm == 0) {
				alert('비밀번호확인을 입력해주세요');
				form.loginPwConfirm.focus();
				return;
			}
			if(loginPw != loginPwConfirm){
				alert('비밀번호가 일치하지 않습니다');
				form.loginPw.focus();
				return;
			}
			
			if(name == 0) {
				alert('이름을 입력해주세요');
				form.name.focus();
				return;
			}
			JoinForm__sumitDone = true;
			form.submit();
		}
	</script>
	
	
	<form method="post" action="http://localhost:8081/2023_04_JSP_AM/member/doJoin" onsubmit="JoinForm__submit(this); return false;">
		<div>
			로그인 아이디 : <input autocomplete="off" type="text" placeholder="아이디를 입력해주세요" name="loginId" />
		</div>
		<div>
			로그인 비밀번호 : <input type="text" placeholder="비밀번호를 입력해주세요" name="loginPw"></input>
		</div>
		<div>
			로그인 비밀번호확인 : <input type="text" placeholder="비밀번호를 입력해주세요" name="loginPwConfirm"></input>
		</div>
		<div>
			이름 : <input type="text" placeholder="이름을 입력해주세요" name="name"></input>
		</div>
		
		
		<button type="submit">회원가입</button>

	</form>




</body>
</html>