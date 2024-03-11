<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${result == 1}">
	<script>
		alert("회원정보가 존재하지 않습니다.");
		location.href="/loginForm";
	</script>
</c:if>

<c:if test="${result == 2}">
	<script>
		alert("회원정보가 일치하지 않습니다.");
		location.href="/loginForm";
	</script>
</c:if>