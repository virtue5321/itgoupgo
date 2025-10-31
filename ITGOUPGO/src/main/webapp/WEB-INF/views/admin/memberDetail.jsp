<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>회원 상세 정보 - ${member.memberId}</title>
  <link rel="stylesheet" href="<c:url value="/resources/css/adminStyle.css" />">
  <style>
    /* 기존 스타일 유지 */
    .detail-table th, .detail-table td {
        padding: 12px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    .detail-table th {
        width: 150px;
        background-color: #f7f7f7;
    }
    .detail-container {
        max-width: 800px;
        margin: 20px auto;
        padding: 20px;
        background: #fff;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    .back-btn {
        margin-top: 20px;
        background: #6c757d;
        color: white;
        border: none;
        padding: 10px 15px;
        border-radius: 4px;
        cursor: pointer;
    }
  </style>
</head>
<body>
  
  <header>
    <div class="logo">
      <img src="<c:url value="/resources/images/logo1.PNG" />" width="80">
      관리자 페이지
    </div>
  </header>
  
  <div class="layout">
    <aside class="sidebar">
      <ul>
        <li><a href="<c:url value="/admin/dashboard" />">🏠 대시보드</a></li>
        <li><a href="<c:url value="/admin/member" />" class="active">👥 회원 관리</a></li>
        <li><a href="<c:url value="/admin/post" />">📝 게시글 관리</a></li>
        <li><a href="<c:url value="/admin/reply" />">💬 댓글 관리</a></li>
        <li><a href="<c:url value="/admin/stats" />">📊 통계</a></li>
        <li><a href="<c:url value="/admin/logout" />">🚪 로그아웃</a></li>
      </ul>
    </aside>

    <main>
      <h1>👥 회원 상세 정보</h1>
      <p>${member.memberId} 님의 상세 정보를 확인합니다.</p>
      
      <div class="detail-container">
        
        <table class="detail-table" style="width:100%; border-collapse: collapse;">
          <tr>
            <th>회원 번호 (PK)</th>
            <td>${member.memberNo}</td>
          </tr>
          <tr>
            <th>아이디</th>
            <td>${member.memberId}</td>
          </tr>
          <tr>
            <th>비밀번호</th>
            <td>(보안상 미표시)</td>
          </tr>
          <tr>
            <th>이름</th>
            <td>${member.memberName}</td>
          </tr>
          <tr>
            <th>닉네임</th>
            <td>${member.memberNick}</td>
          </tr>
          <tr>
            <th>생년월일</th>
            <%-- 🔴 [수정] 정상화된 이름 memberBirthDate 사용 --%>
            <td><fmt:formatDate value="${member.memberBirthDate}" pattern="yyyy년 MM월 dd일" /></td>
          </tr>
          <tr>
            <th>성별</th>
            <td>${member.gender eq 'M' ? '남성' : (member.gender eq 'F' ? '여성' : '-')}</td>
          </tr>
          <tr>
            <th>이메일</th>
            <td>${member.email}</td>
          </tr>
          <tr>
            <th>전화번호</th>
            <td>${member.phone}</td>
          </tr>
          <tr>
            <th>가입일</th>
            <td><fmt:formatDate value="${member.enrollDate}" pattern="yyyy년 MM월 dd일 HH:mm" /></td>
          </tr>
          <tr>
            <th>계정 상태</th>
            <td>
                <c:choose>
                    <c:when test="${member.memberStatus eq 'Y'}"><span style="color: green; font-weight: bold;">[활성]</span></c:when>
                    <c:otherwise><span style="color: red; font-weight: bold;">[탈퇴/정지]</span></c:otherwise>
                </c:choose>
            </td>
          </tr>
        </table>
        
        <button class="back-btn" onclick="history.back();">목록으로 돌아가기</button>
        
        <c:if test="${member.memberStatus eq 'Y'}">
            <button class="btn btn-danger" 
                    onclick="if(confirm('${member.memberName} 님을 정말 탈퇴시키겠습니까?')) { 
                        location.href='<c:url value="/admin/delete?memberId=${member.memberId}" />'; 
                    }">
              단일 탈퇴 처리
            </button>
        </c:if>

      </div>
    </main>
  </div>
  <footer>ⓒ 2025 IT GO UP GO. All Rights Reserved.</footer>
</body>
</html>