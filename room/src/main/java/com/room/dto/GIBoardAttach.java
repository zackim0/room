package com.room.dto;

public class GIBoardAttach {

	private int attach_no;
	private int board_no;
	private String savedfilename;
	private String userfilename;
	private int downloadcount;
	public int getAttach_no() {
		return attach_no;
	}
	public void setAttach_no(int attach_no) {
		this.attach_no = attach_no;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getSavedfilename() {
		return savedfilename;
	}
	public void setSavedfilename(String savedfilename) {
		this.savedfilename = savedfilename;
	}
	public String getUserfilename() {
		return userfilename;
	}
	public void setUserfilename(String userfilename) {
		this.userfilename = userfilename;
	}
	public int getDownloadcount() {
		return downloadcount;
	}
	public void setDownloadcount(int downloadcount) {
		this.downloadcount = downloadcount;
	}
	
}
