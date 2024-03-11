<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach items="${staffList}" var="s">
	${s.staff_no}
  	${s.staff_name}
  	${s.staff_tel}
  	${s.staff_tel}
  	${s.staff_email}
<%--   	${s.mem_no}
  	${s.dept_no} --%>
</c:forEach>  	
</body>
</html>