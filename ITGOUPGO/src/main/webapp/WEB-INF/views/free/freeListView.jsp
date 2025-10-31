<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 목록</title>
<style>
/* ---------------------------------------------------- */
/* 1. Sticky Footer 및 좌우 공백 확보를 위한 기본 구조 설정 */
/* ---------------------------------------------------- */
html, body {
  height: 100%;
  min-height: 100vh;
}

/* body를 flex container로 설정하여 하위 요소들을 수직으로 배치 */
body {
  display: flex;
  flex-direction: column;
    background: #f7f8fa; /* 배경색 추가 */
}

/* 메인 컨텐츠 영역이 남은 공간을 모두 차지하도록 flex-grow: 1 설정 */
/* 푸터를 하단에 고정하는 핵심 역할 */
.main-content {
  flex: 1; /* 남은 공간을 모두 차지 */
  max-width: 1200px;
  width: 100%;
  margin: 0 auto;
  padding-left: 32px;
  padding-right: 32px;
}

/* 요청 1: 사이드바 영역 확보 (가로 여백) */
/* main-wrapper 클래스를 추가하여 전체 콘텐츠를 감싸고 좌우 여백을 줌 */
.main-wrapper {
  /* 뷰포트 너비의 10%를 좌우 마진으로 설정 (사이드바 공간 흉내) */
  margin: 0 10vw; 
  min-height: 100%; /* 부모(body)의 높이를 따라가도록 설정 */
  display: flex; /* 내부 요소 수직 배치를 위해 다시 flex 설정 */
  flex-direction: column;
}


/* ---------------------------------------------------- */
/* 2. 게시판 목록 스타일 (기존 코드 유지 및 정리) */
/* ---------------------------------------------------- */
.board-list-container {
  width: 100%;
  max-width: 1100px;
  margin: 48px auto 30px auto;
  background: #fff;
  border-radius: 24px;
  box-shadow: 0 1.5px 16px 2px #eaeaee33;
  padding: 50px 36px 32px 36px;
}
.table-board-list {
  width: 100%;
  border-collapse: separate;
  border-spacing: 0 16px;
}
.table-board-list th, .table-board-list td {
  padding: 16px 18px;
  text-align: center;
  border: none;
  font-size: 1.01rem;
}
.table-board-list th {
  background: #f2effc;
  font-weight: 700;
  color: #856fe5;
  border-radius: 16px 16px 0 0;
  font-size: 1.10rem;
}
.table-board-list tbody tr {
  background: #f9faff;
  border-radius: 14px;
  box-shadow: 0 1px 5px #e6e1f880;
  transition: background 0.2s;
}
.table-board-list tbody tr:hover {
  background: #edeaff;
}
.table-board-list td.title-col {
  min-width: 260px;
  max-width: 430px;
  text-align: left;
  font-weight: 500;
  color: #312b53;
  font-size: 1.08rem;
  word-break: keep-all;
  white-space: normal;
}
.badge-category {
  background: #ecf2ff;
  color: #6d71a7;
  padding: 5px 18px;
  border-radius: 16px;
  font-size: 0.99em;
}

/* 페이징 영역 스타일 추가 */
.paging-area {
  margin-top: 30px;
  text-align: center;
  padding: 10px 0;
}
.paging-area a {
  display: inline-block;
  padding: 8px 12px;
  margin: 0 4px;
  border-radius: 8px;
  text-decoration: none;
  color: #444;
  border: 1px solid #ddd;
  transition: background-color 0.2s, color 0.2s;
}
.paging-area a:hover:not(.active):not(.disabled) {
  background-color: #f2f2f2;
}
.paging-area a.active {
  background-color: #856fe5;
  color: white;
  border-color: #856fe5;
  font-weight: bold;
}
.paging-area a.disabled {
  color: #bbb;
  pointer-events: none;
  background-color: #f9f9f9;
  border-color: #eee;
}

/* ⭐ 검색 영역 스타일 추가/수정 ⭐ */
.search-area {
    display: flex; /* 가로 배치 */
    justify-content: center; /* 가운데 정렬 */
    gap: 10px; /* 요소 간 간격 */
    margin-bottom: 25px;
    padding-top: 10px;
}
.search-area select, .search-area input[type="text"] {
    padding: 8px 12px;
    border: 1px solid #dde3ec;
    border-radius: 12px;
    font-size: 1rem;
}
.search-area select {
    background: #fcfcff;
    width: 120px;
    cursor: pointer;
}
.search-area input[type="text"] {
    width: 300px;
}
.search-area button {
    background: #856fe5;
    color: #fff;
    border: none;
    border-radius: 12px;
    padding: 8px 18px;
    font-size: 1rem;
    font-weight: 600;
    cursor: pointer;
    transition: background 0.2s;
}
.search-area button:hover {
    background: #6b5dd0;
}

