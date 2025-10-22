<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!-- ✅ Bootstrap / jQuery / FontAwesome CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<!-- ✅ 스타일 -->
<style>
:root {
  /* 라이트 모드 */
  --bg-color: #F2F2F2;
  --text-color: #0D0D0D;
  --navbar-bg: #A094F2;
  --btn-login: #746C7E;
  --btn-signup: #BFA07A;
  --btn-hover: #EDF25E;
  --footer-bg: #A094F2;
  --footer-text: #F2F2F2;
}

[data-theme="dark"] {
  --bg-color: #0D0D0D;
  --text-color: #F2F2F2;
  --navbar-bg: #1A1A1A;
  --btn-login: #BFA07A;
  --btn-signup: #A094F2;
  --btn-hover: #EDF25E;
  --footer-bg: #1A1A1A;
  --footer-text: #BFA07A;
}

body {
  background-color: var(--bg-color);
  color: var(--text-color);
  transition: background-color 0.4s ease, color 0.4s ease;
}

nav.navbar {
  background-color: var(--navbar-bg);
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
  transition: opacity 0.3s ease;
}

nav.navbar .nav-link:hover {
  opacity: 0.7; /* 투명도 조절 */
  color: var(--btn-hover) !important; /* var(--btn-hover) 색상 적용 */
}

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

.btn-theme {
  background-color: transparent;
  border: 2px solid var(--footer-text);
  color: var(--footer-text);
  border-radius: 50%;
  width: 38px;
  height: 38px;
  margin-left: 12px;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: all 0.3s ease;
}

.btn-theme:hover {
  background-color: rgba(255, 255, 255, 0.2);
  transform: rotate(20deg);
}

/* 햄버거 메뉴가 열렸을 때 (모바일 뷰) */
@media (max-width: 991px) {
  /* 기존 .navbar-nav의 text-align: center를 오버라이드하여 Flexbox의 정렬을 따르도록 함 */
  .navbar-nav {
    text-align: initial;
    /* 메뉴 항목 간 간격 조정 */
  }

  /* 메뉴 항목들 좌측 정렬 */
  .navbar-nav .nav-item {
    width: 100%; /* 전체 너비 차지 */
    text-align: left; /* 텍스트 왼쪽 정렬 */
    margin-bottom: 0.5rem; /* 메뉴 항목 간 간격 */
  }

  /* 로그인/회원가입 버튼, 모드 전환 버튼을 위한 Flex 컨테이너 */
  .auth-and-theme-buttons {
    display: flex; /* Flexbox 활성화 */
    justify-content: flex-end; /* 버튼들을 오른쪽으로 정렬 */
    align-items: center; /* 세로 중앙 정렬 */
    width: 100%; /* 전체 너비 차지 */
    margin-top: 1rem; /* 상단 여백 */
    padding-right: 0; /* 우측 패딩 제거 */
  }

  /* 버튼 간 간격 조정 */
  .auth-and-theme-buttons .btn-login,
  .auth-and-theme-buttons .btn-signup {
    margin-top: 0; /* 불필요한 상단 마진 제거 */
    margin-left: 0.5rem; /* 버튼 간 간격 */
  }
  
  /* 모드 전환 버튼의 마진 조정 */
  .auth-and-theme-buttons .btn-theme {
      margin-left: 0.5rem; /* 버튼 간 간격 */
  }

  /* 햄버거 메뉴 내부의 전체 컨테이너에 Flex 속성 적용 */
  .navbar-collapse.show {
    display: flex; /* Flexbox 활성화 */
    flex-direction: column; /* 세로 방향으로 쌓이도록 설정 */
    align-items: flex-start; /* 자식 요소들을 왼쪽 정렬 */
  }
  
  /* 게시판 메뉴들을 담는 컨테이너 */
  .nav-menu-list {
      width: 100%; /* 전체 너비 차지 */
      padding-left: 0; /* 기본 패딩 제거 */
      list-style: none; /* 리스트 스타일 제거 */
      margin-bottom: 0; /* 하단 마진 제거 */
  }

  /* 게시판 메뉴 링크의 margin-right 제거 (모바일에서 필요 없음) */
  .nav-menu-list .nav-link {
    margin-right: 0;
  }
}

/* PC 뷰에서 로그인/회원가입/테마 버튼 정렬 */
@media (min-width: 992px) {
    .auth-and-theme-buttons {
        display: flex;
        align-items: center;
    }
}
</style>

<!-- 네비게이션 영역 -->
<nav class="navbar navbar-expand-lg shadow-sm">
	<!-- 반응형으로 메뉴바가 화면에 꽉차게 -->
  <div class="container-fluid">
  	<a href="/community" class="d-inline-block">
    	<img src="/community/resources/images/itgoupgo_logo.png" alt="ITGOUPGO Logo"
    	style="height: 80px;">
    </a>
    
    <!--  반응형 디자인 버튼(모바일 환경 고려) collapse:접기/펼치기-->
    <button class="navbar-toggler bg-light" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>
    
	<!-- 게시판 메뉴 버튼 및 로그인/회원가입/모드 전환 버튼 -->
    <div class="collapse navbar-collapse" id="navbarNav">
      <!-- 게시판 메뉴 (좌측 정렬) -->
      <ul class="navbar-nav me-auto mb-2 mb-lg-0 nav-menu-list">
        <li class="nav-item"><a class="nav-link" href="/community/study">스터디</a></li>
        <li class="nav-item"><a class="nav-link" href="/community/free">자유게시판</a></li>
        <li class="nav-item"><a class="nav-link" href="/community/knowledge">지식인</a></li>
        <li class="nav-item"><a class="nav-link" href="/community/info">정보나눔</a></li>
        <li class="nav-item"><a class="nav-link" href="/community/news">IT 뉴스</a></li>
      </ul>

      <!-- 로그인 / 회원가입 / 모드 전환 (우측 정렬) -->
      <div class="auth-and-theme-buttons">
        <a href="/community/login" class="btn btn-login">로그인</a>
        <a href="/community/signup" class="btn btn-signup">회원가입</a>
        <button id="themeToggle" class="btn btn-theme" title="모드 전환">
          <i class="fa-solid fa-moon"></i> <!-- 디폴트 : 달 모양 아이콘 -->
        </button>
      </div>
    </div>
  </div>
</nav>

<!-- ✅ 다크모드 전환 스크립트 -->
<script>
  const themeToggle = document.getElementById('themeToggle');
  const html = document.documentElement;

  // 페이지 로드 시 저장된 테마 적용
  if (localStorage.getItem('theme') === 'dark') {
    html.setAttribute('data-theme', 'dark');
    themeToggle.innerHTML = '<i class="fa-solid fa-sun"></i>'; // 다크 모드일 때 해 아이콘
  } else {
    html.removeAttribute('data-theme');
    themeToggle.innerHTML = '<i class="fa-solid fa-moon"></i>'; // 라이트 모드일 때 달 아이콘
  }

  themeToggle.addEventListener('click', () => {
    if (html.getAttribute('data-theme') === 'dark') {
      html.removeAttribute('data-theme');
      themeToggle.innerHTML = '<i class="fa-solid fa-moon"></i>';
      localStorage.setItem('theme', 'light');
    } else {
      html.setAttribute('data-theme', 'dark');
      themeToggle.innerHTML = '<i class="fa-solid fa-sun"></i>';
      localStorage.setItem('theme', 'dark');
    }
  });
</script>