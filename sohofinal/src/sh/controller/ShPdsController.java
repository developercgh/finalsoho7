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


import sh.model.ShBbsParam;
import sh.model.ShPdsDto;
import sh.service.ShPdsService;
import sh.util.FUpUtil;

@Controller
public class ShPdsController {

	private static final Logger logger
	 = LoggerFactory.getLogger(ShPdsController.class);
	
	@Autowired
	ShPdsService ShPdsService;
	
	@RequestMapping(value="pdslist.do", method={RequestMethod.GET, RequestMethod.POST})
	public String pdslist(Model model, ShBbsParam param) {
		
		logger.info("ShPdsController pdslist " + new Date());
		
		//paging 처리
		int sn = param.getPageNumber();
		int start = (sn) * param.getRecordCountPerPage() + 1;
		int end = (sn+1) * param.getRecordCountPerPage();
		
		param.setStart(start);
		param.setEnd(end);
		
		List<ShPdsDto> list = ShPdsService.getShPdsList();
		
		List<ShPdsDto> pdslist = ShPdsService.getBbsPagingList(param);
		//글의 총 갯수
		int totalRecordCount = ShPdsService.getBbsCount(param);
		
		model.addAttribute("pdslist", pdslist);
		
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		model.addAttribute("s_category", param.getS_category());
		model.addAttribute("s_keyword", param.getS_keyword());
		
		return "pdslist.tiles";
		
	}
	
	@RequestMapping(value="pdswrite.do", method={RequestMethod.GET, RequestMethod.POST})
	public String pdswrite(Model model) {
		logger.info("ShPdsController pdswrite " + new Date());
		
		return "pdswrite.tiles";
	}
	
