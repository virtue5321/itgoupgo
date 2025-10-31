<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>대시보드</title>
  
  <link rel="stylesheet" href="<c:url value="/resources/css/adminStyle.css" />">

  <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.3/dist/chart.umd.min.js"></script>

  <style>
    .kpi-card {
        background: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.05);
        border-left: 5px solid #5a5ce8; /* 메인 색상으로 강조 */
        flex: 1; /* flex item으로 공간 균등 분배 */
    }
    .kpi-card h4 {
        margin-top: 0;
        color: #666;
        font-size: 14px;
    }
    .kpi-value {
        font-size: 32px;
        font-weight: bold;
        color: #333;
        margin: 5px 0;
    }
    .kpi-detail {
        font-size: 12px;
        color: #999;
    }
    .recent-table th, .recent-table td {
        padding: 10px;
        text-align: center;
        font-size: 14px;
    }
    .recent-table th {
        background: #f7f7f7;
        font-weight: bold;
    }
    .recent-table td:first-child {
        text-align: left;
        max-width: 300px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }
    .recent-table tr:hover {
        background-color: #fafafa;
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
        <li><a href="<c:url value="/admin/dashboard" />" class="active">🏠 대시보드</a></li>
        <li><a href="<c:url value="/admin/member" />" >👥 회원 관리</a></li>
        <li><a href="<c:url value="/admin/post" />">📝 게시글 관리</a></li>
        <li><a href="<c:url value="/admin/reply" />">💬 댓글 관리</a></li>
        <li><a href="<c:url value="/admin/stats" />">📊 통계</a></li>
        <li><a href="<c:url value="/admin/logout" />">🚪 로그아웃</a></li>
      </ul>
    </aside>


    <main>
      <h1>🏠 대시보드</h1>
      <p>사이트의 전반적인 통계를 한눈에 확인할 수 있습니다.</p>

      <div style="display:flex; gap:20px; margin-top:20px;">
        
        <div class="kpi-card">
            <h4>👥 총 회원 수</h4>
            <p class="kpi-value">${totalMemberCount}</p>
            <p class="kpi-detail">활성 상태의 전체 회원</p>
        </div>
        
        <div class="kpi-card">
            <h4>⭐ 오늘 신규 회원</h4>
            <p class="kpi-value">${todayNewMemberCount}</p>
            <p class="kpi-detail">오늘 날짜 기준 신규 가입</p>
        </div>

        <div class="kpi-card">
            <h4>📝 총 게시글 수</h4>
            <p class="kpi-value">${totalPostCount}</p>
            <p class="kpi-detail">현재까지 등록된 총 게시글</p>
        </div>
        
        <div class="kpi-card">
            <h4>📈 주간 방문자 수</h4>
            <p class="kpi-value">XXX</p> <%-- 데이터가 없으므로 임시 값 --%>
            <p class="kpi-detail">통계 페이지에서 상세 확인</p>
        </div>

      </div>

      <div style="display:flex; gap:20px; margin-top:20px;">
        
        <div style="flex: 2; background:#fff; padding:20px; border-radius:10px; box-shadow:0 2px 5px rgba(0,0,0,0.05);">
            <h3>주간 활동 추이</h3>
            <canvas id="weeklyActivityChart" height="120"></canvas> 
        </div>
        
        <div style="flex: 1; background:#fff; padding:20px; border-radius:10px; box-shadow:0 2px 5px rgba(0,0,0,0.05);">
            <h3>게시판별 게시글 비율</h3>
            <canvas id="boardRatioChart" height="120"></canvas>
        </div>

      </div>

      <div style="margin-top:20px; background:#fff; padding:20px; border-radius:10px; box-shadow:0 2px 5px rgba(0,0,0,0.05);">
        <h3>최근 등록 게시글</h3>
        
        <table class="recent-table" style="width:100%; border-collapse:collapse; margin-top:10px;">
            <thead>
                <tr>
                    <th style="width: 50%; text-align:left;">제목</th>
                    <th style="width: 20%;">작성자</th>
                    <th style="width: 30%;">등록일</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${not empty recentPostList}">
                        <c:forEach var="post" items="${recentPostList}">
                            <tr style="border-bottom: 1px solid #eee;">
                                <td style="text-align:left;">
                                    <%-- 상세 페이지 링크는 /board/detail?postNo=... 식으로 가정 --%>
                                    <a href="#" style="color:#333; text-decoration:none;">${post.POST_TITLE}</a>
                                </td>
                                <td>${post.MEMBER_NAME}</td>
                                <td>${post.POST_DATE}</td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="3" style="padding:10px; text-align:center; color:#999;">최근 등록된 게시글이 없습니다.</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>

        <div style="text-align:right; margin-top:10px;">
          <a href="<c:url value="/admin/post" />" style="color:#5a5ce8; text-decoration:none;">게시글 전체 보기 &gt;</a>
        </div>
      </div>
    </main>
  </div>

  <footer>ⓒ 2025 IT GO UP GO. All Rights Reserved.</footer>
</body>
</html>