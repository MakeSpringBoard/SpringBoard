package com.bit.board.model.dto;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class CommentDto {
	private int commentId;
	private int boardNumber;
	private String userId;
	private String commentContent;
	private String commentWriteDate;
	private String commentUserProfile;
	
	public void setCommentWriteDateToNow() {
        this.commentWriteDate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
    }
	
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public int getBoardNumber() {
		return boardNumber;
	}
	public void setBoardNumber(int boardNumber) {
		this.boardNumber = boardNumber;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public String getCommentWriteDate() {
		return commentWriteDate;
	}
	public void setCommentWriteDate(String commentWriteDate) {
		this.commentWriteDate = commentWriteDate;
	}
	public String getCommentUserProfile() {
		return commentUserProfile;
	}
	public void setCommentUserProfile(String commentUserProfile) {
		this.commentUserProfile = commentUserProfile;
	}
	
	
}
