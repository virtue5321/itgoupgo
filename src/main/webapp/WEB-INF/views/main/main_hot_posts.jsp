<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- main_hot_posts.jsp: 메인 페이지의 인기글 탭 섹션 -->

<!-- ✅ FontAwesome CDN (menubar.jsp에 이미 있으므로 여기서는 제거하거나, 독립적으로 사용 시 추가) -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"> -->

<style>
/* 인기글 섹션의 상단 여백 */
.hot-posts-section {
    margin-bottom: 3rem; /* 섹션 하단 여백 */
}

/* 탭 버튼 스타일 */
.hot-posts-section .nav-tabs .nav-link {
    color: var(--text-color); !important /* 텍스트 색상 */
    border: none; /* 기본 테두리 없음 */
    border-bottom: 2px solid transparent; /* 아래 테두리 투명하게 */
    margin-right: 1rem; /* 탭 버튼 간 간격 */
    padding: 0.5rem 0.5rem; /* 내부 여백 */
    transition: all 0.3s ease; /* 모든 속성 변화 시 부드럽게 */
}

/* 탭 버튼 호버 시 */
.hot-posts-section .nav-tabs .nav-link:hover {
    border-bottom-color: var(--btn-hover); /* 아래 테두리 색상 변경 */
}

/* 활성화된 탭 버튼 스타일 */
.hot-posts-section .nav-tabs .nav-link.active {
    background-color: transparent; /* 활성화된 탭의 배경색 투명 */
    font-weight: bold; /* 글씨 굵게 */
    border-bottom-color: var(--navbar-bg); /* 아래 테두리 색상 */
}

/* 다크 모드일 때 활성화된 탭 버튼 색상 */
[data-theme="dark"] .hot-posts-section .nav-tabs .nav-link.active {
    color: var(--btn-signup); /* 다크 모드일 때 다른 강조 색상 */
    border-bottom-color: var(--btn-signup);
}

/* 게시글 목록 스타일 */
.hot-posts-list .list-group-item {
    background-color: var(--bg-color); /* 배경색 */
    color: var(--text-color); /* 텍스트 색상 */
    border: 1px solid rgba(0, 0, 0, 0.1); /* 테두리 */
    margin-bottom: 0.5rem; /* 항목 간 간격 */
    border-radius: 0.4rem; /* 모서리 둥글게 */
    transition: all 0.3s ease; /* 다크 모드 전환 시 부드럽게 */
}

/* 다크 모드일 때 게시글 목록 배경색 및 테두리 */
[data-theme="dark"] .hot-posts-list .list-group-item {
    background-color: #2c2c31; /* 어두운 배경색 */
    border-color: rgba(255, 255, 255, 0.1); /* 밝은 테두리색 */
}

/* 게시글 항목 호버 시 */
.hot-posts-list .list-group-item:hover {
    background-color: rgba(var(--navbar-bg-rgb), 0.1); /* 배경색 살짝 변경 */
    transform: translateY(-2px); /* 살짝 위로 이동 */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05); /* 그림자 추가 */
}

[data-theme="dark"] .hot-posts-list .list-group-item:hover {
     background-color: rgba(var(--btn-signup-rgb), 0.1); /* 다크모드 호버 색상 */
}


/* 게시글 제목 스타일 */
.post-title {
    font-weight: 500; /* 제목 글씨 굵기 */
    margin-right: 0.5rem; /* 제목과 댓글 아이콘 사이 간격 */
}

/* 댓글 카운트 스타일 */
.comment-count {
    color: #6c757d; /* 회색 텍스트 */
    font-size: 0.85rem; /* 글씨 크기 작게 */
    margin-left: 0.2rem; /* 아이콘과 숫자 사이 간격 */
}

/* 새로운 글 표시 뱃지 */
.new-badge {
    background-color: #ffc107; /* 주황색 배경 */
    color: #343a40; /* 어두운 텍스트 */
    font-size: 0.75rem; /* 글씨 크기 */
    padding: 0.2em 0.5em; /* 내부 여백 */
    border-radius: 0.25rem; /* 모서리 둥글게 */
    margin-left: 0.5rem; /* 다른 요소와의 간격 */
    vertical-align: middle; /* 세로 중앙 정렬 */
}

