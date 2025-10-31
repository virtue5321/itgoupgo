<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>자유게시판 글쓰기</title>
    <style>
        html, body {
            height: 100%;
            min-height: 100vh;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
        }
        body {
            background: #f7f8fa;
        }
        .main-content {
            flex: 1;
            width: 100%;
            max-width: 1200px;
            margin-left: auto;
            margin-right: auto;
            padding-left: 32px;
            padding-right: 32px;
        }
        footer {
            width: 100%;
        }
        .form-container {
            max-width: 800px;
            margin: 48px auto 30px auto;
            background: #fff;
            border-radius: 24px;
            box-shadow: 0 1.5px 16px 2px #eaeaee33;
            padding: 50px 40px 40px 40px;
        }
        .form-group {
            margin-bottom: 1.8rem;
        }
        .form-label {
            font-weight: 600;
            margin-bottom: 0.6rem;
            display: inline-block;
            color: #312b53;
            font-size: 1.05rem;
        }
        input[type='text'], textarea, input[type='file'] {
            width: 100%;
            border: 1px solid #dde3ec;
            border-radius: 12px;
            padding: 0.75rem 1rem;
            margin-top: 0.3rem;
            font-size: 1rem;
            transition: border 0.2s, box-shadow 0.2s;
            background: #fafbff;
        }
        input:focus, textarea:focus {
            border: 1.5px solid #856fe5;
            outline: none;
            box-shadow: 0 0 0 3px rgba(133, 111, 229, 0.1);
            background: #fff;
        }
        textarea {
            min-height: 200px;
            resize: vertical;
            font-family: inherit;
        }
        .btn-submit {
            background: #856fe5;
            color: #fff;
            border: none;
            border-radius: 12px;
            padding: 12px 36px;
            font-size: 1.08rem;
            font-weight: 600;
            letter-spacing: 0.5px;
            cursor: pointer;
            transition: background 0.2s, transform 0.1s;
        }
        .btn-submit:hover {
            background: #6b5dd0;
            transform: translateY(-1px);
        }
        .btn-cancel {
            background: #f2f2f2;
            color: #555;
            border: none;
            border-radius: 12px;
            padding: 12px 36px;
            font-size: 1.08rem;
            font-weight: 600;
            cursor: pointer;
            margin-right: 10px;
            transition: background 0.2s;
        }
        .btn-cancel:hover {
            background: #e0e0e0;
        }
        h2 {
            color: #312b53;
        }
        @media (max-width: 576px) {
            .main-content {
                padding-left: 8px;
                padding-right: 8px;
            }
            .form-container {
                padding: 30px 20px 25px 20px;
            }
        }
    </style>
</head>
<body>
    <!-- 메뉴바(헤더) 영역 -->
    <c:import url="../common/menubar.jsp"/>
    
    <!-- 메인 컨텐츠 영역 -->
    <div class="main-content">
        <div class="form-container">
            <h2 class="text-center mb-4 fw-bold">자유게시판 글쓰기</h2>
            <form action="insert" method="post" enctype="multipart/form-data" autocomplete="off">
                <div class="form-group">
                    <label class="form-label">제목</label>
                    <input type="text" name="freeTitle" maxlength="80" required placeholder="제목을 입력해주세요">
                </div>
                <div class="form-group">
                    <label class="form-label">내용</label>
                    <textarea name="freeContent" maxlength="2000" required placeholder="내용을 입력해주세요"></textarea>
                </div>
                <div class="form-group">
                    <label class="form-label">첨부 파일 (선택)</label>
                    <input type="file" name="upfile" accept="image/*,.pdf,.doc,.docx">
                </div>
                <div style="text-align: right; margin-top: 2rem;">
                    <button type="button" class="btn-cancel" onclick="history.back();">취소</button>
                    <button type="submit" class="btn-submit">등록하기</button>
                </div>
            </form>
        </div>
    </div>
    
    <!-- 푸터 영역 -->
    <c:import url="../common/footer.jsp"/>
</body>
</html>