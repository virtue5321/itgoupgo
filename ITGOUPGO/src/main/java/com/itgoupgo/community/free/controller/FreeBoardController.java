package com.itgoupgo.community.free.controller;

import java.util.HashMap;
import java.util.List;

import org.apache.jasper.compiler.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itgoupgo.community.free.model.service.FreeBoardService;
import com.itgoupgo.community.free.model.vo.FreeBbs;

@Controller
@RequestMapping("/free")
public class FreeBoardController {
	
	@Autowired
	private FreeBoardService boardService;
	
	// 자유게시글 목록 조회
	@GetMapping("/list")
	public String selectFreeBoardList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		// 1. 전체 게시글 개수 조회 및 페이징 정보
		PageInfo pi = boardService.getPageInfo(currentPage);
		
		// 2. 페이징 정보를 기반으로 해당 페이지 목록 조회
		List<FreeBbs> list = boardService.selectFreeBoardList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "free/freeListView";
	}

	// 자유게시글 작성
	@GetMapping("/enrollForm")
	public String enrollForm(Model model) {
		return "free/freeEnrollForm";
	}

	// 자유게시글 검색
	@GetMapping("/search")
	public String searchFreeBoard(@RequestParam(value="cpage", defaultValue = "1")int currentPage,
								@RequestParam("condition") String condition, @RequestParam("keyword") String keyword, Model model) {

		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);

		// 2. 검색된 전체 게시글 개수
		PageInfo pi = boardService.getPageInfo(currentPage, map);


		return "free/freeListView";
	}

	
}
