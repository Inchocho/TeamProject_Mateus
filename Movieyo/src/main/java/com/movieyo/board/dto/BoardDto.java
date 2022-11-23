package com.movieyo.board.dto;

import java.sql.Date;
import java.util.Objects;

public class BoardDto {
	private int board_No;
	private int user_No;
	private String boardHead;
	private String boardTitle;
	private String boardContent;
	private int boardCount;
	private Date boardCredate;
	private Date boardModdate;
	
	public BoardDto(int board_No, int user_No, String boardHead, String boardTitle, String boardContent, int boardCount,
			Date boardCredate, Date boardModdate) {
		super();
		this.board_No = board_No;
		this.user_No = user_No;
		this.boardHead = boardHead;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardCount = boardCount;
		this.boardCredate = boardCredate;
		this.boardModdate = boardModdate;
	}

	public int getBoard_No() {
		return board_No;
	}

	public void setBoard_No(int board_No) {
		this.board_No = board_No;
	}

	public int getUser_No() {
		return user_No;
	}

	public void setUser_No(int user_No) {
		this.user_No = user_No;
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
		return "BoardDto [board_No=" + board_No + ", user_No=" + user_No + ", boardHead=" + boardHead + ", boardTitle="
				+ boardTitle + ", boardContent=" + boardContent + ", boardCount=" + boardCount + ", boardCredate="
				+ boardCredate + ", boardModdate=" + boardModdate + "]";
	}

	
	

}
	