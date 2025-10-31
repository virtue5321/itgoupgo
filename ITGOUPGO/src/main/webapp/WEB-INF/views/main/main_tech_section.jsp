<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- main_tech_section.jsp: 메인 페이지의 테크 지식/뉴스 캐러셀 섹션 -->

<!-- ✅ Bootstrap Carousel을 위한 JS (menubar.jsp에 이미 있으므로 여기서는 제거하거나, 독립적으로 사용 시 추가) -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script> -->

<style>
/* 테크 지식/뉴스 섹션 상단 여백 */
.tech-section {
    margin-top: 3rem; /* 상단 여백 */
    margin-bottom: 5rem; /* 하단 여백 */
}

/* 캐러셀 내 카드 스타일 */
.carousel-item-custom .card {
    border: 1px solid rgba(0, 0, 0, 0.1); /* 테두리 */
    border-radius: 0.5rem; /* 모서리 둥글게 */
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05); /* 그림자 */
    transition: all 0.3s ease; /* 다크 모드 전환 시 부드럽게 */
    height: 100%; /* 부모 높이에 맞춤 */
    display: flex; /* 내부 요소들을 flex로 정렬 */
    flex-direction: column; /* 세로 방향으로 쌓이게 */
}

/* 다크모드 제거 */

/* 카드 호버 시 */
.carousel-item-custom .card:hover {
    transform: translateY(-5px); /* 살짝 위로 이동 */
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1); /* 그림자 더 강조 */
}

/* 카드 이미지 스타일 */
.carousel-item-custom .card-img-top {
    height: 150px; /* 이미지 높이 고정 */
    object-fit: cover; /* 이미지가 잘리지 않고 채워지도록 */
    border-top-left-radius: 0.5rem; /* 상단 모서리 둥글게 */
    border-top-right-radius: 0.5rem;
}

/* 카드 바디 스타일 */
.carousel-item-custom .card-body {
    padding: 1rem; /* 내부 여백 */
    flex-grow: 1; /* 남은 공간을 모두 차지하도록 */
    display: flex;
    flex-direction: column;
}

/* 카드 제목 스타일 */
.carousel-item-custom .card-title {
    font-size: 1.1rem; /* 제목 크기 */
    font-weight: bold; /* 글씨 굵게 */
    margin-bottom: 0.5rem; /* 제목 아래 여백 */
    color: var(--text-color); /* 텍스트 색상 */
    line-height: 1.4; /* 줄 높이 */
    height: 2.8em; /* 두 줄 제한 */
    overflow: hidden; /* 넘치는 텍스트 숨김 */
    text-overflow: ellipsis; /* ...으로 표시 */
    display: -webkit-box; /* 웹킷 브라우저에서 여러 줄 자르기 */
    -webkit-line-clamp: 2; /* 두 줄로 제한 */
    -webkit-box-orient: vertical; /* 수직 방향 */
}

/* 카드 텍스트 스타일 */
.carousel-item-custom .card-text {
    font-size: 0.9rem; /* 텍스트 크기 */
    color: #6c757d; /* 회색 텍스트 */
    flex-grow: 1; /* 남은 공간을 모두 차지하도록 */
    height: 3.6em; /* 세 줄 제한 (line-height * 3) */
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
}

/* 다크모드 제거 */

/* 카드 푸터 스타일 */
.carousel-item-custom .card-footer {
    background-color: transparent; /* 배경 투명 */
    border-top: 1px solid rgba(0, 0, 0, 0.05); /* 상단 테두리 */
    padding: 0.75rem 1rem; /* 내부 여백 */
    font-size: 0.8rem; /* 글씨 크기 */
    color: #888; /* 회색 텍스트 */
    display: flex;
    justify-content: space-between; /* 양쪽 끝으로 정렬 */
    align-items: center;
}

/* 다크모드 제거 */

