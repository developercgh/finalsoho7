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
import sh.model.ShBbsParam;
import sh.model.ShNbbsDto;
import sh.service.ShNbbsService;

@Controller
public class ShNbbsController {

	private static final Logger logger = LoggerFactory.getLogger(ShNbbsController.class);

	@Autowired
	ShNbbsService shNbbsService;

	@RequestMapping(value = "nbbslist.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String nbbslist(Model model, ShBbsParam param) {
		logger.info("ShNbbsController nbbslist " + new Date());

		// paging 처리
		int sn = param.getPageNumber();
		int start = (sn) * param.getRecordCountPerPage() + 1;
		int end = (sn+1) * param.getRecordCountPerPage();

		param.setStart(start);
		param.setEnd(end);

	//	List<ShNbbsDto> list = shNbbsService.getNbbsList();
		
		List<ShNbbsDto> nbbslist = shNbbsService.getBbsPagingList(param);
		
		// 글의 총 갯수
		int totalRecordCount = shNbbsService.getBbsCount(param);
		
		model.addAttribute("nbbslist", nbbslist);
		
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);

		// 게시판 검색후 페이징 버그 !  
		model.addAttribute("s_category", param.getS_category());
		model.addAttribute("s_keyword", param.getS_keyword());
		
		return "nbbslist.tiles";
	}

	@RequestMapping(value = "nbbsupload.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String nbbsUpload(Model model) throws Exception {
		logger.info("ShNbbsController nbbsupload " + new Date());
		model.addAttribute("doc_title", "공지사항 작성");

		return "nbbsupload.tiles";
	}

	@RequestMapping(value = "nbbsuploadAf.do", method = RequestMethod.POST)
	public String nbbsUploadAf(ShNbbsDto nbbs) throws Exception {
		logger.info("ShNbbsController nbbsuploadAf " + new Date());
		if (!nbbs.getTitle().equals("") || !nbbs.getContent().equals("")) {
			logger.info("ShNbbsController nbbsuploadAf Success " + new Date());
			shNbbsService.NbbsUpload(nbbs);
			return "redirect:/nbbslist.do";
		} else {
			logger.info("ShNbbsController nbbsuploadAf Fail! " + new Date());
			return "nbbsuploadError.tiles";
		}
	}

	@RequestMapping(value = "nbbsdetail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String nbbsDetail(ShNbbsDto nbbs, Model model) throws Exception {
		logger.info("ShNbbsController nbbsdetail " + new Date());
		ShNbbsDto dto = shNbbsService.getNbbs(nbbs);

		boolean isS = shNbbsService.readcountUpdate(nbbs);
		if (isS) {
			logger.info("ShNbbsController nbbsdetail readcountUpdate Success " + new Date());
		} else {
			logger.info("ShNbbsController nbbsdetail readcountUpdate Fail! " + new Date());
		}
		model.addAttribute("getNbbs", dto);
		return "nbbsdetail.tiles";
	}

	@RequestMapping(value = "nbbsupdate.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String nbbsUpdate(ShNbbsDto nbbs, Model model) throws Exception {
		logger.info("ShNbbsController nbbsupdate " + new Date());
		ShNbbsDto nbbsdto = shNbbsService.getNbbs(nbbs);
		model.addAttribute("nbbs", nbbsdto);
		return "nbbsupdate.tiles";
	}

	@RequestMapping(value = "nbbsupdateAf.do", method = RequestMethod.POST)
	public String nbbsUpdateAf(ShNbbsDto nbbs) {
		logger.info("ShNbbsController nbbsupdateAf " + new Date());
		boolean isS = shNbbsService.NbbsUpdate(nbbs);
		if (isS) {
			logger.info("ShNbbsController nbbsupdate Success " + new Date());
			return "redirect:/nbbslist.do";
		} else {
			logger.info("ShNbbsController nbbsupdate Fail! " + new Date());
			return "forward:/nbbsupdate.do";
		}
	}
	
	/*
	@RequestMapping(value = "nbbsdelete.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String nbbsDelete(ShNbbsDto nbbs, Model model) throws Exception {
		logger.info("ShNbbsController nbbsdelete " + new Date());
		ShNbbsDto ndto = shNbbsService.getNbbs(nbbs);
		model.addAttribute("nbbs1", ndto);
		return "nbbsdelete.tiles";
	}
	*/
	
	@RequestMapping(value = "nbbsdelete.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String nbbsDeleteAf(ShNbbsDto nbbs) {
		logger.info("ShNbbsController nbbsdelete " + new Date());
		boolean isS = shNbbsService.NbbsDelete(nbbs);
		if(isS) {
			logger.info("ShNbbsController nbbsdelete Success " + new Date());
			return "nbbsdelete.tiles";
		} else {
			logger.info("ShNbbsController nbbsdelete Fail! " + new Date());
			return "nbbsdeleteError.tiles";
		}
	}
}
