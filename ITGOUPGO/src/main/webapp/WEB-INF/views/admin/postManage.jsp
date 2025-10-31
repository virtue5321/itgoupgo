<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %> <%-- ✅ JSTL fn 라이브러리 추가 --%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <%-- 게시판 이름 변수 (${boardName})를 사용하여 타이틀 동적 생성 --%>
    <title>${boardName} 관리</title>

    <link rel="stylesheet" href="<c:url value="/resources/css/adminStyle.css" />">
    <style>
        /* memberManage.jsp의 페이징 스타일을 그대로 복사 */
        .pagination-container {
            display: flex;
            justify-content: center; 
            padding: 20px 0;
            gap: 5px;
        }
        .pagination-container a, .pagination-container span {
            padding: 8px 12px;
            text-decoration: none; 
            color: #333;
            border: 1px solid #ddd;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        /* ... (기타 페이징 스타일) ... */
        .pagination-container a:hover { background-color: #f0f0f0; }
        .pagination-container .active { background-color: #5a5ce8; color: white; border: 1px solid #5a5ce8; }
        .pagination-container .disabled { color: #ccc; pointer-events: none; background-color: #f9f9f9; }
        
        /* 게시글 관리에 필요한 추가 스타일 */
        .action-cell {
             white-space: nowrap;
        }
        /* 검색 폼 스타일 (인라인 스타일 그대로 유지) */
        .search-form {
            margin-bottom: 20px; display:flex; gap:10px; align-items:center; background:#fff; padding:15px; border-radius:10px;
            box-shadow:0 2px 5px rgba(0,0,0,0.05);
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
        <%-- ✅ [수정된 부분] 드롭다운 사이드바 로직 적용 --%>
        <aside class="sidebar">
            <ul>
                <li><a href="<c:url value="/admin/dashboard" />">🏠 대시보드</a></li>
                <li><a href="<c:url value="/admin/member" />">👥 회원 관리</a></li>
        
                <%-- 현재 페이지 URI를 변수에 저장 --%>
                <c:set var="currentPath" value="${pageContext.request.requestURI}" />
                <%-- 현재 URI가 게시글 관련 페이지인지 체크 --%>
                <c:set var="isPostRelated" 
                    value="${fn:contains(currentPath, '/freeBbsManage') || 
                            fn:contains(currentPath, '/infoBbsManage') || 
                            fn:contains(currentPath, '/itBbsManage') ||
                            fn:contains(currentPath, '/noticeBbsManage') ||
                            fn:contains(currentPath, '/studyBbsManage') ||
                            fn:contains(currentPath, '/knowledgeBbsManage')}" />
                            
                <%-- 게시글 관리 메뉴 항목: 현재 페이지가 게시글 관련이면 메뉴를 열고 활성화 --%>
                <li id="postManageMenu" class="${isPostRelated ? 'menu-open' : ''}">
                    <a href="javascript:void(0);" 
                       class="${isPostRelated ? 'active' : ''}" 
                       onclick="toggleSubmenu('postManageMenu')">📝 게시글 관리</a>
                    
                    <ul class="submenu">
                        <%-- 서브 메뉴 항목: 현재 페이지 URL과 일치하면 'sub-active'로 하이라이팅 --%>
                        <li><a href="<c:url value="/admin/freeBbsManage" />" 
                               class="${fn:contains(currentPath, '/freeBbsManage') ? 'sub-active' : ''}">자유 게시판</a></li>
                        
                        <li><a href="<c:url value="/admin/infoBbsManage" />" 
                               class="${fn:contains(currentPath, '/infoBbsManage') ? 'sub-active' : ''}">정보 공유 게시판</a></li>
                               
                        <li><a href="<c:url value="/admin/itBbsManage" />" 
                               class="${fn:contains(currentPath, '/itBbsManage') ? 'sub-active' : ''}">IT 기술 게시판</a></li>
                               
                        <li><a href="<c:url value="/admin/noticeBbsManage" />" 
                               class="${fn:contains(currentPath, '/noticeBbsManage') ? 'sub-active' : ''}">공지사항 게시판</a></li>

                        <li><a href="<c:url value="/admin/studyBbsManage" />" 
                               class="${fn:contains(currentPath, '/studyBbsManage') ? 'sub-active' : ''}">스터디 게시판</a></li>

                        <li><a href="<c:url value="/admin/knowledgeBbsManage" />" 
                               class="${fn:contains(currentPath, '/knowledgeBbsManage') ? 'sub-active' : ''}">지식인 게시판</a></li>
                    </ul>
                </li>
                
                <li><a href="<c:url value="/admin/reply" />">💬 댓글 관리</a></li>
                <li><a href="<c:url value="/admin/stats" />">📊 통계</a></li>
                <li><a href="<c:url value="/admin/logout" />">🚪 로그아웃</a></li>
            </ul>
        </aside>

        <main>
            <%-- 💡 제목 및 설명 --%>
            <h1>📝 ${boardName} 관리</h1>
            <p>등록된 게시글 목록을 확인하고 관리할 수 있습니다. (게시판: ${boardName})</p>

            <%-- ✅ 검색 폼 --%>
            <form class="search-form" id="searchForm" 
                action="<c:url value="/admin/searchPostTitle" />" method="get">
                
                <select name="searchCondition" id="searchCondition"
                        style="padding: 8px; border: 1px solid #ccc; border-radius: 4px;">
                    <option value="searchPostTitle" ${searchCondition eq 'searchPostTitle' ? 'selected' : ''}>제목</option>
                    <option value="searchPostWriter" ${searchCondition eq 'searchPostWriter' ? 'selected' : ''}>작성자</option>
                </select>
                
                <input type="text" name="keyword"
                    value="${searchKeyword}" 
                    placeholder="검색어를 입력하세요" 
                    style="flex-grow: 1; padding: 8px; border: 1px solid #ccc; border-radius: 4px;">
                
                <button type="submit" style="background:#5a5ce8;
                    color:white; border:none; padding:8px 15px; border-radius:4px; cursor:pointer;">검색</button>
            </form>

            <%-- ✅ 일괄 삭제 폼 --%>
            <form id="bulkDeleteForm" action="<c:url value="/admin/deleteCheckPost" />" method="post" style="display:none;"></form>

            <div style="display:flex; justify-content:flex-end; align-items:center; margin-bottom:10px;">
                <button class="btn btn-danger" onclick="confirmBulkDelete()">
                    선택 게시글 일괄 삭제
                </button>
            </div>

            <table>
                <thead>
                    <tr>
                        <th style="width:5%;"><input type="checkbox" id="selectAllCheckboxPost"></th> 
                        <th style="width:8%;">글번호</th>
                        <th style="width:30%;">제목</th>
                        <th style="width:15%;">작성자</th>
                        <th style="width:12%;">작성일</th>
                        <th style="width:8%;">조회수</th>
                        <th style="width:12%;">관리</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${empty bbsList}">
                            <tr>
                                <td colspan="7">
                                    <c:if test="${not empty searchKeyword}">
                                        "${searchKeyword}"에 대한 검색 결과가 없습니다.
                                    </c:if>
                                    <c:if test="${empty searchKeyword}">
                                        등록된 게시글이 없습니다.
                                    </c:if>
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="post" items="${bbsList}">
                                <tr>
                                    <%-- 일괄 삭제를 위한 체크박스 --%>
                                    <td><input type="checkbox" class="itemCheckboxPost" name="bbsNoList" value="${post.bbsNo}"></td>
                                    <td>${post.bbsNo}</td>
                                    
                                    <td class="text-start">
                                        <%-- 게시글 상세 보기 링크 --%>
                                        <a href="<c:url value="/admin/postDetail?bbsNo=${post.bbsNo}" />" 
                                           style="text-decoration: underline; color: #5a5ce8;">
                                            ${post.bbsTitle}
                                        </a>
                                        <c:if test="${post.replyCount > 0}">
                                            <span class="badge bg-secondary ms-1">${post.replyCount}</span>
                                        </c:if>
                                    </td>
                                    
                                    <td>${post.bbsWriter}</td>
                                    <td><fmt:formatDate value="${post.createDate}" pattern="yyyy-MM-dd" /></td>
                                    <td>${post.bbsCount}</td>
                                    
                                    <td class="action-cell">
                                        <%-- 단일 삭제 버튼 --%>
                                        <button class="btn btn-danger" style="padding: 4px 8px; font-size: 0.8rem;"
                                            onclick="if(confirm('${post.bbsNo}번 게시글을 정말 삭제하시겠습니까?')) { 
                                                    location.href='<c:url value="/admin/deletePost?bbsNo=${post.bbsNo}" />';
                                            }">
                                            삭제
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>

            <%-- ✅ 페이징바 --%>
            <div class="pagination-container">
                <c:choose>
                    <c:when test="${not empty searchKeyword}">
                        <c:set var="pageLinkUrl" value="/admin/${searchCondition}" />
                        <c:set var="searchQueryParam" value="&keyword=${searchKeyword}" />
                    </c:when>
                    <c:otherwise>
                        <c:set var="pageLinkUrl" value="/admin/post" />
                        <c:set var="searchQueryParam" value="" />
                    </c:otherwise>
                </c:choose>

                <c:set var="pi" value="${pageInfo}" />

                <%-- 1. 맨 처음으로 (<<) --%>
                <c:choose>
                    <c:when test="${pi.currentPage le 1}">
                        <span class="disabled">&lt;&lt;</span>
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value="${pageLinkUrl}" />?currentPage=1${searchQueryParam}">&lt;&lt;</a>
                    </c:otherwise>
                </c:choose>

                <%-- 2. 이전 페이지 그룹으로 (<) --%>
                <c:choose>
                    <c:when test="${pi.currentPage le 1}">
                        <span class="disabled">&lt;</span>
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value="${pageLinkUrl}" />?currentPage=${pi.currentPage - 1}${searchQueryParam}">&lt;</a>
                    </c:otherwise>
                </c:choose>

                <%-- 3. 페이지 번호 --%>
                <c:forEach begin="${pi.startPage}" end="${pi.endPage}" var="p">
                    <c:choose>
                        <c:when test="${pi.currentPage eq p}">
                            <span class="active">${p}</span>
                        </c:when>
                        <c:otherwise>
                            <a href="<c:url value="${pageLinkUrl}" />?currentPage=${p}${searchQueryParam}">${p}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <%-- 4. 다음 페이지 그룹으로 (>) --%>
                <c:choose>
                    <c:when test="${pi.currentPage eq pi.maxPage || pi.maxPage eq 0}">
                        <span class="disabled">&gt;</span>
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value="${pageLinkUrl}" />?currentPage=${pi.currentPage + 1}${searchQueryParam}">&gt;</a>
                    </c:otherwise>
                </c:choose>

                <%-- 5. 맨 끝으로 (>>) --%>
                <c:choose>
                    <c:when test="${pi.currentPage eq pi.maxPage || pi.maxPage eq 0}">
                        <span class="disabled">&gt;&gt;</span>
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value="${pageLinkUrl}" />?currentPage=${pi.maxPage}${searchQueryParam}">&gt;&gt;</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </main>
    </div>

    <footer>ⓒ 2025 IT GO UP GO. All Rights Reserved.</footer>


<script>
    // ✅ [추가] 드롭다운 메뉴를 토글하는 JavaScript 함수
    function toggleSubmenu(menuId) {
        document.getElementById(menuId).classList.toggle('menu-open');
    }

    // 1. 검색 폼 액션 변경 로직
    document.getElementById('searchForm').addEventListener('submit', function(e) {
        const condition = document.getElementById('searchCondition').value;
        const form = e.target;
        // 선택된 옵션(searchPostTitle 또는 searchPostWriter)에 따라 action 경로 변경
        form.action = `<c:url value="/admin/" />` + condition;
    });

    // 2. 일괄 삭제 로직 (confirmBulkDelete 함수)
    function confirmBulkDelete() {
        const selectedCheckboxes = document.querySelectorAll('.itemCheckboxPost:checked');
        if (selectedCheckboxes.length === 0) {
            alert('일괄 삭제할 게시글을 1개 이상 선택해 주세요.');
            return;
        }

        if (confirm(`총 ${selectedCheckboxes.length}건의 게시글을 일괄 삭제 처리하시겠습니까?`)) {
            const form = document.getElementById('bulkDeleteForm');
            form.innerHTML = '';
            
            selectedCheckboxes.forEach(checkbox => {
                const hiddenInput = document.createElement('input');
                hiddenInput.type = 'hidden';
                hiddenInput.name = 'bbsNoList'; // Controller의 @RequestParam 이름과 일치
                hiddenInput.value = checkbox.value;
                form.appendChild(hiddenInput);
            });
            
            form.submit();
        }
    }

    // 3. 체크박스 전체 선택/해제 기능
    document.addEventListener('DOMContentLoaded', (event) => {
        const selectAllCheckbox = document.getElementById('selectAllCheckboxPost');
        const itemCheckboxes = document.querySelectorAll('.itemCheckboxPost');

        selectAllCheckbox.addEventListener('change', function() {
            itemCheckboxes.forEach(checkbox => {
                checkbox.checked = this.checked;
            });
        });
        
        itemCheckboxes.forEach(checkbox => {
            checkbox.addEventListener('change', () => {
                const checkedItems = document.querySelectorAll('.itemCheckboxPost:checked').length;
                if (!checkbox.checked) {
                    selectAllCheckbox.checked = false;
                } else if (checkedItems === itemCheckboxes.length) {
                    selectAllCheckbox.checked = true;
                }
            });
        });
    });
 </script>
</body>
</html>