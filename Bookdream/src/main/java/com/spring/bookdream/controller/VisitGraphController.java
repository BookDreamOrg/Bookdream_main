package com.spring.bookdream.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.bookdream.service.VisitGraphService;
import com.spring.bookdream.vo.VisitVO;

@Controller
public class VisitGraphController {
	
	@Autowired
	private VisitGraphService visitService;
	
	@RequestMapping("/countVisit.do")
	public @ResponseBody List<VisitVO> countVisitor(Model model, VisitVO vo) {
		List<VisitVO> visitor = visitService.countVisitor(vo);
		model.addAttribute("visitor",visitor);
		
		return visitor;
	}
	
}
