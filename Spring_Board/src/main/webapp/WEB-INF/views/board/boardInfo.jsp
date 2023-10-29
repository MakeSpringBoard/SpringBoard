<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${board.boardTitle}</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 비동기 요청 -->
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

.comments-section {
	max-width: 800px;
	margin: 40px auto;
	padding: 20px;
	background-color: #f9f9f9;
	border: 1px solid #ddd;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.comment {
	padding: 10px;
	border-bottom: 1px solid #ccc;
	margin-bottom: 10px; /* 댓글 간의 간격 조정 */
	display: flex; /* Flexbox 레이아웃 사용 */
	align-items: center; /* 세로 중앙 정렬 */
	justify-content: space-between; /* 양쪽에 여백을 두고 중앙에 내용을 배치 */
}

.comment-body {
	display: flex; /* Flexbox 레이아웃 사용 */
	align-items: center; /* 세로 중앙 정렬 */
}

.comment-author {
	font-weight: bold;
	font-size: 1.1em;
	color: #333;
	margin-right: 10px; /* 작성자와 내용 사이의 간격 조정 */
}

.comment-time {
	font-size: 0.9em;
	color: #888;
}

.comment-content {
	flex-grow: 1; /* 남은 공간을 채우도록 설정 */
}

.comment-form {
	margin-top: 20px;
}

.comment-input {
	width: 100%;
	padding: 8px;
	box-sizing: border-box;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.comment-submit-btn {
	width: 100%;
	margin-top: 10px;
	padding: 8px;
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.comment-submit-btn:hover {
	background-color: #45a049;
}
</style>

</head>
<body>
	<div class="container">
		<h1>${board.boardTitle}</h1>
		<div class="meta">
			<span>작성자: ${board.boardWriterProfile}</span> | <span>작성일:
				${board.boardWriteDate}</span> | <span>조회수: ${board.boardClickCount}</span>
		</div>
		<c:if test="${not empty board.boardImage}">
			<img src="${board.boardImage}" alt="${board.boardTitle}">
		</c:if>
		<p>${board.boardContent}</p>
		<div class="buttons">
			<c:if test="${board.boardWriterId == user.userId}">
				<button onclick="location.href='/editBoard/${board.boardNumber}'">수정</button>
			</c:if>
			<c:choose>
					<c:when test="${user.userId == 'admin'}">
						<button
							onclick="location.href='/deleteBoard/${board.boardNumber}'">삭제</button>
					</c:when>
					<c:when test="${board.boardWriterId == user.userId}">
						<button
							onclick="location.href='/deleteBoard/${board.boardNumber}'">삭제</button>
					</c:when>
				</c:choose>
			<button onclick="location.href='/boardList'">목록</button>
		</div>
		<div class="like-dislike-section">
			<span id="likeCount">${board.boardLikeCount}</span> <span
				class="like-dislike-btn <c:if test="${board.boardWriterId == user.userId}">disabled</c:if>"
				onclick="<c:if test="${board.boardWriterId != user.userId}">updateLikeDislike(${board.boardNumber}, 'like')</c:if>">좋아요</span>
			| <span id="dislikeCount">${board.boardHateCount}</span> <span
				class="like-dislike-btn <c:if test="${board.boardWriterId == user.userId}">disabled</c:if>"
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

	<!-- 댓글 섹션 -->
	<div class="comments-section">
		<h3>
			댓글 <span id="comment-count"></span>
		</h3>
		<div id="comments-container">
			<!-- 기존 댓글 목록을 여기에 표시 -->
		</div>
		<!-- 댓글 작성 폼 -->
		<div class="comment-form">
			<textarea id="comment-input" class="comment-input"
				placeholder="댓글을 입력하세요..."></textarea>
			<button class="comment-submit-btn" id="submitCommentButton">댓글
				작성</button>
		</div>
	</div>

	<script>
	$(document).ready(function() {
    loadComments();

    function loadComments() {
        $.ajax({
            url: '/getComments',
            type: 'GET',
            data: {
                boardNumber: ${board.boardNumber}
            },
            success: function(comments) {
            	$('#comments-container').empty();
            	$('#comment-count').text('(' + comments.length + ')');
                comments.forEach(function(comment) {
                    $('#comments-container').append(
                        '<div class="comment">' +
                        '    <div class="comment-body">' +
                        '        <span class="comment-author">' + comment.commentUserProfile + '</span>' +
                        '        <div class="comment-content">' + comment.commentContent + '</div>' +
                        '    </div>' +
                        '    <span class="comment-time">' + comment.commentWriteDate + '</span>' +
                        '</div>'
                    );
                });
            },
            error: function() {
                alert('댓글을 불러오는데 실패했습니다.');
            }
        });
    }

    function submitComment() {
        var commentContent = $('#comment-input').val().trim();
        if (commentContent === '') {
            alert('댓글을 입력해주세요.');
            return;
        }

        $.ajax({
            url: '/saveComment',
            type: 'POST',
            data: {
                boardNumber: ${board.boardNumber},
                commentContent: commentContent
            },
            success: function(response) {
                if (response.success) {
                    loadComments();
                    $('#comment-input').val('');
                } else {
                    alert(response.message);
                }
            },
            error: function() {
                alert('댓글 작성 중 오류가 발생했습니다.');
            }
        });
    }

    $('#submitCommentButton').on('click', submitComment);
});
</script>
</body>
</html>
