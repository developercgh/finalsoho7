package sh.controller;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import sh.model.ShQbbsDto;
import sh.model.ShQbbsParam;
import sh.service.ShQbbsService;

@Controller
public class ShQbbsController {

	private static final Logger logger = LoggerFactory.getLogger(ShQbbsController.class);
	
	@Autowired
	ShQbbsService shQbbsService;
	
	@RequestMapping(value = "Qbbslist.do", method = {RequestMethod.GET, RequestMethod.POST }) 
				//post던 get이던 상관없으므로 {} 안에 둘다 적어준다  그러면 view에서 선택해서 보내면 된다 
	public String Qbbslist(Model model, ShQbbsParam Qparam) { //날려줄 데이터가 있을때 Model model 로
		logger.info("ShQbbsController Qbbslist " + new Date());
		
		model.addAttribute("doc_title", "글목록");
		
		
		// paging 처리
		int sn = Qparam.getPageNumber();
		int start = (sn) * Qparam.getRecordCountPerPage() + 1;
		int end = (sn+1) * Qparam.getRecordCountPerPage();
		
		Qparam.setStart(start);
		Qparam.setEnd(end);
		
		List<ShQbbsDto> Qbbslist = shQbbsService.getQbbsPagingList(Qparam);
		// 글의 총 갯수
		int totalRecordCount = shQbbsService.getQbbsCount(Qparam);
		
		model.addAttribute("Qbbslist", Qbbslist);
		
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10); // 한 화면에 10페이지까지만 보여줌
		model.addAttribute("recordCountPerPage", Qparam.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		
		// 게시판 검색후 페이징 버그 ! 
		model.addAttribute("q_category", Qparam.getQ_category());
		model.addAttribute("q_keyword", Qparam.getQ_keyword());

		//return null;
		
		
		return "Qbbslist.tiles"; // .jsp 즉,view 찾을때 이름 
		
	}
	
	@RequestMapping(value = "Qbbswrite.do", method = {RequestMethod.GET, RequestMethod.POST })
	public String Qbbswrite() {
		logger.info("ShQbbsController Qbbswrite " + new Date());
		
		return "Qbbswrite.tiles";
	}
	
	@RequestMapping(value="QbbswriteAf.do", method = {RequestMethod.GET, RequestMethod.POST })
	public String QbbswriteAf(ShQbbsDto Qbbs) {
		logger.info("ShQbbsController writeAf " + new Date());
		
		boolean isS = shQbbsService.Qbbswrite(Qbbs);
		
		if(isS) {
			System.out.println("글쓰기 성공!");
			
			return "redirect:/Qbbslist.do";
			
			
		}else {
			System.out.println("글쓰기 실패!");
			return "redirect:/Qbbswrite.do";
		}
	}
	
	@RequestMapping(value = "Qbbsdetail.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String Qbbsdetail(ShQbbsDto dto, Model model) {
		logger.info("ShQbbsController Qbbsdetail " + new Date());
		ShQbbsDto Qbbs = shQbbsService.getQbbs(dto);
		logger.info(Qbbs.toString());
		
		boolean isS = shQbbsService.Qreadcount(dto);
		if(isS) {
			System.out.println("조회수 +성공!");
		}else {
			System.out.println("조회수 실패!");
		}
		
		model.addAttribute("Qbbs", Qbbs);
		
			System.out.println("디테일 성공");
			return "Qbbsdetail.tiles";	
	}
	
	
	@RequestMapping(value = "Qbbsupdate.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String Qbbsupdate(ShQbbsDto dto, Model model) {
		logger.info("ShQbbsController Qbbsupdate " + new Date());
		ShQbbsDto Qbbs = shQbbsService.getQbbs(dto);
		logger.info(Qbbs.toString());
		
		model.addAttribute("Qbbs", Qbbs);
		
		System.out.println("Qbbsupdate before");
		
		return "Qbbsupdate.tiles";
	}
	
	@RequestMapping(value = "QbbsupdateAf.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String QbbsupdateAf(ShQbbsDto dto) {
		logger.info("ShQbbsController QbbsupdateAf " + new Date());
		boolean isS = shQbbsService.Qbbsupdate(dto);
		
		if(isS) {
			System.out.println("업데이트 성공!");
			//return "redirect:/bbslist.do";
			return "redirect:/Qbbslist.do";
		}else {
			System.out.println("업데이트 실패!");
			//return "forward:/bbsupdate.do";
			return "forward:/Qbbsupdate.do";
		}
	}
	
	@RequestMapping(value = "Qbbsdelete.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String Qbbsdelete(ShQbbsDto dto) {
		logger.info("ShQbbsController Qbbsdelete " + new Date());
		
		 boolean isS = shQbbsService.Qbbsdelete(dto);
		
		if(isS) {
			System.out.println("삭제 성공!");
			return "redirect:/Qbbslist.do";
		}else {
			System.out.println("삭제 실패!");
			return "forward:/Qbbsupdate.do";
		}
	}
	
	@RequestMapping(value = "Qanswer.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String Qanswer(ShQbbsDto dto, Model model) {
		logger.info("ShQbbsController Qanswer " + new Date());
		ShQbbsDto Qbbs = shQbbsService.getQbbs(dto);
		logger.info(Qbbs.toString());
		
		model.addAttribute("Qbbs", Qbbs);
		
		System.out.println("Qanswer before");
		
		return "Qanswer.tiles";
	}
	
	
	
	@RequestMapping(value = "QanswerAf.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String QanswerAf(ShQbbsDto dto) {
		logger.info("ShQbbsController answerAf " + new Date());
		
		 boolean isS = shQbbsService.Qanswer(dto);
		 
		 if(isS) {
			 
			System.out.println("답글 작성 성공!");
			return "redirect:/Qbbslist.do";
		 }else {
			 
			 System.out.println("답글 작성 실패!");
			 return "redirect:/Qbbslist.do";
		 }
	}
	
	

	
	
	
	
	
}
