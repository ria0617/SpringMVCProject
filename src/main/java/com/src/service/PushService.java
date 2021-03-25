package com.src.service;

import com.src.domain.PushVO;

public interface PushService {
	
	//추천하기
	public void pushIn(PushVO pushVO) throws Exception;
	
	//추천글 확인
	public int pushCheck(PushVO pushVO) throws Exception;
	
	//총 추천수
	public int totalPush(PushVO pushVO) throws Exception;
	
	//추천회수
	public void pushOut(PushVO pushVO) throws Exception;
	
	//추천버튼 제어
	public String ChkPushId(int bno) throws Exception;
}
