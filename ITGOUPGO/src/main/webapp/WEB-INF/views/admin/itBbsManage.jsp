<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>IT 뉴스 게시판 관리</title>

    <link rel="stylesheet" href="<c:url value="/resources/css/adminStyle.css" />">
    <style>
        .deleted-post {
            background-color: #f8f8f8; 
            color: #999; 
        }
        .deleted-post a, .deleted-post .text-danger, .deleted-post .text-secondary {
            color: #999 !important;
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
        <%-- ✅ 사이드바: IT 뉴스 게시판 활성화 --%>
        <aside class="sidebar">
            <ul>
                <li><a href="<c:url value="/admin/dashboard" />">🏠 대시보드</a></li>
                <li><a href="<c:url value="/admin/member" />">👥 회원 관리</a></li>

                <li id="postManageMenu" class="menu-open">
                    <a href="javascript:void(0);" class="active" onclick="toggleSubmenu('postManageMenu')">📝 게시글 관리</a>
                    
                    <ul class="submenu">
                        <li><a href="<c:url value="/admin/freeBbsManage" />">자유 게시판</a></li>
                        <li><a href="<c:url value="/admin/infoBbsManage" />">정보 공유 게시판</a></li>
                        <li><a href="<c:url value="/admin/itBbsManage" />" class="sub-active">IT 뉴스 게시판</a></li>
                        <li><a href="<c:url value="/admin/noticeBbsManage" />">공지사항 게시판</a></li>
		                <li><a href="<c:url value="/admin/studyBbsManage" />">스터디 게시판</a></li>
		                <li><a href="<c:url value="/admin/knowledgeBbsManage" />">지식인 게시판</a></li>
                    </ul>
                </li>
                
                <li><a href="<c:url value="/admin/reply" />">💬 댓글 관리</a></li>
                <li><a href="<c:url value="/admin/stats" />">📊 통계</a></li>
                <li><a href="<c:url value="/admin/logout" />">🚪 로그아웃</a></li>
            </ul>
        </aside>
        
        <main>
            <h1>📝 IT 뉴스 게시판 관리</h1>
            <p>IT 뉴스 게시판에 등록된 게시글 목록을 확인하고 관리할 수 있습니다.</p>
          
            <form id="bulkDeleteForm" action="<c:url value="/admin/deleteItBbsCheck" />" method="post" style="display:none;"></form>

            <div style="display:flex; justify-content:flex-end; margin-bottom:10px;">
                <button class="btn btn-danger" onclick="confirmBulkDelete()">선택 게시글 일괄 삭제</button>
            </div>

            <table>
                <thead>
                    <tr>
                        <th style="width:5%;"><input type="checkbox" id="selectAllCheckboxPost"></th> 
                        <th style="width:8%;">글번호</th>
                        <th style="width:30%;">제목</th>
                        <th style="width:15%;">리포터</th> <%-- [변경] 작성자 -> 리포터 --%>
                        <th style="width:12%;">작성일</th>
                        <th style="width:8%;">조회수</th>
                        <th style="width:12%;">관리</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${empty itBbsList}"> 
                            <tr><td colspan="7"><c:if test="${not empty searchKeyword}">"${searchKeyword}"에 대한 검색 결과가 없습니다.</c:if><c:if test="${empty searchKeyword}">등록된 게시글이 없습니다.</c:if></td></tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="post" items="${itBbsList}"> 
                                <tr class="${post.itDeleteStatus eq 'Y' ? 'deleted-post' : ''}"> 
                                    <td><input type="checkbox" class="itemCheckboxPost" name="bbsNoList" value="${post.itNo}"
                                                <c:if test="${post.itDeleteStatus eq 'Y'}">disabled</c:if>></td> 
                                    
                                    <td>${post.itNo}</td> 
                                                                      
                                    <td class="text-start">
                                        <c:choose>
                                            <c:when test="${post.itDeleteStatus eq 'Y'}"> 
                                                <span class="text-danger">❌ [삭제됨]</span> ${post.itTitle} 
                                            </c:when>
                                            <c:otherwise>
                                                <a href="<c:url value="/admin/itBbsPostDetail?bbsNo=${post.itNo}" />"> 
                                                    ${post.itTitle} 
                                                </a>
                                            </c:otherwise>
                                        </c:choose>
                                    </td> 
                                    
                                    <td>${post.reporter}</td> 
                                    
                                    <td>
                                        <fmt:formatDate value="${post.itCreateDate}" pattern="yyyy-MM-dd" /> 
                                    </td>
                                    
                                    <td>${post.itView}</td> 
                                    
                                    <td class="action-cell">
                                        <c:choose>
                                            <c:when test="${post.itDeleteStatus eq 'N'}"> 
                                                <button class="btn btn-danger"
                                                    onclick="if(confirm('${post.itNo}번 게시글을 정말 삭제하시겠습니까?')) { deleteSinglePost(${post.itNo}); }"> 
                                                    삭제
                                                </button>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="text-secondary">삭제 완료</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>

            <div class="pagination-container">
                <c:choose>
                    <c:when test="${not empty searchKeyword}">
                        <c:set var="pageLinkUrl" value="/admin/${searchCondition}" /><c:set var="searchQueryParam" value="&keyword=${searchKeyword}" />
                    </c:when>
                    <c:otherwise>
                        <c:set var="pageLinkUrl" value="/admin/itBbsManage" /><c:set var="searchQueryParam" value="" /> 
                    </c:otherwise>
                </c:choose>
                <c:set var="pi" value="${pageInfo}" />
                <c:choose><c:when test="${pi.currentPage le 1}"><span class="disabled">&lt;&lt;</span></c:when><c:otherwise><a href="<c:url value="${pageLinkUrl}" />?currentPage=1${searchQueryParam}">&lt;&lt;</a></c:otherwise></c:choose>
                <c:choose><c:when test="${pi.currentPage le 1}"><span class="disabled">&lt;</span></c:when><c:otherwise><a href="<c:url value="${pageLinkUrl}" />?currentPage=${pi.currentPage - 1}${searchQueryParam}">&lt;</a></c:otherwise></c:choose>
                <c:forEach begin="${pi.startPage}" end="${pi.endPage}" var="p">
                    <c:choose><c:when test="${pi.currentPage eq p}"><span class="active">${p}</span></c:when><c:otherwise><a href="<c:url value="${pageLinkUrl}" />?currentPage=${p}${searchQueryParam}">${p}</a></c:otherwise></c:choose>
                </c:forEach>
                <c:choose><c:when test="${pi.currentPage eq pi.maxPage || pi.maxPage eq 0}"><span class="disabled">&gt;</span></c:when><c:otherwise><a href="<c:url value="${pageLinkUrl}" />?currentPage=${pi.currentPage + 1}${searchQueryParam}">&gt;</a></c:otherwise></c:choose>
                <c:choose><c:when test="${pi.currentPage eq pi.maxPage || pi.maxPage eq 0}"><span class="disabled">&gt;&gt;</span></c:when><c:otherwise><a href="<c:url value="${pageLinkUrl}" />?currentPage=${pi.maxPage}${searchQueryParam}">&gt;&gt;</a></c:otherwise></c:choose>
            </div>
        </main>
    </div>

    <footer>ⓒ 2025 IT GO UP GO. All Rights Reserved.</footer>

<script>
    function toggleSubmenu(menuId) { document.getElementById(menuId).classList.toggle('menu-open'); }
    
    function deleteSinglePost(itNo) {
        if(confirm(itNo + '번 게시글을 정말 삭제하시겠습니까?')) { 
            location.href='<c:url value="/admin/deleteItBbs" />?bbsNo=' + itNo; 
        }
    }

    function confirmBulkDelete() {
        const selectedCheckboxes = Array.from(document.querySelectorAll('.itemCheckboxPost:checked'))
            .filter(checkbox => !checkbox.closest('tr').classList.contains('deleted-post'));
            
        if (selectedCheckboxes.length === 0) {
            alert('일괄 삭제할 게시글을 1개 이상 선택해 주세요. (이미 삭제된 게시글은 제외됩니다.)');
            return;
        }

        if (confirm('총 ' + selectedCheckboxes.length + '건의 게시글을 일괄 삭제 처리하시겠습니까?')) {
            const form = document.getElementById('bulkDeleteForm');
            form.innerHTML = '';
            selectedCheckboxes.forEach(checkbox => {
                const hiddenInput = document.createElement('input');
                hiddenInput.type = 'hidden';
                hiddenInput.name = 'bbsNoList';
                hiddenInput.value = checkbox.value;
                form.appendChild(hiddenInput);
            });
            form.submit();
        }
    }

    document.addEventListener('DOMContentLoaded', (event) => {
        const selectAllCheckbox = document.getElementById('selectAllCheckboxPost');
        const itemCheckboxes = document.querySelectorAll('.itemCheckboxPost');
        selectAllCheckbox.addEventListener('change', function() { itemCheckboxes.forEach(checkbox => { checkbox.checked = this.checked; }); });
        itemCheckboxes.forEach(checkbox => {
            checkbox.addEventListener('change', () => {
                const checkedItems = document.querySelectorAll('.itemCheckboxPost:checked').length;
                if (!checkbox.checked) { selectAllCheckbox.checked = false; } else if (checkedItems === itemCheckboxes.length) { selectAllCheckbox.checked = true; }
            });
        });

        const postManageMenu = document.getElementById('postManageMenu');
        if (postManageMenu && !postManageMenu.classList.contains('menu-open')) {
             postManageMenu.classList.add('menu-open');
        }
    });
 </script>
</body>
</html>