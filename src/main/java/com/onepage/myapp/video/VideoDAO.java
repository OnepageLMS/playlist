package com.onepage.myapp.video;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class VideoDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public int insertVideo(VideoVO vo) {
		int result = sqlSession.insert("Video.insertVideo", vo);
		return result;
	}
	public int updateVideo(VideoVO vo) {
		int result = sqlSession.update("Video.updateVideo", vo);
		return result;
	}
	public int deleteVideo(int id) {
		int result = sqlSession.delete("Video.deleteVideo", id);
		return result;
	}
	public VideoVO getVideo(int id) {
		return sqlSession.selectOne("Video.getVideo", id);
	}
//	public PlaylistVO getPlaylist (int id) {
//		return sqlSession.selectOne("Playlist.getPlaylist", id);
//	}
	
}
