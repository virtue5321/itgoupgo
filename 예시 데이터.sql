-- *****************************************************************
-- 1단계: MEMBER 테이블에 부모 데이터 (작성자) 5명 삽입 (최신 14개 컬럼 구조 반영)
-- *****************************************************************

-- 필드 순서: MEMBER_NO, MEMBER_ID, MEMBER_PWD, MEMBER_NAME, MEMBER_NICK, MEMBER_BIRTH_DATE, GENDER, EMAIL, PHONE, POSTCODE, ADDR_MAIN, ADDR_DETAIL, ENROLL_DATE, MEMBER_STATUS

-- 1. 관리자 계정 (MEMBER_NO: 1)
INSERT INTO MEMBER 
VALUES (1, 'admin', '1234', '최고 관리자', 'Master', NULL, 'M', 'admin@site.com', '010-0000-0000', 
        '03176', '서울 종로구 인사동길', '123-1', SYSDATE - 20, 'Y');

-- 2. 활동 사용자 (MEMBER_NO: 2)
INSERT INTO MEMBER 
VALUES (2, 'user01', '1234', '홍길동', 'HongGil', DATE '1990-05-15', 'M', 'user01@site.com', '010-1111-2222', 
        '06123', '서울 강남구 테헤란로', '501호', SYSDATE - 10, 'Y');

-- 3. 일반 사용자 (MEMBER_NO: 3)
INSERT INTO MEMBER 
VALUES (3, 'user02', '1234', '김철수', 'KimCS', DATE '1995-12-01', 'M', 'user02@site.com', '010-3333-4444', 
        '13401', '경기 성남시 분당구 판교역로', 'A동 101호', SYSDATE - 8, 'Y');

-- 4. 여성 사용자 (MEMBER_NO: 4)
INSERT INTO MEMBER 
VALUES (4, 'user03', '1234', '이영희', 'LeeYH', DATE '2000-03-20', 'F', 'user03@site.com', '010-5555-6666', 
        '48057', '부산 해운대구 마린시티', NULL, SYSDATE - 5, 'Y');

-- 5. 신규 사용자 (MEMBER_NO: 5)
INSERT INTO MEMBER 
VALUES (5, 'user04', '1234', '박민수', 'ParkMS', NULL, 'M', 'user04@site.com', '010-7777-8888', 
        '30121', '대전 서구 둔산서로', '5층', SYSDATE - 2, 'Y');

COMMIT;

-- *****************************************************************
-- 2단계: FREE_BBS 테이블에 데이터 11개 삽입 (MEMBER_NO 1~5 참조)
-- *****************************************************************

