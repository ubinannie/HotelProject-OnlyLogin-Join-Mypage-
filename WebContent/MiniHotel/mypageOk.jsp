<%@page import="java.io.PrintWriter"%>
<%@page import="vo.Member_Vo"%>
<%@page import="dao.Member_Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypageOk.jsp</title>
</head>
<body>

<c:choose>
	<c:when test="${result == 1 }">
		<script type="text/javascript">
			alert('수정완료 했습니다. 내 정보 관리 페이지로 돌아갑니다.');	 history.back();
		</script>
	</c:when>
	<c:when test="${result == -1 }">
		<script type="text/javascript">
			alert('정보수정에 실패하였습니다. 정보를 확인해주세요.');	 history.back();
		</script>
	</c:when>
</c:choose>

</body>
</html>