@media (max-width: 1400px) {
  /* 화면이 1400px 미만일 때는 좌우 마진을 줄여 콘텐츠가 너무 작아지지 않게 조정 */
  .main-wrapper {
    margin: 0 5vw;
  }
}
@media (max-width: 900px) {
  .board-list-container {
    padding: 18px 4px 8px 4px;
  }
  .main-content {
    padding-left: 8px;
    padding-right: 8px;
  }
  .table-board-list th, .table-board-list td {
    padding: 12px 4px;
  }
  /* 모바일 환경에서는 좌우 마진 제거 */
  .main-wrapper {
    margin: 0; 
  }
    /* 모바일 환경에서 검색 영역 수직 배치 */
    .search-area {
        flex-direction: column;
        align-items: center;
    }
    .search-area select, .search-area input[type="text"], .search-area button {
        width: 100%; /* 너비를 꽉 채움 */
        max-width: 350px; /* 최대 너비 제한 */
    }
    .search-area button {
        margin-top: 5px;
    }
}
</style>
</head>
<body>
    <c:import url="../common/menubar.jsp"/>


  <div class="main-wrapper"> 
    <div class="main-content">
      <div class="board-list-container">
        <h2 class="text-center mb-4 fw-bold">자유게시판</h2>
  
                <div class="search-area">
                    <form action="search" method="get">
                        
                        <select name="condition">
                            <option value="title" 
                                <c:if test="${condition eq 'title'}">selected</c:if>>제목</option>
                            <option value="content"
                                <c:if test="${condition eq 'content'}">selected</c:if>>내용</option>
                            <option value="writer"
                                <c:if test="${condition eq 'writer'}">selected</c:if>>작성자</option>
                        </select>
                        
                        <input type="text" name="keyword" placeholder="검색어를 입력해주세요" value="${keyword}">
                        
                        <button type="submit">검색</button>
                    </form>
                </div>
                                <div style="text-align: right; margin-bottom: 10px;">
          <c:if test="${empty sessionScope.loginUser}">
            <button onclick="location.href='enrollForm';" class="btn btn-primary">글쓰기</button>
          </c:if>
        </div>
  
        <table class="table-board-list">
          <thead>
            <tr>
              <th>글번호</th>
              <th>카테고리</th>
              <th>제목</th>
              <th>작성자</th>
              <th>작성일</th>
              <th>조회수</th>
            </tr>
          </thead>
          <tbody>
            <c:choose>
              <c:when test="${empty list}">
                <tr><td colspan="6" style="text-align:center;">조회된 게시글이 없습니다.</td></tr>
              </c:when>
              <c:otherwise>
                <c:forEach var="b" items="${list}">
                  <tr>
                    <td>${b.freeNo}</td>
                     <td><span class="badge-category">${b.categoryName}</span></td>
                    <td class="title-col">
                      <a href="detail/${b.freeNo}" class="text-decoration-none" style="color:inherit;">${b.freeTitle}</a>
                    </td>
                    <td>${b.writerId}</td>
                    <td><fmt:formatDate value="${b.freeCreateDate}" pattern="yyyy-MM-dd"/></td>
                    <td>${b.freeView}</td>
                  </tr>
                </c:forEach>
              </c:otherwise>
            </c:choose>
          </tbody>
        </table>
  
        <div class="paging-area">
                    <c:url var="basePath" value="${empty condition ? 'list' : 'search'}"/>
                    
                    <c:set var="params" value=""/>
                    <c:if test="${!empty condition}">
                        <c:set var="params" value="&condition=${condition}&keyword=${keyword}"/>
                    </c:if>

                    <a href="${basePath}?cpage=1${params}" class="${pi.currentPage eq 1 ? 'disabled' : ''}"><<</a>
        
                    <c:set var="prevPage" value="${pi.currentPage - 1 < 1 ? 1 : pi.currentPage - 1}"/>
                    <a href="${basePath}?cpage=${prevPage}${params}" class="${pi.currentPage eq 1 ? 'disabled' : ''}"><</a>
                    
                    <c:forEach begin="${pi.startPage}" end="${pi.endPage}" var="p">
                        <a href="${basePath}?cpage=${p}${params}" class="${p eq pi.currentPage ? 'active' : ''}">${p}</a>
                    </c:forEach>
        
                    <c:set var="nextPage" value="${pi.currentPage + 1 > pi.maxPage ? pi.maxPage : pi.currentPage + 1}"/>
                    <a href="${basePath}?cpage=${nextPage}${params}" class="${pi.currentPage eq pi.maxPage ? 'disabled' : ''}">></a>
                    
                    <a href="${basePath}?cpage=${pi.maxPage}${params}" class="${pi.currentPage eq pi.maxPage ? 'disabled' : ''}">>></a>
                </div>
      </div>
    </div>
  </div>     <c:import url="../common/footer.jsp"/>
    
    <script>
        // 로그인 체크 후 글쓰기 버튼 동작
        document.querySelector('.btn-primary')?.addEventListener('click', function(e) {
            <c:if test="${empty sessionScope.loginUser}">
                e.preventDefault();
                alert('로그인 후 이용 가능합니다.');
                // 실제 로그인 페이지로 이동하는 로직을 추가할 수 있습니다.
                // location.href = '${pageContext.request.contextPath}/member/loginForm';
            </c:if>
        });
    </script>
</body>
</html>