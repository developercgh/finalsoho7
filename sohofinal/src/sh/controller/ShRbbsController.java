package sh.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import sh.model.ShBbsParam;
import sh.model.ShRbbsDto;
import sh.service.ShRbbsService;


@Controller
public class ShRbbsController {
	private static final Logger logger 
		= LoggerFactory.getLogger(ShRbbsController.class);
	
	@Autowired
	ShRbbsService shRbbsService;
	
	@RequestMapping(value="rbbslist.do", method={RequestMethod.GET, RequestMethod.POST}) 
	public String rbbslist(Model model, ShBbsParam param) {
		logger.info("ShRbbsController rbbslist " + new Date());
		
		model.addAttribute("doc_title", "글 목록");
		
		//List<BbsDto> list = khBbsService.getBbsList();		
		//model.addAttribute("bbslist", list);
		
		// paging 처리
		int sn = param.getPageNumber();
		int start = (sn) * param.getRecordCountPerPage() + 1;
		int end = (sn+1) * param.getRecordCountPerPage();
		
		param.setStart(start);
		param.setEnd(end);
		
		List<ShRbbsDto> rbbslist = shRbbsService.getBbsPagingList(param);
		// 글의 총 갯수 
		int totalRecordCount = shRbbsService.getBbsCount(param);
		
		model.addAttribute("rbbslist", rbbslist);
		
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		model.addAttribute("s_category",param.getS_category());
		model.addAttribute("s_keyword",param.getS_keyword());
				
		return "rbbslist.tiles"; 		
	}

	@RequestMapping(value = "rbbsOne.do", method = RequestMethod.GET)
	public String rbbsOne() {
		logger.info("ShMemberController main " + new Date());
		return "rbbsOne.tiles";
	}
	@RequestMapping(value = "rbbsTwo.do", method = RequestMethod.GET)
	public String rbbsTwo() {
		logger.info("ShMemberController main " + new Date());
		return "rbbsTwo.tiles";
	}
	@RequestMapping(value = "rbbsThree.do", method = RequestMethod.GET)
	public String rbbsThree() {
		logger.info("ShMemberController main " + new Date());
		return "rbbsThree.tiles";
	}
	@RequestMapping(value = "rbbsFour.do", method = RequestMethod.GET)
	public String rbbsFour() {
		logger.info("ShMemberController main " + new Date());
		return "rbbsFour.tiles";
	}
	@RequestMapping(value = "rbbsFive.do", method = RequestMethod.GET)
	public String rbbsFive() {
		logger.info("ShMemberController main " + new Date());
		return "rbbsFive.tiles";
	}
	@RequestMapping(value = "rbbsSix.do", method = RequestMethod.GET)
	public String rbbsSix() {
		logger.info("ShMemberController main " + new Date());
		return "rbbsSix.tiles";
	}
	@RequestMapping(value = "map.do", method = RequestMethod.GET)
	public String map() {
		logger.info("ShMemberController map " + new Date());
		return "map.tiles";
	}
	@RequestMapping(value = "nearlist.do", method = RequestMethod.GET)
	public String nearlist() {
		logger.info("ShMemberController nearlist " + new Date());
		return "nearlist.tiles";
	}
	@RequestMapping(value = "nearyong.do", method = RequestMethod.GET)
	public String nearyong() {
		logger.info("ShMemberController nearyong " + new Date());
		return "nearyong.tiles";
	}
	@RequestMapping(value = "nearse.do", method = RequestMethod.GET)
	public String nearse() {
		logger.info("ShMemberController nearse " + new Date());
		return "nearse.tiles";
	}
	@RequestMapping(value = "neardo.do", method = RequestMethod.GET)
	public String neardo() {
		logger.info("ShMemberController neardo " + new Date());
		return "neardo.tiles";
	}
	@RequestMapping(value = "boo.do", method = RequestMethod.GET)
	public String boo() {
	    logger.info("ShRbbsController boo " + new Date());
	    return "boo.tiles";
	}
	
	@RequestMapping(value = "rbbsupdate.do" , method={RequestMethod.GET,RequestMethod.POST})
	public String rbbsupdate(int seq , Model model) {
		logger.info("ShRbbsController rbbsupdate seq=" + seq);
		ShRbbsDto dto = shRbbsService.RbbsUpList(seq);
		model.addAttribute("dto", dto);
		return "rbbsupdate.tiles";
	}
	@RequestMapping(value = "rbbsupdateAf.do" , method={RequestMethod.GET,RequestMethod.POST})
	public String rbbsupdateAf(ShRbbsDto dto) {
	boolean isS = shRbbsService.RbbsUpdate(dto);
		if(isS) {
			return "redirect:/rbbsdetail.do?seq="+dto.getSeq();
		}else {
			return "rbbsdetail.tiles";
		}
	}
	
	@RequestMapping(value = "rbbsdelete.do" , method={RequestMethod.GET,RequestMethod.POST})
	public String rbbsdelete(int seq) {
		boolean isS = shRbbsService.RbbsDelete(seq);
		
		logger.info("ShRbbsController rbbsDelete time=" + new Date());
		if(isS) {
			return "redirect:/bbslist.do";
		}else {
			return "rbbsdetail.tiles";
		}
	}
	
	@RequestMapping(value = "ranswer.do" , method={RequestMethod.GET,RequestMethod.POST})
	public String ranswer(Model model,int seq) {
		logger.info("ShRbbsController Answer seq=" + seq);
		ShRbbsDto dto = shRbbsService.asnList(seq);
		model.addAttribute("dto", dto);
		return "answer";
	}
	@RequestMapping(value = "ranswerAf.do" , method={RequestMethod.GET,RequestMethod.POST})
	public String ranswerAf(Model model , ShRbbsDto dto) {
		logger.info("ShRbbsController answerAf" + new Date());
		boolean isS = shRbbsService.asnwer(dto);
		if(isS) {
			return "redirect:/rbbsdetail.do?seq="+dto.getSeq();
		}else {
			return "rbbslist";
		}
	}
}






