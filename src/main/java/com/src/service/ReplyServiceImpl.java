package com.src.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.src.dao.ReplyDAO;
import com.src.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Inject
	private ReplyDAO dao;
	
	//댓글조회
	@Override
	public List<ReplyVO> readReply(int bno) throws Exception {
		return dao.readReply(bno);
	}

	@Override
	public void writeReply(ReplyVO replyVO) throws Exception {
		dao.writeReply(replyVO);
	}

}
