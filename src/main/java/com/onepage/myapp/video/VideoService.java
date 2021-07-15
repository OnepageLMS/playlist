package com.onepage.myapp.video;

public interface VideoService {
	public int insertVideo(VideoVO vo);
	public int deleteVideo(int id);
	public int updateVideo(VideoVO vo);
	public VideoVO getVideo(int id);
//	public PlaylistVO getPlaylist(int id);
}
