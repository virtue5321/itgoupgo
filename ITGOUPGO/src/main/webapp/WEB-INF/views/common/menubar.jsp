<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
:root {
  /* 라이트 모드 */
  --bg-color: #F2F2F2;
  --text-color: #0D0D0D;
  --navbar-bg: #FFFFFF;
  --btn-login: #746C7E;
  --btn-signup: #BFA07A;
  --btn-hover: #F4C542; 
  --footer-bg: #FFFFFF;
  --footer-text: #000000;
  /*  게시판 공통 변수 */
  --board-bg: #FFFFFF; /* 컨테이너 배경 */
  --board-shadow: 0 1.5px 16px 2px #eaeaee33; /* 컨테이너 그림자 */
  --table-head-bg: #f2effc; /* 테이블 헤더 배경 */
  --table-head-text: #856fe5; /* 테이블 헤더 텍스트 */
  --table-row-bg: #f9faff; /* 테이블 행 배경 */
  --table-row-shadow: 0 1px 5px #e6e1f880; /* 테이블 행 그림자 */
  --table-row-hover-bg: #edeaff; /* 테이블 행 호버 배경 */
  --title-text: #312b53; /* 제목 텍스트 색상 */
  --badge-bg: #ecf2ff; /* 뱃지 배경 */
  --badge-text: #6d71a7; /* 뱃지 텍스트 */
  
}

/* 다크모드 관련 삭제됨 */


/* 🛠️ Sticky Footer를 위한 메인 콘텐츠 영역 스타일 추가 */
.container {
  flex-grow: 1; /* body의 남은 수직 공간을 모두 채우도록 확장 */
}

/* ✅ 공통 */
body {
  background-color: var(--bg-color);
  color: var(--text-color);
  transition: background-color 0.4s ease, color 0.4s ease;
  padding-top: 110px; /* 메뉴 높이만큼 여백 확보 (로고 크기 고려) */
  margin: 0;
  
  /* 👇 Sticky Footer를 위한 추가 */
  min-height: 100vh; /* 뷰포트 높이만큼 최소 높이 확보 */
  display: flex; /* flex 컨테이너로 설정 */
  flex-direction: column; /* 내용을 수직으로 정렬 */
}

/* --- 네비게이션 스타일 --- */

/* ✅ 메뉴바 상단 고정 */
nav.navbar {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  z-index: 1000;
  background-color: var(--navbar-bg);
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1); /* 깔끔한 그림자 */
  transition: background-color 0.4s ease;
}

.navbar-brand {
  color: var(--footer-text) !important;
  font-weight: 700;
  letter-spacing: 0.5px;
}

nav.navbar .nav-link {
  color: var(--footer-text) !important;
  margin-right: 1rem;
  transition: opacity 0.3s ease, color 0.3s ease;
}

nav.navbar .nav-link:hover {
  opacity: 0.7;
  color: var(--btn-hover) !important;
}

/* ✅ 로그인 / 회원가입 버튼 */
.btn-login {
  background-color: var(--btn-login);
  color: #fff;
  font-weight: 600;
  border: none;
  border-radius: 20px;
  padding: 6px 16px;
  transition: all 0.3s ease;
}

.btn-login:hover {
  background-color: var(--btn-hover);
  color: #0D0D0D;
  transform: translateY(-1px);
}

.btn-signup {
  background-color: var(--btn-signup);
  color: #fff;
  font-weight: 600;
  border: none;
  border-radius: 20px;
  padding: 6px 16px;
  margin-left: 8px;
  transition: all 0.3s ease;
}

.btn-signup:hover {
  background-color: var(--btn-hover);
  color: #0D0D0D;
  transform: translateY(-1px);
}

/* 테마 전환 버튼 제거 */

/* ✅ 반응형 (모바일 뷰) */
@media (max-width: 991px) {
  .navbar-nav {
    text-align: initial;
  }

  .navbar-nav .nav-item {
    width: 100%;
    text-align: left;
    margin-bottom: 0.5rem;
  }

  .auth-and-theme-buttons {
    display: flex;
    justify-content: flex-end;
    align-items: center;
    width: 100%;
    margin-top: 1rem;
    padding-right: 0;
  }

  .auth-and-theme-buttons .btn-login,
  .auth-and-theme-buttons .btn-signup {
    margin-top: 0;
    margin-left: 0.5rem;
  }

  /* 테마 전환 버튼 제거로 여백 규칙 삭제 */

  .navbar-collapse.show {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
  }

  .nav-menu-list {
    width: 100%;
    padding-left: 0;
    list-style: none;
    margin-bottom: 0;
  }

  .nav-menu-list .nav-link {
    margin-right: 0;
  }
}

/* ✅ PC 뷰 버튼 정렬 */
@media (min-width: 992px) {
  .auth-and-theme-buttons {
    display: flex;
    align-items: center;
  }
}

/* --- 푸터 스타일 (기존 footer.jsp에서 이동) --- */
footer {
  background-color: var(--footer-bg);
  color: var(--footer-text);
  padding: 1.5rem 1.5rem;
  font-size: 0.95rem;
  line-height: 1.6;
  border-top: 1px solid rgba(0, 0, 0, 0.05);
  transition: background-color 0.4s ease, color 0.4s ease;
  display: flex;
  flex-direction: column;
  align-items: center;
  position: relative;
}

/* ✅ 로고 (왼쪽 상단 고정) */
footer .footer-logo {
  position: absolute;
  left: 1.5rem;
  top: 1.5rem;
}
footer .footer-logo img {
  height: 70px;
  transition: opacity 0.3s ease;
}
footer .footer-logo img:hover {
  opacity: 0.8;
}

/* ✅ 링크 영역 */
footer .footer-links {
  margin-top: 1.5rem;
  margin-bottom: 0.8rem;
  text-align: center;
}
footer .footer-links a {
  color: var(--footer-text);
  opacity: 0.7;
  text-decoration: none;
  margin: 0 0.6rem;
  transition: color 0.3s ease, opacity 0.3s ease;
}
footer .footer-links a:hover {
  color: var(--btn-hover);
  opacity: 1;
}

/* ✅ 저작권 문구 */
footer .copyright {
  font-size: 0.85rem;
  opacity: 0.6;
  text-align: center;
}
</style>

<nav class="navbar navbar-expand-lg shadow-sm">
  <div class="container-fluid">
    <a href="/community" class="d-inline-block navbar-brand">
      <img src="/community/resources/images/itgoupgo_logo.png" alt="ITGOUPGO Logo" style="height: 100px;">
    </a>

    <button class="navbar-toggler bg-light" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0 nav-menu-list">
        <li class="nav-item"><a class="nav-link" href="/community/study/list">스터디</a></li>
        <li class="nav-item"><a class="nav-link" href="/community/free/list">자유게시판</a></li>
        <li class="nav-item"><a class="nav-link" href="/community/knowledge/list">지식인</a></li>
        <li class="nav-item"><a class="nav-link" href="/community/info/list">정보나눔</a></li>
        <li class="nav-item"><a class="nav-link" href="/community/news/list">IT 뉴스</a></li>
      </ul>

      <div class="auth-and-theme-buttons">
        <a href="/community/login" class="btn btn-login">로그인</a>
        <a href="/community/signup" class="btn btn-signup">회원가입</a>
      </div>
    </div>
  </div>
</nav>

<!-- 다크모드 스크립트 제거 -->