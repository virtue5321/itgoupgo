<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>로그아웃</title>
  <link rel="stylesheet" href="<c:url value="/resources/css/adminStyle.css" />">
</head>
<body style="text-align:center; padding:100px;">
  <h1>🚪 로그아웃되었습니다.</h1>
  <p>이용해주셔서 감사합니다.</p>
  <a href="<c:url value="/admin/dashboard" />" style="display:inline-block; margin-top:20px; padding:10px 20px; background:#5a5ce8; color:#fff; border-radius:5px; text-decoration:none;">메인으로 돌아가기</a>
</body>
</html>