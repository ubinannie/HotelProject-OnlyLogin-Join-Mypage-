<%@page import="vo.Member_Vo"%>
<%@page import="dao.Member_Dao"%>
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
    <link rel="stylesheet" href="http://localhost:9090/login_ubin/MiniHotel/css/mypage.css">
    
<title>myPage02.jsp</title>
</head>
<body>

<jsp:useBean id="minihotel" class="vo.Member_Vo" scope="page"/>
<jsp:setProperty property="*" name="minihotel"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

	$(function(){
		
		var passPw = false;
		var passtel = false;
		var passtel1 = false;
		var passname = false;
		
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
		
	
		// 수정 버튼 누르면 mypageOk.jsp 이동해서 DB와 연동함
		$("#reg").on('click', function(){
			
			// 정규식 적용
			if(passpw==false){
				alert("비밀번호를 올바르게 입력하세요.");
				pwTag.focus();
				return false;
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
			}
			
			document.frm.action = "./myPageAdmin.do?mypageOk02.jsp";
			document.frm.method = "post";	
			document.frm.submit();
		}); // reg end
		
	});

</script>
	
   <header>
   
   <jsp:include page="registerOk02.jsp"></jsp:include>  

       <div class="view">내정보</div>
      
   </header>
        
        <!-- 여기서부터 내 정보관리하는 곳 -->

	 <!-- content -->
        <div class="container">
            <div class="leftsidebar">
                <ul>
                    <li><a href="#">내 정보 관리</a></li>
                    <li><a href="">예약내역</a></li>
                </ul>
            </div>
            <br>
            <div class="notice">내 정보 수정</div>
            <br> 
            <br>
            <hr>
             <br>
              <br>
         </div>
          
         <form name="frm" id="frm" action = 'myPageAdmin.do' method="post"> 
          
         <div class="id1">
 
			<div>
					<h2 id="id1">아이디</h2>
					<input type="text" name="id" id="id" placeholder="${admin.ad_id }"
					autocomplete="off" value="" readonly="readonly"/>
			</div>
 
  
            <div>
					<h2 id="pw1">비밀번호</h2>
					<input type="password" name="pw" id="pw" 
					placeholder=" 특수문자,영문자,숫자의 조합으로 8자리 이상 입력해주세요."
					/>
			</div>
				
			<div>
					<h2 id="pw1">핸드폰 번호</h2>
					
						<input type="text" name="mp0" id="mp0" value="010" size="2" disabled="disabled"/>
						<input type="text" name="mp1" id="mp1" size="3" />
						<input type="text" name="mp2" id="mp2" size="3" />
					
			</div>    
			
			<div>
					<h2 id="id1">이름</h2>
					<input type="text" name="name" id="name" 
					placeholder=" 한글로 입력해주세요."
					autocomplete="off"/>
			</div>
			
			<div id="botTr">
						<!-- 추후에 post방식으로 바꿔야함 -> 지금은 확인해야하니까 submit로 넘기기 -->
						<input id="reg" class="reg" type="button" value="수정">
			</div>
                   
	</div>
	
	</form>

</body>
</html>