/* "사는 얘기" 버튼 스타일 */
.btn-talk {
    background-color: #e9ecef; /* 밝은 회색 배경 */
    color: #495057; /* 어두운 텍스트 */
    border: none; /* 테두리 없음 */
    padding: 0.25rem 0.75rem; /* 내부 여백 */
    border-radius: 1rem; /* 모서리 둥글게 */
    font-size: 0.85rem; /* 글씨 크기 */
    text-decoration: none; /* 밑줄 제거 */
    margin-left: 0.5rem; /* 왼쪽 간격 */
    transition: all 0.2s ease; /* 부드러운 전환 */
}

.btn-talk:hover {
    background-color: #dee2e6; /* 호버 시 배경색 변경 */
    color: #212529; /* 호버 시 텍스트 색상 변경 */
}

/* 다크 모드 "사는 얘기" 버튼 스타일 */
[data-theme="dark"] .btn-talk {
    background-color: #3f3f45; /* 어두운 배경색 */
    color: #adb5bd; /* 밝은 텍스트 */
}
[data-theme="dark"] .btn-talk:hover {
    background-color: #55555c; /* 호버 시 배경색 변경 */
    color: #e9ecef; /* 호버 시 텍스트 색상 변경 */
}

/* 더 보기 버튼 스타일 */
.btn-more {
    background-color: transparent; /* 배경 투명 */
    color: var(--text-color); /* 텍스트 색상 */
    border: 1px solid var(--text-color); /* 테두리 */
    transition: all 0.3s ease; /* 부드러운 전환 */
}
.btn-more:hover {
    background-color: var(--navbar-bg); /* 호버 시 배경색 */
    color: #fff; /* 호버 시 텍스트 색상 */
    border-color: var(--navbar-bg); /* 호버 시 테두리 색상 */
}
[data-theme="dark"] .btn-more:hover {
    background-color: var(--btn-signup); /* 다크 모드 호버 시 */
    color: #fff;
    border-color: var(--btn-signup);
}

/* 섹션 타이틀 */
.section-title {
    font-size: 1.5rem; /* 타이틀 글씨 크기 */
    font-weight: bold; /* 글씨 굵게 */
    margin-bottom: 1.5rem; /* 타이틀 아래 여백 */
}
</style>

