package sh.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import sh.model.ShEbbsDto;
import sh.service.ShEbbsService;
import sh.util.FUpUtil;


@Controller
public class ShEbbsController {

	private static final Logger logger 
		= LoggerFactory.getLogger(ShEbbsController.class);
	
	@Autowired
	ShEbbsService ShEbbsService;
	
	@RequestMapping(value="Ebbslist.do", method={RequestMethod.GET, RequestMethod.POST})
	public String Ebbslist(Model model) {
		logger.info("ShEbbsController Ebbslist " + new Date());
		model.addAttribute("doc_title", "자료실 목록");
		
		List<ShEbbsDto> list = ShEbbsService.getEbbsList();
		model.addAttribute("Ebbslist", list);
		
		return "Ebbslist.tiles";		
	}
	
	@RequestMapping(value="Ebbswrite.do", method={RequestMethod.GET, RequestMethod.POST})
	public String Ebbswrite(Model model) {
		logger.info("ShEbbsController Ebbswrite" + new Date());
		model.addAttribute("doc_title", "자료 추가");
		
		return "Ebbswrite.tiles";
	}
	@RequestMapping(value="Ebbsupload.do", method={RequestMethod.GET, RequestMethod.POST})
	public String Ebbsupload(ShEbbsDto Ebbsdto, 
							@RequestParam(value = "fileload", required = false)MultipartFile fileload,
							HttpServletRequest req) {
		logger.info("ShEbbsController Ebbsupload" + new Date());
		
		// filename을 취득
		String filename = fileload.getOriginalFilename();
		Ebbsdto.setFilename(filename);
		
		// upload 경로
		// tomcat
		String fupload = req.getServletContext().getRealPath("/upload");
		
		// file
		// String fupload ="d:\\tmp"; 
		
		// 파일명.xxx -> 12232132.xxx
		String f = Ebbsdto.getFilename();
		String newfilename = FUpUtil.getNewFile(f);
		
		Ebbsdto.setFilename(newfilename);
		
		File file = new File(fupload + "/" + newfilename);
		logger.info("upload 파일경로:" + fupload + "/" + newfilename);
		
		try {
			// 실제 파일 업로드 부분
			FileUtils.writeByteArrayToFile(file, fileload.getBytes());
			
			// db저장
			ShEbbsService.uploadEbbs(Ebbsdto);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/Ebbslist.do";
	}
	
	@RequestMapping(value="EfileDownload.do", method={RequestMethod.GET, RequestMethod.POST})
	public String filedownload(String filename, int seq,
						HttpServletRequest req, Model model) {
	logger.info("ShEbbsController fileDownload" + new Date());
	
	//download 경로
	//tomcat
	String fupload = req.getServletContext().getRealPath("/upload");
			
	//file
	//String fupload = "d\\tmp";
			
	File downloadFile = new File(fupload + "/" + filename);
	
	model.addAttribute("downloadFile" , downloadFile);
	model.addAttribute("seq",seq);
	
	return "downloadView";
	}
	
	@RequestMapping(value="Ebbsdetail.do", method={RequestMethod.GET, RequestMethod.POST})
	public String Ebbsdetail(int seq, Model model) {
		logger.info("ShEbbsController Ebbsdetail" + new Date());
		model.addAttribute("doc_title", "자료 보기");
		
		// readcount 추가

		// dto를 취득
		ShEbbsDto Ebbsdto = ShEbbsService.getEbbs(seq);
		
		model.addAttribute("Ebbs", Ebbsdto);
		
		return "Ebbsdetail.tiles";
	}
	@RequestMapping(value="Ebbsupdate.do", method={RequestMethod.GET, RequestMethod.POST})
	public String Ebbsupdate(int seq, Model model) {
		logger.info("ShEbbsController Ebbsupdate" + new Date());
		model.addAttribute("doc_title", "자료 수정");
		
		ShEbbsDto Ebbsdto = ShEbbsService.getEbbs(seq);
		model.addAttribute("Ebbs", Ebbsdto);
		return "Ebbsupdate.tiles";
	}
	
	@RequestMapping(value="EbbsupdateAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String EbbsupdateAf(ShEbbsDto Ebbsdto,
							String namefile,	// 기존의 파일명 
							HttpServletRequest req,
							@RequestParam(value = "fileload", required =false)MultipartFile fileload) {
		
		System.out.println("ShEbbsController EbbsupdateAf" + new Date());
		System.out.println(Ebbsdto.toString());
		System.out.println(namefile);
		System.out.println(fileload.getOriginalFilename());
		
		Ebbsdto.setFilename(fileload.getOriginalFilename());
		
		// 파일 경로 취득
		String fupload = req.getServletContext().getRealPath("/upload");
		
		// 수정된 파일 있음
		if(Ebbsdto.getFilename() != null && !Ebbsdto.getFilename().equals("")) {
			
			String f = Ebbsdto.getFilename();
			String newfile = FUpUtil.getNewFile(f);
			
			Ebbsdto.setFilename(newfile);
			
			File file = new File(fupload + "/" + newfile);
			
			// 실제 업로드
			try {
				FileUtils.writeByteArrayToFile(file, fileload.getBytes());
				
			// db 갱신
			ShEbbsService.updateEbbs(Ebbsdto);
				
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		// 수정된 파일 없음
		else {
			
			// 기존의 파일 명으로 설정
			Ebbsdto.setFilename(namefile);
			
			// DB
			ShEbbsService.updateEbbs(Ebbsdto);
		}
		
		return "redirect:/Ebbslist.do";
	}
	@RequestMapping(value="Ebbsdelete.do", method={RequestMethod.GET, RequestMethod.POST})
	public String Ebbsdelete(int seq) {
		boolean isS = ShEbbsService.EbbsDelete(seq);
		
		logger.info("ShEbbsController EbbsDelete time=" + new Date());
		if(isS) {
			return "redirect:/Ebbslist.do";
		}else {
			return "Ebbsdetail.tiles";
		}
	}
	
}







