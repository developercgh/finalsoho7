package sh.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import sh.model.ShMemberDto;
import sh.model.ShPollBean;
import sh.model.ShPollDto;
import sh.model.ShPollSubDto;
import sh.model.ShVoter;
import sh.service.ShPollService;
@Controller
public class ShPollController {
	
	private static final Logger logger = LoggerFactory.getLogger(ShPollController.class);

	@Autowired
	ShPollService ShPollService;
	
	@RequestMapping(value="polllist.do", method={RequestMethod.GET, RequestMethod.POST})
	public String polllist(HttpServletRequest req, Model model) {
		logger.info("ShPollController polllist " + new Date());
		model.addAttribute("doc_title", "투표목록");		//근데 여기는 안씀
		
		String id = ((ShMemberDto) req.getSession().getAttribute("login")).getId();
		
		List<ShPollDto> list = ShPollService.getPollAllList(id);
		model.addAttribute("plists", list);
		
		return "polllist.tiles";
	
	}
	@RequestMapping(value="pollmake.do", method={RequestMethod.GET, RequestMethod.POST})
	public String polllist(Model model) {
		logger.info("ShPollController pollmake" + new Date());
		model.addAttribute("doc_title", "투표 만들기");
		
		return "pollmake.tiles";
	}
	
	@RequestMapping(value="pollmakeAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String pollmakeAf(ShPollBean pbean) {
		logger.info("KhPollController pollmakeAf " + new Date());
		
		// DB
		ShPollService.makePoll(pbean);
				
		return "redirect:/polllist.do";
	}
	
	@RequestMapping(value="polldetail.do", method={RequestMethod.GET, RequestMethod.POST})
	public String polldetail(ShPollDto poll, Model model) {
		logger.info("KhPollController polldetail " + new Date());
		model.addAttribute("doc_title", "투표 내용");
		
		ShPollDto dto = ShPollService.getPoll(poll);
		List<ShPollSubDto> list = ShPollService.getPollSubList(poll);
		
		model.addAttribute("poll", dto);
		model.addAttribute("pollsublist", list);
		
		return "polldetail.tiles";		
	}
	
	@RequestMapping(value="polling.do", method={RequestMethod.GET, RequestMethod.POST})
	public String polling(ShVoter voter) {
		logger.info("KhPollController polling " + new Date());
		
		ShPollService.polling(voter);
		
		return "redirect:/polllist.do";
	}
	
	@RequestMapping(value="pollresult.do", method={RequestMethod.GET, RequestMethod.POST})
	public String pollresult(ShPollDto poll, Model model) {
		logger.info("KhPollController pollresult " + new Date());
		model.addAttribute("doc_title", "투표 결과");
		
		ShPollDto dto = ShPollService.getPoll(poll);
		List<ShPollSubDto> list = ShPollService.getPollSubList(poll);
		
		model.addAttribute("poll", dto);
		model.addAttribute("pollsublist", list);
		
		return "pollresult.tiles";		
	}
}
