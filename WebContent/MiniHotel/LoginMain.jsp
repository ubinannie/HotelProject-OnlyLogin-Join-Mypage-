<%@page import="vo.Member_Vo"%>
<%@page import="dao.Member_Dao"%>
<%@ page import="java.io.PrintWriter" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<meta http-equiv="Content-Type"> 

	<meta name="author" content="hotel">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
        content="width=device-width, initial-scale=1, user-scalable=no, maximum-scale=1, minimum-scale=1">


    <!-- css 적용 : reset.css는 먼저 초기화하여야하기때문에 먼저 호출 -->
    <link rel="stylesheet" href="http://localhost:9090/login_ubin/MiniHotel/css/reset.css">
    <link rel="stylesheet" href="http://localhost:9090/login_ubin/MiniHotel/css/LoginMain.css">

<title>LoginMain.jsp</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

	$(function(){
		
		// id 설정값으로 '회원가입 text'를 클릭하면 넘어갈 수 있는 로직
		$("#reg").on('click', function(){
			location.href = "./register.do?register.jsp";
		});	// reg end	
		
	});
		

</script>
</head>
<body>

    <jsp:include page="index.jsp"></jsp:include>    
    <!-- 로그인 클릭시 변환하는 화면  -->
    
    <br/>
    <br>
    
    <!-- 카카오톡 로그인 API 추가 -->
    <div class="loginmain">

	    <h2  id="regtext">로그인</h2>

	    <form id="login" name="login" action="./login.do" method="post">
	    
	          <input id="id" name="id" type="text" placeholder=" 아이디를 입력해주세요.">
	          <br/><br/>
	          <input id="pw" name="pw" type="password" placeholder=" 비밀번호를 입력해주세요.">
	          <br/><br/>
	          <div class="login02">
	          	<input type="submit" value="로그인" id="loginnext"/>
	          </div>
	          
	          <br/>
	          <hr/>
	          <div class="login01">
	          	<h2 id="reg">회원가입</h2><h2 id="reg2">회원가입 (관리자)</h2>
	          </div>
	         
	          
	    </form>
	    
    </div>
    
     
</body>
</html>



