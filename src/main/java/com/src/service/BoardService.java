package com.src.service;

import com.src.vo.BoardVO;

public interface BoardService {
	// 게시글 작성
	public void write(BoardVO boardVO) throws Exception;
}