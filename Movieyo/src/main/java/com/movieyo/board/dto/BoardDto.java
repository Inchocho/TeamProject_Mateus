package com.movieyo.board.dto;

import java.sql.Date;
import java.util.Objects;

public class BoardDto {
	private int boardNo;
	private int userNo;
	private String boardHead;
	private String boardTitle;
	private String boardContent;
	private int boardCount;
	private Date boardCredate;
	private Date boardModdate;
	
	public BoardDto(int boardNo, int userNo, String boardHead, String boardTitle, String boardContent, int boardCount,
			Date boardCredate, Date boardModdate) {
		super();
		this.boardNo = boardNo;
		this.userNo = userNo;
		this.boardHead = boardHead;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardCount = boardCount;
		this.boardCredate = boardCredate;
		this.boardModdate = boardModdate;
	}

	public int getBoard_No() {
		return boardNo;
	}

	public void setBoard_No(int board_No) {
		this.boardNo = board_No;
	}

	public int getUser_No() {
		return userNo;
	}

	public void setUser_No(int user_No) {
		this.userNo = user_No;
	}

	public String getBoardHead() {
		return boardHead;
	}

	public void setBoardHead(String boardHead) {
		this.boardHead = boardHead;
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

	public int getBoardCount() {
		return boardCount;
	}

	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}

	public Date getBoardCredate() {
		return boardCredate;
	}

	public void setBoardCredate(Date boardCredate) {
		this.boardCredate = boardCredate;
	}

	public Date getBoardModdate() {
		return boardModdate;
	}

	public void setBoardModdate(Date boardModdate) {
		this.boardModdate = boardModdate;
	}

	@Override
	public String toString() {
		return "BoardDto [boardNo=" + boardNo + ", userNo=" + userNo + ", boardHead=" + boardHead + ", boardTitle="
				+ boardTitle + ", boardContent=" + boardContent + ", boardCount=" + boardCount + ", boardCredate="
				+ boardCredate + ", boardModdate=" + boardModdate + "]";
	}

	
	

}
	