/* 캐러셀 컨트롤 버튼 (좌우 화살표) 스타일 */
.carousel-control-prev,
.carousel-control-next {
    width: 5%; /* 버튼 너비 */
    opacity: 0.8; /* 투명도 */
    transition: opacity 0.3s ease; /* 호버 시 부드러운 전환 */
}
.carousel-control-prev:hover,
.carousel-control-next:hover {
    opacity: 1; /* 호버 시 불투명하게 */
}

.carousel-control-prev-icon,
.carousel-control-next-icon {
    background-color: var(--navbar-bg); /* 아이콘 배경색 */
    width: 2.5rem; /* 아이콘 너비 */
    height: 2.5rem; /* 아이콘 높이 */
    border-radius: 50%; /* 원형 */
    display: flex; /* 내부 아이콘 정렬을 위해 */
    align-items: center; /* 세로 중앙 정렬 */
    justify-content: center; /* 가로 중앙 정렬 */
    filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2)); /* 그림자 효과 */
}

/* 다크모드 제거 */

/* 캐러셀 인디케이터 (하단 점들) 스타일 */
.carousel-indicators [data-bs-target] {
    background-color: var(--navbar-bg); /* 인디케이터 색상 */
    width: 0.7rem; /* 너비 */
    height: 0.7rem; /* 높이 */
    border-radius: 50%; /* 원형 */
    opacity: 0.7; /* 투명도 */
    margin: 0 0.4rem; /* 인디케이터 간 간격 */
    transition: all 0.3s ease; /* 활성화 시 부드러운 전환 */
}

.carousel-indicators .active {
    opacity: 1; /* 활성화된 인디케이터 불투명하게 */
    background-color: var(--btn-signup); /* 활성화된 인디케이터 색상 */
    width: 0.9rem; /* 활성화된 인디케이터 크기 키우기 */
    height: 0.9rem;
}

/* 다크모드 제거 */

/* 작은 화면에서 캐러셀 아이템 너비 조정 */
@media (max-width: 767px) {
    .carousel-inner-cards .col-md-4 {
        flex: 0 0 100%; /* 작은 화면에서는 각 카드가 100% 너비를 차지하도록 */
        max-width: 100%;
    }
}
</style>