	@RequestMapping(value="pdsupload.do", method={RequestMethod.GET, RequestMethod.POST})
	public String pdsupload(ShPdsDto pdsdto,
							@RequestParam(value="fileload", required=false)MultipartFile fileload,
							HttpServletRequest req) {
	
		//@RequestParam 어노테이션을 이용한 파라미터 매핑
		// 파라미터 fileload가 존재하지 않음녀 null값으로 적용
		logger.info("ShPdsController pdsupload " + new Date());
		
		//filename을 취득
		String filename = fileload.getOriginalFilename();
		pdsdto.setFilename(filename);
		
		//upload 경로
		//tomcat
		String fupload = req.getServletContext().getRealPath("/upload");
		
		//file(d드라이브 tmp 폴더에 작성함
		//String fuplad = "d:\\tmp";
		
		//파일명.xxx -> 12232132.xxx
		String f = pdsdto.getFilename();	//위에 파일 네임을 set로 해주고 get을 가져오기
		String newfilename = FUpUtil.getNewFile(f);		//변경을 newfilename에 넣어놈
		
		pdsdto.setFilename(newfilename);
		

		File file = new File(fupload + "/" + newfilename);
		System.out.println("upload 파일경로:" + fupload + "/" + newfilename);
		
		try {
			//실제 파일 업로드 부분
			FileUtils.writeByteArrayToFile(file, fileload.getBytes());	//바이트 단위로 저장할거라서
				
			//db 저장
			ShPdsService.uploadPds(pdsdto);
				
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/pdslist.do";			
			
	}
	
	@RequestMapping(value="fileDownload.do", method={RequestMethod.GET, RequestMethod.POST})
	public String fileDownload(String filename, int seq,
							HttpServletRequest req, Model model) {
		logger.info("ShPdsController fileDownload " + new Date());
		
		// download 경로
		// tomcat
		String fupload = req.getServletContext().getRealPath("/upload");
			
		// file
		// String fupload = "d:\\tmp";
		
		File downloadFile = new File(fupload + "/" + filename);
		
		model.addAttribute("downloadFile", downloadFile);
		model.addAttribute("seq", seq);
		
		return "downloadView";	//이게 어디로 가냐면 스프링 폴더에서 servlet-context에서 들어가 있는지 확인하면 돼!!
		
	}
	
	@RequestMapping(value="pdsdetail.do", method={RequestMethod.GET, RequestMethod.POST})
	public String pdsdetail(int seq, Model model) {
		logger.info("ShPdsController pdsdetail " + new Date());
		model.addAttribute("doc_title", "자료 보기");
		
		//readcount 추가
		
		//dto를 취득
		ShPdsDto pdsdto = ShPdsService.getPds(seq);	
		model.addAttribute("pds", pdsdto);
		
		return "pdsdetail.tiles";
	}
	
	@RequestMapping(value="pdsupdate.do", method={RequestMethod.GET, RequestMethod.POST})
	public String pdsupdate(int seq, Model model) {
		
		logger.info("ShPdsController pdsupdate " + new Date());
		model.addAttribute("doc_title", "자료 수정");
		//value객체를 name이름으로 추가한다, 뷰 코드에서는 name으로 지정한 이름을 통해서 value를 사용한다.
		//혹시 model.addAttribute에 대한 이해가 부족하면 model에 pds변수 값을 담을 거야 
		
		ShPdsDto pdsDto = ShPdsService.getPds(seq);
		model.addAttribute("pds", pdsDto);
		
		return "pdsupdate.tiles";
	}
	
	@RequestMapping(value="pdsupdateAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String pdsupdateAf(ShPdsDto pdsdto,
								String namefile,		//기존의 파일명
			 					HttpServletRequest req,	//요청을해서
								@RequestParam(value = "fileload", required=false)		//이게 무슨 뜻이냐면 항상 true인데 파일이 안들어 올수 있기 때문에 경우의 수를 잡아준거
								MultipartFile fileload) {
		
	//RequestParam에 대한 이해 벨류에 fileload(파라미터이름) 키 값에 false로 지정해 노면 badRequest가 발생하지 않는다.
		System.out.println("ShPdsController pdsupdateAf" + new Date());
		System.out.println(pdsdto.toString());
		System.out.println(namefile);		
		System.out.println(fileload.getOriginalFilename());
		
		pdsdto.setFilename(fileload.getOriginalFilename());
		//위에서 매개변수를 pdsdto로 정해놨어!!
		
		//파일경로 취득
		String fupload = req.getServletContext().getRealPath("/upload");
		
		//수정된 파일 있음
		if(pdsdto.getFilename() != null && !pdsdto.getFilename().equals("")) {
		//만약 pdsdto에서 get로 받아온 filename이 null이 아니고 get으로 가져온 filename이 공백이 아니여야 한다	
			
			String f = pdsdto.getFilename();		//파일 네일을 String 타입 f에 넣고
			String newfile = FUpUtil.getNewFile(f);	//여기서 파일 유틸을 통해서 변경된다고 보면되
			
			pdsdto.setFilename(newfile);
			
			File file = new File(fupload + "/" + newfile);	//이거는 객체를 생성해서 새로운 이름으로 파일이 담기는 경로를 지정 
			//실제로 업로드
			
			try {
				FileUtils.writeByteArrayToFile(file, fileload.getBytes());
				
				//db 갱신(service는 편집을 하는 곳이라고 생각함)
				ShPdsService.update(pdsdto);
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		//수정된 파일이 없으면
		else {
			//기존의 파일 명으로 설정
			pdsdto.setFilename(namefile);		//매개변수에 기존의 파일 명과 동일하다고 써놈
			
			//DB
			ShPdsService.update(pdsdto);
		}
		
		return "redirect:/pdslist.do";
	}
	
	@RequestMapping(value="pdsdelete.do", method={RequestMethod.GET, RequestMethod.POST})
	public String deleteBbs(int seq, Model model) throws Exception{
		logger.info("ShPdsController deleteBbs" + new Date());
		ShPdsService.deleteBbs(seq);
		return "redirect:/pdslist.do";
	}
	
}
