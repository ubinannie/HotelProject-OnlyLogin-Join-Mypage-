<%@page import="java.io.IOException"%>
<%@page import="dao.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IDCheck02.jsp</title>
</head>
<body>

<h3>아이디 중복 확인 결과 ${cnt }</h3>

	<c:choose>
		<c:when test="${cnt == 0 }">
			<h2>사용 가능한 아이디입니다.</h2>
			<a href="javascript:apply(${id })">[적용]</a>
		</c:when>
	</c:choose>
	
	<script type="text/javascript">
	function apply(id){
	
		// 중복체크 결과인 idCheck 값을 전달
		opener.document.frm.idDuplication.value =id;
		
		// 회원가입 화면의 text 입력란에 값을 자동 입력
		opener.document.frm.id.value=id;
		window.close(); //창닫기
	}
	
	</script>
	
	<c:choose>
		<c:when test="${cnt == 1 }">
			<p style='color: red'>해당 아이디는 사용하실 수 없습니다.</p>
		</c:when>
	</c:choose>
	
	
	<hr>
	<a href="javascript:history.back()">[다시시도]</a>
	&nbsp; &nbsp;
	<a href="javascript:window.close()">[창닫기]</a>

</body>
</html>