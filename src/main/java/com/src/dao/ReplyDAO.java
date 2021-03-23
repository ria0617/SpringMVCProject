package com.src.dao;

import java.util.List;

import com.src.vo.ReplyVO;

public interface ReplyDAO {
	
	//댓글조회
	public List<ReplyVO> readReply(int bno) throws Exception;
	
}
