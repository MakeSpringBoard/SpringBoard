<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${board.boardTitle}</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- 비동기 요청 -->
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            font-size: 2em;
            margin-bottom: 20px;
        }
        p {
            margin-bottom: 20px;
        }
        .meta {
            font-size: 0.9em;
            color: #555;
            margin-bottom: 20px;
        }
        img {
            max-width: 50%;
            height: 50%;
            margin-bottom: 20px;
        }
        .like-dislike-section {
            margin-top: 20px;
            text-align: right;
        }
        .like-dislike-btn {
        cursor: pointer;
        font-size: 16px;
        padding: 5px 10px;
        margin-left: 10px;
    	}
    	.like-dislike-btn.disabled {
        	cursor: not-allowed;
    	}
    </style>
    
</head>
<body>
    <div class="container">
        <h1>${board.boardTitle}</h1>
        <div class="meta">
            <span>작성자: ${board.boardWriterProfile}</span> |
            <span>작성일: ${board.boardWriteDate}</span> |
            <span>조회수: ${board.boardClickCount}</span>
        </div>
        <c:if test="${not empty board.boardImage}">
            <img src="${board.boardImage}" alt="${board.boardTitle}">
        </c:if>
        <p>${board.boardContent}</p>
        <div class="buttons">
    		<c:if test="${board.boardWriterId == user.userId}">
        		<button onclick="location.href='/editBoard/${board.boardNumber}'">수정</button>
        		<button onclick="location.href='/deleteBoard/${board.boardNumber}'">삭제</button>
    		</c:if>
    		<button onclick="location.href='/boardList'">목록</button>
		</div>
		<div class="like-dislike-section">
    		<span id="likeCount">${board.boardLikeCount}</span>
    		<span class="like-dislike-btn <c:if test="${board.boardWriterId == user.userId}">disabled</c:if>" 
          		onclick="<c:if test="${board.boardWriterId != user.userId}">updateLikeDislike(${board.boardNumber}, 'like')</c:if>">좋아요</span> |
    		<span id="dislikeCount">${board.boardHateCount}</span>
    		<span class="like-dislike-btn <c:if test="${board.boardWriterId == user.userId}">disabled</c:if>" 
          		onclick="<c:if test="${board.boardWriterId != user.userId}">updateLikeDislike(${board.boardNumber}, 'dislike')</c:if>">싫어요</span>
		</div>
        <script>
        function updateLikeDislike(boardNumber, type) {
            $.ajax({
                url: '/updateLikeDislike',
                type: 'POST',
                data: {
                    boardNumber: boardNumber,
                    type: type
                },
                success: function(response) {
                    if (response.success) {
                        if (type === 'like') {
                            $('#likeCount').text(response.newCount);
                        } else if (type === 'dislike') {
                            $('#dislikeCount').text(response.newCount);
                        }
                    } else {
                        alert('오류가 발생했습니다. 다시 시도해주세요.');
                    }
                },
                error: function() {
                    alert('서버와의 통신 중 오류가 발생했습니다.');
                }
            });
        }
    </script>
    </div>
</body>
</html>
