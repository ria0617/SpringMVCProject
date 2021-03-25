package com.src.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.src.domain.PushVO;

@Repository
public class PushDAOImpl implements PushDAO {

	private static final String namespace = "pushMapper" ;
	
	@Inject
	private SqlSession sqlSession;
	
	//추천하기
	@Override
	public void pushIn(PushVO pushVO) throws Exception {
		sqlSession.insert(namespace + ".pushIn", pushVO);
	}
	
	//추천글 확인
	@Override
	public int pushCheck(PushVO pushVO) throws Exception {
		return sqlSession.selectOne(namespace + ".pushCheck", pushVO);
	}
	
	//총 추천수 
	@Override
	public int totalPush(PushVO pushVO) throws Exception {
		return sqlSession.selectOne(namespace + ".totalPush", pushVO);
	}
	
	//추천회수
	@Override
	public void pushOut(PushVO pushVO) throws Exception {
		sqlSession.delete(namespace + ".pushOut", pushVO);
	}
	
	//추천버튼 제어
	@Override
	public String ChkPushId(int bno) throws Exception {
		return sqlSession.selectOne(namespace + ".ChkPushId", bno);
	}

}
