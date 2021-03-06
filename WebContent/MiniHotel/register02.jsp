<%@page import="dao.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<meta name="author" content="hotel">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
        content="width=device-width, initial-scale=1, user-scalable=no, maximum-scale=1, minimum-scale=1">


    <!-- css 적용 : reset.css는 먼저 초기화하여야하기때문에 먼저 호출 -->
    <link rel="stylesheet" href="http://localhost:9090/login_ubin/MiniHotel/css/reset.css">
    <link rel="stylesheet" href="http://localhost:9090/login_ubin/MiniHotel/css/register.css">

<title>register.jsp</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

	$(function(){
		
		// 아이디 중복 확인
		$("#idCheck").on('click', function(){
			console.log('click');
			window.open("./idcheckForm02.do?idcheckForm02.jsp","idcheckForm02","width=400, height=300");
		}); 
		
		// 정규식 변수 선언
		var passid = false;
		var passPw = false;
		var passname = false;
		// var passbirth = false;
		var passtel = false;
		var passtel1 = false;
		var passemail = false;
		// var passnick = false;
		
		// 아이디 : A~Z, a~z, 0~9로 시작하는 4~10자리 
		// 유효한 값을 입력할 때 까지 빨간색 글짜를 유지
		var idTag = $("#id");
		idTag.on("keyup", function(){
			
			// A~Z, a~z, 0~9로 시작하는 4~10자리
			var idReg = /^[a-z0-9]{4,10}$/;
			
			if(!idReg.test(idTag.val())){
				idTag.css("color", "#EE5656");
				passid = false;
			}
			else{
				idTag.css("color", "blue");
				passid = true;
			}
		}); // idTag end
		
		// 비밀번호 : 특수문자, 영문자, 숫자의 조합으로 7자이상을 입력
		// 유효한 값을 입력할 때 까지 빨간색 글짜를 유지
		var pwTag = $("#pw");
		pwTag.on("keyup", function(){
			
			var pwReg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
			
			if(!pwReg.test(pwTag.val())){
				pwTag.css("color", "#EE5656");
				passpw = false;
			}
			else{
				pwTag.css("color", "blue");
				passpw = true;
			}
	
		}); // pwTag end
		
		// 이름 : 가~힣. 한글로 이뤄진 문자만으로 2~6자리 입력
		// 유효한 값을 입력할 때 까지 빨간색 글짜를 유지
		var nameTag = $("#name");
		nameTag.on("keyup", function(){
			
			var nameReg = /^[가-힣]{2,6}$/;
			
			if(!nameReg.test(nameTag.val())){
				nameTag.css("color", "#EE5656");
				passname = false;
			}
			else{
				nameTag.css("color", "blue");
				passname = true;
			}
	
		}); // nameTag end
		
		// 핸드폰 : 0~9. 숫자로 이뤄진 문자만으로 4자리 입력
		var telTag = $("#mp1");
		telTag.on("keyup", function(){
			
			var telReg = /^[0-9]{4}$/;
			
			if(!telReg.test(telTag.val())){
				// telTag.css("color", "#EE5656");
				passtel = false;
			}
			else{
				// telTag.css("color", "#EE5656");
				passtel = true;
			}
	
		}); // telTag end
		
		var telTag1 = $("#mp2");
		telTag1.on("keyup", function(){
			
			var telReg = /^[0-9]{4}$/;
			
			if(!telReg.test(telTag1.val())){
				// telTag1.css("color", "#EE5656");
				passtel1 = false;
			}
			else{
				// telTag1.css("color", "#EE5656");
				passtel1 = true;
			}

		
		}); // tel1Tag end
		
		// 이메일 : 이메일 형식으로 입력할 수 있게 제한
		// 유효한 값을 입력할 때 까지 빨간색 글짜를 유지
		var emailTag = $("#email");
		emailTag.on("keyup", function(){
			
			var emailReg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			
			if(!emailReg.test(emailTag.val())){
				emailTag.css("color", "#EE5656");
				passemail = false;
			}
			else{
				emailTag.css("color", "blue");
				passemail = true;
			}
	
		}); // emailTag end
		
		// 클릭하면 유효성 검사 적용
		$("#reg").on('click', function(){
			//console.log('click');
			
			// 111 아이디 중복 확인
			var form = document.userInfo;
			
			// 데이터 입력 여부 & pw 일치 여부

			if(passid==false){
				alert("아이디를 올바르게 입력해주세요.");	
				idTag.focus();		
				return false;	
			}else if(passpw==false){
				alert("비밀번호를 올바르게 입력하세요.");
				pwTag.focus();
				return false;
			}else if($("#recheck").val()==""){
				alert("비밀번호를 올바르게 입력하세요.");
				$("#recheck").focus();
				return;
			}else if(passname==false){
				alert("이름을 올바르게 입력하세요.");
				nameTag.focus();		
				return false;	
			}else if(passtel==false){
				alert("핸드폰번호를 올바르게 입력하세요.");
				telTag.focus();
				return false;
			}else if(passtel1==false){
				alert("핸드폰번호를 올바르게 입력하세요.");
				telTag1.focus();
				return false;
			}else if(passemail==false){
				alert("이메일을 올바르게 입력하세요.");
				emailTag.focus();
				return false;
			}else if($("#pw").val() != $("#recheck").val()){
				alert("비밀번호를 올바르게 입력하세요.");
				$("#recheck").focus();
				return;
			}
			
			document.frm.action = "./register02.do?registerOk011.jsp";
			document.frm.method = "post";	
			document.frm.submit();
			
		}); //reg end
		

	});

