package JYG.model;

import java.sql.Date;

public class Board {
	private String boardTitle;
	private int boardReco;
	private int boardCheck;
	private Date boardTime;
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public int getBoardReco() {
		return boardReco;
	}
	public void setBoardReco(int boardReco) {
		this.boardReco = boardReco;
	}
	public int getBoardCheck() {
		return boardCheck;
	}
	public void setBoardCheck(int boardCheck) {
		this.boardCheck = boardCheck;
	}
	public Date getBoardTime() {
		return boardTime;
	}
	public void setBoardTime(Date date) {
		this.boardTime = date;
	}
	public Board() {
	}
}
