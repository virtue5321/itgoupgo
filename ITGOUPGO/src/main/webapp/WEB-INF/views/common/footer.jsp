<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>

/* 푸터 메뉴 링크 호버 스타일 추가 */
footer .list-inline-item a {
    transition: opacity 0.3s ease, color 0.3s ease; /* 전환 효과 추가 */
}

footer .list-inline-item a:hover {
    opacity: 0.7; /* 투명도 조절 */
    color: var(--btn-hover) !important; /* var(--btn-hover) 색상 적용 */
}

</style>


<footer class="text-center py-4 mt-5" 
        style="background-color: var(--footer-bg); color: var(--footer-text); transition: background-color 0.4s ease, color 0.4s ease;">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-4 text-md-start mb-3 mb-md-0">
                <!-- ITGOUPGO 로고 -->
                <a href="/community" class="d-inline-block">
                    <img src="/community/resources/images/itgoupgo_logo.png" alt="ITGOUPGO Logo" style="height: 80px;">
                </a>
            </div>
            <div class="col-md-4 mb-3 mb-md-0">
                <!-- 메뉴바 -->
                <ul class="list-inline mb-0">
                    <li class="list-inline-item"><a href="#" class="text-decoration-none text-white-50">회사소개</a></li>
                    <li class="list-inline-item"><a href="#" class="text-decoration-none text-white-50">운영정책</a></li>
                    <li class="list-inline-item"><a href="#" class="text-decoration-none text-white-50">개인정보처리방침</a></li>
                </ul>
            </div>
        </div>
    </div>
</footer>
