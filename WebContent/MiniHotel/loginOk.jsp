<%@page import="vo.Member_Vo"%>
<%@page import="dao.Member_Dao"%>
<%@ page import="java.io.PrintWriter" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<meta name="viewport" content="width=device-width", initial-scale="1">
<meta charset="UTF-8">
<title>loginOk.jsp</title>
</head>
<body>
<c:choose>
	<c:when test="${result == 0 }">
		<script type="text/javascript">
				alert('비밀번호가 틀립니다.');	 history.back();
				
		</script>
	</c:when>	
	<c:when test="${result == -1 }">
		<script type="text/javascript">
		alert('존재하지 않는 아이디입니다.'); history.back();
		</script>
	</c:when>
	<c:when test="${result == -2 }">
		<script type="text/javascript">
		alert('서비스 오류가 발생했습니다. 고객센터로 연락주시면 빠른 처리 도와드리겠습니다.'); history.back();
		</script>
	</c:when>		
</c:choose>	
</body>
</html>