<!-- 인기글 섹션 -->
<section class="hot-posts-section">
    <!-- flex-column flex-md-row: 작은 화면에서는 세로 정렬, 중간 화면 이상에서는 가로 정렬 -->
    <!-- justify-content-between: 자식 요소들을 양쪽 끝으로 정렬 (가운데 공간을 분리) -->
    <!-- align-items-center: 자식 요소들을 세로 중앙 정렬 -->
    <div class="d-flex flex-column flex-md-row justify-content-between align-items-center mb-4">
        <h2 class="section-title mb-3 mb-md-0">오늘의 HOT 인기글</h2>
        <!-- mb-3 mb-md-0: 작은 화면에서 하단 마진 3, 중간 화면 이상에서 마진 0 -->
        <ul class="nav nav-tabs border-0" id="hotPostsTab" role="tablist">
            <!-- nav-tabs: Bootstrap의 탭 내비게이션 스타일 적용 -->
            <!-- border-0: 테두리 제거 -->
            <!-- role="tablist": 접근성을 위한 역할 정의 -->
            <li class="nav-item" role="presentation">
                <!-- nav-item: 탭 목록의 각 항목 -->
                <!-- role="presentation": 접근성을 위한 역할 정의 (li 태그는 목록의 래퍼) -->
                <button class="nav-link active" id="today-tab" data-bs-toggle="tab" data-bs-target="#today" type="button" role="tab" aria-controls="today" aria-selected="true">오늘의 인기글</button>
                <!-- nav-link: 탭 링크 스타일, active: 현재 활성화된 탭 -->
                <!-- data-bs-toggle="tab": 이 버튼이 탭을 토글함을 Bootstrap에 알림 -->
                <!-- data-bs-target: 연결된 탭 패널의 ID -->
                <!-- aria-controls: 연결된 패널의 ID, aria-selected: 현재 선택 상태 -->
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="month-tab" data-bs-toggle="tab" data-bs-target="#month" type="button" role="tab" aria-controls="month" aria-selected="false">이달의 인기글</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="notice-tab" data-bs-toggle="tab" data-bs-target="#notice" type="button" role="tab" aria-controls="notice" aria-selected="false">공지사항</button>
            </li>
        </ul>
    </div>

    <!-- tab-content: 탭 패널들을 감싸는 컨테이너 -->
    <div class="tab-content" id="hotPostsTabContent">
        <!-- tab-pane: 각 탭에 해당하는 실제 컨텐츠 영역 -->
        <!-- fade show active: 첫 번째 탭 패널은 기본적으로 보여지고 부드러운 전환 효과 -->
        <div class="tab-pane fade show active" id="today" role="tabpanel" aria-labelledby="today-tab">
            <!-- list-group: Bootstrap의 리스트 그룹 스타일 적용 -->
            <ul class="list-group hot-posts-list">
                <!-- list-group-item: 리스트 그룹의 각 항목 -->
                <li class="list-group-item d-flex justify-content-between align-items-center">
                    <div class="d-flex align-items-center">
                        <a href="#" class="text-decoration-none text-reset post-title">오늘, 아마존의 인재 유출이 결국 AWS 무너뜨렸다 (10)</a>
                        <span class="badge new-badge">N</span> <!-- 새로운 글 표시 뱃지 -->
                    </div>
                    <a href="#" class="btn btn-talk">사는 얘기</a>
                </li>
                <li class="list-group-item d-flex justify-content-between align-items-center">
                    <div class="d-flex align-items-center">
                        <a href="#" class="text-decoration-none text-reset post-title">비개발자의 로직 혼돈 억수로 어떻게 생각하냐옹? (13)</a>
                        <span class="badge new-badge">N</span>
                    </div>
                    <a href="#" class="btn btn-talk">AI</a>
                </li>
                 <li class="list-group-item d-flex justify-content-between align-items-center">
                    <div class="d-flex align-items-center">
                        <a href="#" class="text-decoration-none text-reset post-title">기업은 구인난 </a><i class="fa-solid fa-comments comment-icon mx-1"></i><span class="comment-count">(8)</span>
                    </div>
                    <a href="#" class="btn btn-talk">사는 얘기</a>
                </li>
                <li class="list-group-item d-flex justify-content-between align-items-center">
                    <div class="d-flex align-items-center">
                        <a href="#" class="text-decoration-none text-reset post-title">현재 돈이 있다면 금과 부동산 중 뭘 사시겠습니까? </a><i class="fa-solid fa-comments comment-icon mx-1"></i><span class="comment-count">(18)</span>
                    </div>
                    <a href="#" class="btn btn-talk">사는 얘기</a>
                </li>
                <li class="list-group-item d-flex justify-content-between align-items-center">
                    <div class="d-flex align-items-center">
                        <a href="#" class="text-decoration-none text-reset post-title">코딩 AI는 클로드가 좋습니다 </a><i class="fa-solid fa-comments comment-icon mx-1"></i><span class="comment-count">(15)</span>
                    </div>
                    <a href="#" class="btn btn-talk">사는 얘기</a>
                </li>
            </ul>
        </div>

        <div class="tab-pane fade" id="month" role="tabpanel" aria-labelledby="month-tab">
            <ul class="list-group hot-posts-list">
                <li class="list-group-item d-flex justify-content-between align-items-center">
                    <div class="d-flex align-items-center">
                        <a href="#" class="text-decoration-none text-reset post-title">이달의 인기글입니다 예시 1</a>
                    </div>
                    <a href="#" class="btn btn-talk">스킬</a>
                </li>
                <li class="list-group-item d-flex justify-content-between align-items-center">
                    <div class="d-flex align-items-center">
                        <a href="#" class="text-decoration-none text-reset post-title">이달의 인기글입니다 예시 2</a>
                    </div>
                    <a href="#" class="btn btn-talk">프론트엔드</a>
                </li>
            </ul>
        </div>

        <div class="tab-pane fade" id="notice" role="tabpanel" aria-labelledby="notice-tab">
            <ul class="list-group hot-posts-list">
                <li class="list-group-item d-flex justify-content-between align-items-center">
                    <div class="d-flex align-items-center">
                        <a href="#" class="text-decoration-none text-reset post-title">공지사항입니다 예시 1</a>
                    </div>
                    <a href="#" class="btn btn-talk">공지</a>
                </li>
                <li class="list-group-item d-flex justify-content-between align-items-center">
                    <div class="d-flex align-items-center">
                        <a href="#" class="text-decoration-none text-reset post-title">공지사항입니다 예시 2</a>
                    </div>
                    <a href="#" class="btn btn-talk">업데이트</a>
                </li>
            </ul>
        </div>
    </div>
</section>