<!-- 테크 지식 / 뉴스 섹션 -->
<section class="tech-section">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="section-title mb-0">테크 지식 / 뉴스</h2>
        <a href="#" class="btn btn-sm btn-outline-secondary btn-more">더 보기 <i class="fa-solid fa-arrow-right-long"></i></a>
    </div>

    <!-- 캐러셀 시작 -->
    <div id="techCarousel" class="carousel slide" data-bs-ride="carousel">
        <!-- 캐러셀 인디케이터 (하단의 점들) -->
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#techCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#techCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#techCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>

        <!-- 캐러셀 슬라이드 내부 -->
        <div class="carousel-inner">
            <!-- 첫 번째 슬라이드 (3개의 카드) -->
            <div class="carousel-item active carousel-item-custom">
                <!-- row: 그리드 행, g-4: 컬럼 간 간격, justify-content-center: 가운데 정렬 -->
                <div class="row g-4 justify-content-center carousel-inner-cards">
                    <!-- col-md-4: 중간 화면 이상에서 4/12 너비 (3개 항목), col-12: 작은 화면에서 12/12 너비 (1개 항목) -->
                    <div class="col-md-4 col-12">
                        <div class="card h-100"> <!-- h-100: 부모 높이에 100% 맞춤 -->
                            <img src="https://via.placeholder.com/300x150/A094F2/FFFFFF?text=뉴스+이미지+1" class="card-img-top" alt="뉴스 이미지 1">
                            <div class="card-body">
                                <h5 class="card-title">1x1 픽셀 + 서버리스 = 나만의 방문자 확인 API</h5>
                                <p class="card-text">방문자 수 확인은 웹사이트 운영의 필수 요소입니다. 1x1 픽셀과 서버리스 아키텍처를 결합하여 간단하고 효율적인 방문자 확인 API를 만드는 방법을 알아봅니다.</p>
                            </div>
                            <div class="card-footer">
                                <small class="text-muted">ephemeraldev</small>
                                <div>
                                    <i class="fa-solid fa-thumbs-up"></i> 2
                                    <i class="fa-solid fa-comments ms-2"></i> 1
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-12">
                        <div class="card h-100">
                            <img src="https://via.placeholder.com/300x150/BFA07A/FFFFFF?text=뉴스+이미지+2" class="card-img-top" alt="뉴스 이미지 2">
                            <div class="card-body">
                                <h5 class="card-title">자기소개서 예시와 잘 쓰는 법</h5>
                                <p class="card-text">취업 준비생들을 위한 자기소개서 작성 가이드. 합격률을 높이는 효과적인 자기소개서 작성법과 실제 예시를 통해 핵심을 전달합니다.</p>
                            </div>
                            <div class="card-footer">
                                <small class="text-muted">이민석</small>
                                <div>
                                    <i class="fa-solid fa-thumbs-up"></i> 1
                                    <i class="fa-solid fa-comments ms-2"></i> 0
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-12">
                        <div class="card h-100">
                            <img src="https://via.placeholder.com/300x150/746C7E/FFFFFF?text=뉴스+이미지+3" class="card-img-top" alt="뉴스 이미지 3">
                            <div class="card-body">
                                <h5 class="card-title">오나인솔루션즈, 2025 Gartner® P eer Insights™ 공급망 계획 솔루션</h5>
                                <p class="card-text">오나인솔루션즈가 Gartner® Peer Insights™에서 공급망 계획 솔루션 부문 최고 등급을 획득했습니다. 이는 기업들에게 큰 의미가 있습니다.</p>
                            </div>
                            <div class="card-footer">
                                <small class="text-muted">OKKYST</small>
                                <div>
                                    <i class="fa-solid fa-thumbs-up"></i> 0
                                    <i class="fa-solid fa-comments ms-2"></i> 0
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 두 번째 슬라이드 (다음 3개의 카드) -->
            <div class="carousel-item carousel-item-custom">
                <div class="row g-4 justify-content-center carousel-inner-cards">
                    <div class="col-md-4 col-12">
                        <div class="card h-100">
                            <img src="https://via.placeholder.com/300x150/A094F2/FFFFFF?text=뉴스+이미지+4" class="card-img-top" alt="뉴스 이미지 4">
                            <div class="card-body">
                                <h5 class="card-title">Spring Boot 3.x에서 Redis를 사용하는 방법</h5>
                                <p class="card-text">Spring Boot 3.x 환경에서 Redis를 캐시, 세션 관리 등 다양한 용도로 활용하는 방법에 대한 상세 가이드입니다.</p>
                            </div>
                            <div class="card-footer">
                                <small class="text-muted">dev_guy</small>
                                <div>
                                    <i class="fa-solid fa-thumbs-up"></i> 5
                                    <i class="fa-solid fa-comments ms-2"></i> 3
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-12">
                        <div class="card h-100">
                            <img src="https://via.placeholder.com/300x150/BFA07A/FFFFFF?text=뉴스+이미지+5" class="card-img-top" alt="뉴스 이미지 5">
                            <div class="card-body">
                                <h5 class="card-title">클라우드 네이티브 개발을 위한 Kubernetes 심화</h5>
                                <p class="card-text">쿠버네티스(Kubernetes)를 활용한 클라우드 네이티브 애플리케이션 개발 전략과 배포, 운영 심화 기술을 학습합니다.</p>
                            </div>
                            <div class="card-footer">
                                <small class="text-muted">cloud_expert</small>
                                <div>
                                    <i class="fa-solid fa-thumbs-up"></i> 8
                                    <i class="fa-solid fa-comments ms-2"></i> 2
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-12">
                        <div class="card h-100">
                            <img src="https://via.placeholder.com/300x150/746C7E/FFFFFF?text=뉴스+이미지+6" class="card-img-top" alt="뉴스 이미지 6">
                            <div class="card-body">
                                <h5 class="card-title">GPT-4o: 더 똑똑해진 AI 모델의 활용 가능성</h5>
                                <p class="card-text">최신 AI 모델 GPT-4o의 개선된 성능과 다양한 활용 시나리오, 그리고 개발자들이 어떻게 이 기술을 적용할 수 있을지 알아봅니다.</p>
                            </div>
                            <div class="card-footer">
                                <small class="text-muted">ai_innovator</small>
                                <div>
                                    <i class="fa-solid fa-thumbs-up"></i> 12
                                    <i class="fa-solid fa-comments ms-2"></i> 7
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 세 번째 슬라이드 (다음 3개의 카드) -->
            <div class="carousel-item carousel-item-custom">
                <div class="row g-4 justify-content-center carousel-inner-cards">
                    <div class="col-md-4 col-12">
                        <div class="card h-100">
                            <img src="https://via.placeholder.com/300x150/A094F2/FFFFFF?text=뉴스+이미지+7" class="card-img-top" alt="뉴스 이미지 7">
                            <div class="card-body">
                                <h5 class="card-title">프론트엔드 개발자를 위한 최신 JS 프레임워크 비교</h5>
                                <p class="card-text">React, Vue, Angular 등 주요 JavaScript 프레임워크의 특징과 장단점을 비교하여 프로젝트에 적합한 프레임워크를 선택하는 데 도움을 줍니다.</p>
                            </div>
                            <div class="card-footer">
                                <small class="text-muted">fe_developer</small>
                                <div>
                                    <i class="fa-solid fa-thumbs-up"></i> 9
                                    <i class="fa-solid fa-comments ms-2"></i> 4
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-12">
                        <div class="card h-100">
                            <img src="https://via.placeholder.com/300x150/BFA07A/FFFFFF?text=뉴스+이미지+8" class="card-img-top" alt="뉴스 이미지 8">
                            <div class="card-body">
                                <h5 class="card-title">데이터 과학자를 위한 파이썬 라이브러리 심층 분석</h5>
                                <p class="card-text">Pandas, NumPy, Matplotlib, Scikit-learn 등 데이터 과학에 필수적인 파이썬 라이브러리들을 심층적으로 분석하고 활용 사례를 공유합니다.</p>
                            </div>
                            <div class="card-footer">
                                <small class="text-muted">data_sci</small>
                                <div>
                                    <i class="fa-solid fa-thumbs-up"></i> 11
                                    <i class="fa-solid fa-comments ms-2"></i> 6
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-12">
                        <div class="card h-100">
                            <img src="https://via.placeholder.com/300x150/746C7E/FFFFFF?text=뉴스+이미지+9" class="card-img-top" alt="뉴스 이미지 9">
                            <div class="card-body">
                                <h5 class="card-title">DevOps 문화 정착을 위한 CI/CD 파이프라인 구축 전략</h5>
                                <p class="card-text">지속적인 통합 및 배포(CI/CD) 파이프라인을 효과적으로 구축하고 DevOps 문화를 성공적으로 정착시키기 위한 전략과 팁을 제공합니다.</p>
                            </div>
                            <div class="card-footer">
                                <small class="text-muted">devops_pro</small>
                                <div>
                                    <i class="fa-solid fa-thumbs-up"></i> 7
                                    <i class="fa-solid fa-comments ms-2"></i> 5
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 캐러셀 컨트롤 (이전/다음 버튼) -->
        <button class="carousel-control-prev" type="button" data-bs-target="#techCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span> <!-- 시각적으로는 숨기지만 스크린 리더가 읽도록 -->
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#techCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</section>