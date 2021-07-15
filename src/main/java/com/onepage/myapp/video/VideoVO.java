package com.onepage.myapp.video;

import java.util.Date;

public class VideoVO {
	private int id;
	private String youtubeID;
	private int start_s;
	private int end_s;
	private int playlistID;
	private Date regdate;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getYoutubeID() {
		return youtubeID;
	}
	public void setYoutubeID(String youtubeID) {
		this.youtubeID = youtubeID;
	}
	public int getStart_s() {
		return start_s;
	}
	public void setStart_s(int start_s) {
		this.start_s = start_s;
	}
	public int getEnd_s() {
		return end_s;
	}
	public void setEnd_s(int end_s) {
		this.end_s = end_s;
	}
	public int getPlaylistID() {
		return playlistID;
	}
	public void setPlaylistID(int playlistID) {
		this.playlistID = playlistID;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	
}
