package com.src.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.src.vo.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO{
	
	private static final String namespace = "replyMapper" ;
	
	@Inject
	SqlSession sql;
	
	//댓글 조회
	@Override
	public List<ReplyVO> readReply(int bno) throws Exception {
		return sql.selectList(namespace + ".readReply", bno);
	}
	
	//댓글 작성
	@Override
	public void writeReply(ReplyVO replyVO) throws Exception {
		sql.insert(namespace + ".writeReply", replyVO);
	}

}
