<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ITGOUPGO 취준생 커뮤니티</title>
    <!-- menubar.jsp에 모든 필요한 CDN이 포함되어 있으므로 여기서는 추가하지 않습니다. -->
</head>
<body>

	<!--  메뉴바(헤더) 영역 -->
    <jsp:include page="common/menubar.jsp" />
        
    <!--  메인 컨텐츠 영역  -->
    
    <!-- container: Bootstrap에서 콘텐츠를 중앙에 정렬하고 최대 너비를 제한하는 클래스 -->
    
    <div class="container mt-5"> <!-- mt-5 : margin-top -->
        <!-- 메인 타이틀 및 소개글 -->
        <h1 class="text-center mb-3 fw-bold">ITGOUPGO에 오신 것을 환영합니다!</h1>
        <p class="text-center text-secondary mb-5">취업 준비생들을 위한 정보공유 & 스터디 플랫폼</p>
        <!-- mb-5: margin-bottom: 3rem -->

        <!-- 각 컨텐츠 영역을 별도의 JSP 파일로 분리 -->
        <jsp:include page="main/main_hot_posts.jsp" />
        <jsp:include page="main/main_tech_section.jsp" />
    </div>

	<!--  푸터 영역  -->
    <jsp:include page="common/footer.jsp" />
</body>
</html>