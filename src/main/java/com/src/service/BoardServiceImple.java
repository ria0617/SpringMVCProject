package com.src.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.src.dao.BoardDAO;
import com.src.vo.BoardVO;

@Service
public class BoardServiceImple implements BoardService {
	
	@Inject
	private BoardDAO dao;
	
	// 게시글 작성
	@Override
	public void write(BoardVO boardVO) throws Exception {
		dao.write(boardVO);
	}

}
