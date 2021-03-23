package com.src.service;

import java.util.List;

import com.src.vo.ReplyVO;

public interface ReplyService {
	//댓글조회
	public List<ReplyVO> readReply(int bno) throws Exception;
}
