package com.src.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.src.domain.BoardVO;
import com.src.domain.MBoardVO;
import com.src.domain.PageMaker;
import com.src.domain.PushVO;
import com.src.domain.ReplyVO;
import com.src.domain.SearchCriteria;
import com.src.domain.UserVO;
import com.src.service.MBoardService;
import com.src.service.UserService;

@Controller
@RequestMapping("/movie/*")
public class MboardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	UserService userService;
	
	@Inject
	MBoardService Mservice;
	
	// 영화 소개 글 작성 화면
	@RequestMapping(value = "/M_writeView", method = RequestMethod.GET)
	public void MwriteView() throws Exception{
		logger.info("영화 소개 글 작성 화면");
	}
	
	// 영화 소개 글 작성
	@RequestMapping(value = "/M_write", method = RequestMethod.POST)
	public String Mwrite(MBoardVO mboardVO) throws Exception{
		
		logger.info("영화 소개 글 작성");
		Mservice.movieWrite(mboardVO);
		
		return "redirect:/movie/M_list";
	}

	// 영화 소개 목록 조회
	@RequestMapping(value = "/M_list", method = RequestMethod.GET)
	public String Mlist(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception{
		logger.info("영화 소개글 목록");
		model.addAttribute("mlist",Mservice.movieListPage(scri));
		
		//페이징
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(Mservice.movieListCount(scri));
		model.addAttribute("pageMaker", pageMaker);

		return "movie/M_list";
	}
	
	// 영화소개 글 보기
	@RequestMapping(value = "/M_readView", method = RequestMethod.GET)
	public String Mread(UserVO userVO, MBoardVO mboardVO, @ModelAttribute("scri") SearchCriteria scri, Model model, HttpSession httpsession, RedirectAttributes rttr) throws Exception{
		
		logger.info("영화 소개글 읽기");
		model.addAttribute("mread", Mservice.movieRead(mboardVO.getMovie_id()));
		model.addAttribute("mlist",Mservice.movieListPage(scri));

		
		return "movie/M_readView";
	}
	
	// 영화소개 삭제
	@RequestMapping(value = "/M_delete", method = RequestMethod.POST)
	public String Mdelete(MBoardVO mboardVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		logger.info("영화 소개글 삭제");
		Mservice.movieDelete(mboardVO.getMovie_id());
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		return "redirect:/movie/M_list";
	}
	
	// 게시판 수정뷰
	@RequestMapping(value = "/M_updateView", method = RequestMethod.GET)
	public String MupdateView(MBoardVO mboardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		logger.info("영화 소개글 수정 페이지");
		model.addAttribute("mupdate", Mservice.movieRead(mboardVO.getMovie_id()));
		model.addAttribute("scri", scri);
		System.out.println(Mservice.movieRead(mboardVO.getMovie_id()));
		return "movie/M_updateView";
	}
	
	// 게시판 수정
	@RequestMapping(value = "/M_update", method = RequestMethod.POST)
	public String Mupdate(MBoardVO mboardVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		logger.info("영화 소개글 수정");
		Mservice.movieUpdate(mboardVO);

		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		return "redirect:/movie/M_list";
	}
}