</script>

</head>
<body>

<jsp:include page="index.jsp"></jsp:include>   

	<div id="regDiv">
	
		<form name="frm" id="frm" action = './register02.do'>
		
			<h2 id="in">회원가입</h2>
			
			<div>
					<h2 id="id1">아이디</h2>
					<input type="text" name="id" id="id" 
					placeholder=" 영문 또는 숫자로 8자리 이상 입력해주세요."
					autocomplete="off" value="" onkeydown="inputIdChk()"/>
					<input type="button" value="아이디중복확인" id="idCheck" name="idCheck"/>
					<input type="hidden" name="idDuplication" value="idUncheck"/>
					
			</div>
				
			<div>
					<h2 id="pw1">비밀번호</h2>
					<input type="password" name="pw" id="pw" 
					placeholder=" 특수문자,영문자,숫자의 조합으로 8자리 이상 입력해주세요."
					/>
			</div>
				
			<div>
					<h2 class="id1">비밀번호 확인</h2>
					<input type="password" name="recheck" id="recheck" 
					placeholder=" 특수문자,영문자,숫자의 조합으로 8자리 이상 입력해주세요."
					/>
			</div>
				
			<div>
					<h2 class="id1">이름</h2>
					<input type="text" name="name" id="name" 
					placeholder=" 한글로 입력해주세요."
					autocomplete="off"/>
			</div>
								
			<div>
					<h2 class="id1">핸드폰 번호</h2>
					
						<input type="text" name="mp0" id="mp0" value="010" size="2" disabled="disabled"/>
						<input type="text" name="mp1" id="mp1" size="3" />
						<input type="text" name="mp2" id="mp2" size="3" />
					
			</div>
			
			<div>
					<!-- 시간이 남는다면 이메일 인증 API 추가 -->
					<h2 class="id1">EMAIL</h2>
					<input type="text" name="email" id="email" placeholder=" 이메일를 입력해주세요."/>
			</div>
				
				<div id="botTr">
						<!-- 추후에 post방식으로 바꿔야함 -> 지금은 확인해야하니까 submit로 넘기기 -->
						<input id="reg" class="reg" type="button" value="가입하기">
				</div>

		</form>

	</div>


</body>
</html>