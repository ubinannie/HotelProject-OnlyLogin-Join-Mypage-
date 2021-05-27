<%@page import="dao.AdminDAO"%>
<%@page import="vo.AdminVO"%>
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
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/main.css">
    
<title>registerOk011.jsp</title>
</head>
<body>
<jsp:useBean id="minihotel" class="vo.AdminVO" scope="page"/>
<jsp:setProperty property="*" name="minihotel"/>

	<script type="text/javascript">
	
		alert("회원가입에 성공하셨습니다. 로그인 후 사용 부탁드립니다.");
		location.href="loginadmin.do";
	
	</script>
	
	