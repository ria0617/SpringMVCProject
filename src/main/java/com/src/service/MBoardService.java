package com.src.service;

import java.util.List;

import com.src.domain.BoardVO;
import com.src.domain.MBoardVO;
import com.src.domain.SearchCriteria;

public interface MBoardService {
	
	// 게시글 작성
	public void movieWrite(MBoardVO mboardVO) throws Exception;
	
	// 게시물 목록 조회
	public List<MBoardVO> movieListPage(SearchCriteria scri) throws Exception;
		
	//게시물 총 갯수
	public int movieListCount(SearchCriteria scri) throws Exception;
	
	// 게시물 보기
	public MBoardVO movieRead(int movie_id) throws Exception;

	// 게시물 수정
	public void movieUpdate(MBoardVO mboardVO) throws Exception;
	
	// 게시물 삭제
	public void movieDelete(int movie_id) throws Exception;

}
