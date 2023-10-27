package com.bit.board.model.dto;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class BoardDto {
	private int boardNumber;
	private String boardTitle;
	private String boardContent;
	private String boardImage;
	private String boardWriterProfile;
	private String boardWriteDate;
	private int boardClickCount;
	private int boardLikeCount;
	private int boardHateCount;
	private int boardCommentCount;
	
	public void setBoardWriteDateToNow() {
        this.boardWriteDate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
    }
	
	public int getBoardNumber() {
		return boardNumber;
	}
	public void setBoardNumber(int boardNumber) {
		this.boardNumber = boardNumber;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getBoardImage() {
		return boardImage;
	}
	public void setBoardImage(String boardImage) {
		this.boardImage = boardImage;
	}
	public String getBoardWriterProfile() {
		return boardWriterProfile;
	}
	public void setBoardWriterProfile(String boardWriterProfile) {
		this.boardWriterProfile = boardWriterProfile;
	}
	public String getBoardWriteDate() {
		return boardWriteDate;
	}
	public void setBoardWriteDate(String boardWriteDate) {
		this.boardWriteDate = boardWriteDate;
	}
	public int getBoardClickCount() {
		return boardClickCount;
	}
	public void setBoardClickCount(int boardClickCount) {
		this.boardClickCount = boardClickCount;
	}
	public int getBoardLikeCount() {
		return boardLikeCount;
	}
	public void setBoardLikeCount(int boardLikeCount) {
		this.boardLikeCount = boardLikeCount;
	}
	public int getBoardHateCount() {
		return boardHateCount;
	}
	public void setBoardHateCount(int boardHateCount) {
		this.boardHateCount = boardHateCount;
	}
	public int getBoardCommentCount() {
		return boardCommentCount;
	}
	public void setBoardCommentCount(int boardCommentCount) {
		this.boardCommentCount = boardCommentCount;
	}
	
	
}