-- 1. 작성자: 1 (admin)
INSERT INTO FREE_BBS (FREE_NO, MEMBER_NO, FREE_TITLE, FREE_CONTENT, FREE_VIEW, FREE_CREATE_DATE, FREE_DELETE_STATUS)
VALUES (1, 1, 'Spring Boot 설정 드디어 끝냈습니다! 🎉', '며칠 동안 환경 설정 때문에 고생했는데, 드디어 서버가 뜨네요. 다들 화이팅!', 5, TO_DATE('2025-10-30 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'N');

-- 2. 작성자: 3 (user02)
INSERT INTO FREE_BBS (FREE_NO, MEMBER_NO, FREE_TITLE, FREE_CONTENT, FREE_VIEW, FREE_CREATE_DATE, FREE_DELETE_STATUS)
VALUES (2, 3, '개발자 국비지원 학원 추천 좀 부탁드립니다.', '최근에 국비지원 과정 알아보는 중인데, 후기가 괜찮은 곳이 있을까요? 특히 자바/스프링 쪽으로요.', 150, TO_DATE('2025-10-28 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'N');

-- 3. 작성자: 2 (user01)
INSERT INTO FREE_BBS (FREE_NO, MEMBER_NO, FREE_TITLE, FREE_CONTENT, FREE_VIEW, FREE_CREATE_DATE, FREE_DELETE_STATUS)
VALUES (3, 2, 'MyBatis ResultMap 오류, 혹시 아시는 분 계신가요?', 'adminMapper 수정 후 ResultMap 오류가 계속 나는데, 원인을 모르겠습니다.', 45, TO_DATE('2025-10-29 11:20:00', 'YYYY-MM-DD HH24:MI:SS'), 'N');

-- 4. 작성자: 4 (user03)
INSERT INTO FREE_BBS (FREE_NO, MEMBER_NO, FREE_TITLE, FREE_CONTENT, FREE_VIEW, FREE_CREATE_DATE, FREE_DELETE_STATUS)
VALUES (4, 4, '점심 메뉴 추천 받습니다 (오늘따라 뭘 먹어야 할지..)', '오늘 날씨가 흐려서 그런지 따뜻한 국물이 땡기는데, 근처 식당 추천해주시면 감사하겠습니다.', 98, TO_DATE('2025-10-30 12:05:00', 'YYYY-MM-DD HH24:MI:SS'), 'N');

-- 5. 작성자: 5 (user04)
INSERT INTO FREE_BBS (FREE_NO, MEMBER_NO, FREE_TITLE, FREE_CONTENT, FREE_VIEW, FREE_CREATE_DATE, FREE_DELETE_STATUS)
VALUES (5, 5, '자바스크립트 ES6 문법 정리 노트 공유합니다.', 'ES6 부터 바뀐 주요 문법들을 깔끔하게 정리해봤습니다. 도움 되시길 바랍니다.', 312, TO_DATE('2025-10-20 17:40:00', 'YYYY-MM-DD HH24:MI:SS'), 'N');

-- 6. 작성자: 1 (admin) / 삭제 상태 'Y' 예시
INSERT INTO FREE_BBS (FREE_NO, MEMBER_NO, FREE_TITLE, FREE_CONTENT, FREE_VIEW, FREE_CREATE_DATE, FREE_DELETE_STATUS)
VALUES (6, 1, '공부하다가 너무 힘들어서 잠시 쉬려고 합니다.', '다들 중간에 지치지 말고 꾸준히 하세요. 저는 오늘만 쉽니다! :)', 220, TO_DATE('2025-10-15 09:10:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

-- 7. 작성자: 3 (user02) / 제목 길이 조정 완료
INSERT INTO FREE_BBS (FREE_NO, MEMBER_NO, FREE_TITLE, FREE_CONTENT, FREE_VIEW, FREE_CREATE_DATE, FREE_DELETE_STATUS)
VALUES (7, 3, '제목이 길어도 잘리는지 테스트 해보는 글입니다. .', '내용은 간단합니다. 제목이 잘리는지 확인해보는 테스트', 12, TO_DATE('2025-10-29 23:55:00', 'YYYY-MM-DD HH24:MI:SS'), 'N');

-- 8. 작성자: 2 (user01)
INSERT INTO FREE_BBS (FREE_NO, MEMBER_NO, FREE_TITLE, FREE_CONTENT, FREE_VIEW, FREE_CREATE_DATE, FREE_DELETE_STATUS)
VALUES (8, 2, '개발용 노트북 구매 팁 공유합니다.', 'CPU, RAM, SSD 등 중요하게 봐야 할 요소들을 정리했습니다.', 77, TO_DATE('2025-10-30 09:40:00', 'YYYY-MM-DD HH24:MI:SS'), 'N');

-- 9. 작성자: 4 (user03)
INSERT INTO FREE_BBS (FREE_NO, MEMBER_NO, FREE_TITLE, FREE_CONTENT, FREE_VIEW, FREE_CREATE_DATE, FREE_DELETE_STATUS)
VALUES (9, 4, '오늘 저녁에 치킨 시켜 먹을까요? 🍗🍺', '하루의 마무리는 역시 야식이죠! 모두 힘내세요!', 110, TO_DATE('2025-10-27 20:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'N');

-- 10. 작성자: 5 (user04)
INSERT INTO FREE_BBS (FREE_NO, MEMBER_NO, FREE_TITLE, FREE_CONTENT, FREE_VIEW, FREE_CREATE_DATE, FREE_DELETE_STATUS)
VALUES (10, 5, '배포 환경 구축 시 주의사항 (Docker)', 'Docker를 이용한 배포 경험 공유합니다. 궁금한 점은 댓글로 질문해주세요.', 55, TO_DATE('2025-10-26 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'N');

-- 11. 작성자: 1 (admin)
INSERT INTO FREE_BBS (FREE_NO, MEMBER_NO, FREE_TITLE, FREE_CONTENT, FREE_VIEW, FREE_CREATE_DATE, FREE_DELETE_STATUS)
VALUES (11, 1, '안녕하세요, 오늘 처음 가입했습니다!', '잘 부탁드립니다!', 23, TO_DATE('2025-10-30 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'N');

INSERT INTO FREE_BBS (FREE_NO, MEMBER_NO, FREE_TITLE, FREE_CONTENT, FREE_VIEW, FREE_CREATE_DATE, FREE_DELETE_STATUS)
VALUES (12, 1, '안녕하세요, 관리자입니다.!', '잘 부탁드립니다!', 23, TO_DATE('2025-10-30 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'N');

COMMIT;

-- 데이터 1: 작성자 2 (user01: 홍길동) - Java/Spring
INSERT INTO INFO_BBS 
(INFO_NO, MEMBER_NO, INFO_TITLE, INFO_CONTENT, INFO_VIEW, INFO_CREATE_DATE, INFO_DELETE_STATUS, INFO_CATEGORY)
VALUES 
(21, 2, 'Java 21의 주요 기능 업데이트 요약', 'Record Patterns와 Virtual Threads 등 최신 LTS 버전의 핵심 기능들을 정리했습니다. 백엔드 개발에 유용합니다.', 
180, TO_DATE('2025-10-29 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'N', 'JAVA'); 

-- 데이터 2: 작성자 4 (user03: 이영희) - SQL/DB
INSERT INTO INFO_BBS 
(INFO_NO, MEMBER_NO, INFO_TITLE, INFO_CONTENT, INFO_VIEW, INFO_CREATE_DATE, INFO_DELETE_STATUS, INFO_CATEGORY)
VALUES 
(22, 4, 'SQL 옵티마이저 작동 원리 및 쿼리 실행 계획 분석', 'Slow Query를 해결하기 위한 실행 계획(Execution Plan) 분석 방법을 자세히 다룹니다.', 
95, TO_DATE('2025-10-28 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'N', 'DB');

-- 데이터 3: 작성자 3 (user02: 김철수) - 프론트엔드/JS
INSERT INTO INFO_BBS 
(INFO_NO, MEMBER_NO, INFO_TITLE, INFO_CONTENT, INFO_VIEW, INFO_CREATE_DATE, INFO_DELETE_STATUS, INFO_CATEGORY)
VALUES 
(23, 3, 'Vue 3 Composition API 완전 정복 가이드', '반응형 변수 선언(ref, reactive)과 생명 주기 훅(Lifecycle Hooks) 활용 예시입니다.', 
210, TO_DATE('2025-10-27 14:20:00', 'YYYY-MM-DD HH24:MI:SS'), 'N', 'WEB');

-- 데이터 4: 작성자 5 (user04: 박민수) - DevOps/Cloud
INSERT INTO INFO_BBS 
(INFO_NO, MEMBER_NO, INFO_TITLE, INFO_CONTENT, INFO_VIEW, INFO_CREATE_DATE, INFO_DELETE_STATUS, INFO_CATEGORY)
VALUES 
(24, 5, 'AWS Lambda를 활용한 서버리스 백엔드 구축 팁', 'Python 런타임을 이용한 간단한 API 게이트웨이 연동 예제를 공유합니다.', 
150, TO_DATE('2025-10-26 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'N', 'CLOUD');

-- 데이터 5: 작성자 1 (admin: 최고 관리자) - IT 정책/기획
INSERT INTO INFO_BBS 
(INFO_NO, MEMBER_NO, INFO_TITLE, INFO_CONTENT, INFO_VIEW, INFO_CREATE_DATE, INFO_DELETE_STATUS, INFO_CATEGORY)
VALUES 
(25, 1, '2026년 IT 인프라 예산 편성 시 고려할 사항', '클라우드 비용 최적화와 보안 투자 비중에 대한 관리자 시점의 가이드입니다.', 
45, TO_DATE('2025-10-30 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'N', 'POLICY');

-- 데이터 6: 작성자 2 (user01: 홍길동) / 삭제 상태 'Y' 예시
INSERT INTO INFO_BBS 
(INFO_NO, MEMBER_NO, INFO_TITLE, INFO_CONTENT, INFO_VIEW, INFO_CREATE_DATE, INFO_DELETE_STATUS, INFO_CATEGORY)
VALUES 
(26, 2, '[삭제됨] Spring AOP를 이용한 로깅 처리 심화', '어드바이스 타입별 사용법에 대한 내용이 포함되었으나, 내용 보강을 위해 삭제 처리되었습니다.', 
10, TO_DATE('2025-10-25 08:45:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y', 'JAVA');

-- 데이터 7: 작성자 3 (user02: 김철수) - 프론트엔드/JS (조회수 높음)
INSERT INTO INFO_BBS 
(INFO_NO, MEMBER_NO, INFO_TITLE, INFO_CONTENT, INFO_VIEW, INFO_CREATE_DATE, INFO_DELETE_STATUS, INFO_CATEGORY)
VALUES 
(27, 3, 'TypeScript 제네릭을 활용한 타입 안전성 확보 방법', '함수 및 클래스에서 제네릭을 선언하고 사용하는 다양한 패턴을 다룹니다.', 
305, TO_DATE('2025-10-24 19:15:00', 'YYYY-MM-DD HH24:MI:SS'), 'N', 'WEB');

-- 데이터 8: 작성자 4 (user03: 이영희) - SQL/DB
INSERT INTO INFO_BBS 
(INFO_NO, MEMBER_NO, INFO_TITLE, INFO_CONTENT, INFO_VIEW, INFO_CREATE_DATE, INFO_DELETE_STATUS, INFO_CATEGORY)
VALUES 
(28, 4, 'Oracle에서 Window Function을 활용한 데이터 분석', 'RANK(), ROW_NUMBER(), LEAD() 등 분석 함수 사용법 예제입니다.', 
120, TO_DATE('2025-10-23 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'N', 'DB');

-- 데이터 9: 작성자 5 (user04: 박민수) - DevOps/Cloud
INSERT INTO INFO_BBS 
(INFO_NO, MEMBER_NO, INFO_TITLE, INFO_CONTENT, INFO_VIEW, INFO_CREATE_DATE, INFO_DELETE_STATUS, INFO_CATEGORY)
VALUES 
(29, 5, 'Kubernetes (K8s) 기본 개념과 필수 컴포넌트 정리', 'Pod, Service, Deployment의 역할과 구조를 초보자 눈높이에 맞춰 설명합니다.', 
250, TO_DATE('2025-10-22 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'N', 'DEVOPS');

-- 데이터 10: 작성자 1 (admin: 최고 관리자) - IT 정책/기획
INSERT INTO INFO_BBS 
(INFO_NO, MEMBER_NO, INFO_TITLE, INFO_CONTENT, INFO_VIEW, INFO_CREATE_DATE, INFO_DELETE_STATUS, INFO_CATEGORY)
VALUES 
(30, 1, '최신 소프트웨어 트렌드 분석 보고서 (2025년 하반기)', 'AI, Cloud Native, Cybersecurity 동향 요약 및 전망', 
80, TO_DATE('2025-10-21 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'N', 'POLICY');



COMMIT;

