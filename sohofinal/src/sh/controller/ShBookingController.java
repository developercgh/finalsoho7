package sh.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import sh.model.ShBbsParam;
import sh.model.ShBookingDto;
import sh.model.ShQbbsDto;
import sh.service.ShBookingService;

@Controller
public class ShBookingController {

	private static Logger logger
		= LoggerFactory.getLogger(ShBookingController.class);
	
	@Autowired
	ShBookingService shBookingService;
	
	@RequestMapping(value = "Bookinglist.do", method = RequestMethod.GET)
	public String Bookinglist(Model model, ShBbsParam param) {
		logger.info("ShBookingController Bookinglist " + new Date());
		
		int sn = param.getPageNumber();	// 현재 페이지
		int start = (sn) * param.getRecordCountPerPage() + 1;	// 처음 페이지
		int end  = (sn + 1) * param.getRecordCountPerPage();	// 끝 페이지
		
		
		
		param.setStart(start);
		param.setEnd(end);
		
		List<ShBookingDto> booklist = (List<ShBookingDto>)(shBookingService.getBkPaginglist(param));
		ArrayList<String> sDateList=new ArrayList<String>();
		ArrayList<String> eDateList=new ArrayList<String>();
		for(int i=0;i<booklist.size();i++) {
		sDateList.add(booklist.get(i).getSdate());
		eDateList.add(booklist.get(i).getEdate());
		}
		for(int i=0;i<booklist.size();i++) {
			booklist.get(i).setSdate(sDateList.get(i).substring(0, 10));
			booklist.get(i).setEdate(eDateList.get(i).substring(0, 10));
		}
			
		
		// 글의 총 개수
		int totalRecordCount = shBookingService.getBklistCount(param);
		
		model.addAttribute("Bookinglist", booklist);
		
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		model.addAttribute("s_category", param.getS_category());
		model.addAttribute("s_keyword", param.getS_keyword());
		
		return "Bookinglist.tiles";
	}
	
	@RequestMapping(value = "Bookingwrite.do", method = RequestMethod.GET)
	public String Bookingwrite() {
		logger.info("ShBookingController Bookingwrite " + new Date());
		return "Bookingwrite.tiles";
	}
	
	@RequestMapping(value = "BookingwriteAf.do", method = RequestMethod.POST)
	public String BookingwriteAf(ShBookingDto booking) throws Exception {
		logger.info("ShBookingController BookingwriteAf " + new Date());
		if(!booking.getId().equals("") || !booking.getName().equals("") ||
			!booking.getPnum().equals("") || !booking.getSdate().equals("") ||
			!booking.getEdate().equals("")) {
			logger.info("ShBookingController BookingwriteAf Success " + new Date());
			shBookingService.Bookingwrite(booking);
			System.out.println(booking.toString());
			return "redirect:/mypage.do";
		} else {
			logger.info("ShBookingController BookingwriteAf Fail " + new Date());
			return "Bookingwrite.tiles";
		}
	}
	
	@RequestMapping(value = "Bookingdetail.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String Bookingdetail(Model model, ShBookingDto booking, ShBbsParam param) {
		logger.info("ShBookingController Bookingdetail " + new Date());
		ShBookingDto bookDto = shBookingService.Bookingdetail(booking);
		model.addAttribute("booking", bookDto);
		
		List<ShBookingDto> booklist = (List<ShBookingDto>)(shBookingService.getBkPaginglist(param));
		ArrayList<String> sDateList=new ArrayList<String>();
		ArrayList<String> eDateList=new ArrayList<String>();
		for(int i=0;i<booklist.size();i++) {
		sDateList.add(booklist.get(i).getSdate());
		eDateList.add(booklist.get(i).getEdate());
		}
		for(int i=0;i<booklist.size();i++) {
			booklist.get(i).setSdate(sDateList.get(i).substring(0, 10));
			booklist.get(i).setEdate(eDateList.get(i).substring(0, 10));
		}
		return "Bookingdetail.tiles";
	}
	@RequestMapping(value = "BookSucess.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String BookSucess(ShBookingDto dto, HttpServletResponse response,  Model model, ShBbsParam param)throws Exception {
		logger.info("ShBookingController BookSucess " + new Date());
		
		 boolean isS = shBookingService.BookSucess(dto);
		 int sn = param.getPageNumber();	// 현재 페이지
			int start = (sn) * param.getRecordCountPerPage() + 1;	// 처음 페이지
			int end  = (sn + 1) * param.getRecordCountPerPage();	// 끝 페이지
			
			
			
			param.setStart(start);
			param.setEnd(end);
			
			List<ShBookingDto> booklist = (List<ShBookingDto>)(shBookingService.getBkPaginglist(param));
			ArrayList<String> sDateList=new ArrayList<String>();
			ArrayList<String> eDateList=new ArrayList<String>();
			for(int i=0;i<booklist.size();i++) {
			sDateList.add(booklist.get(i).getSdate());
			eDateList.add(booklist.get(i).getEdate());
			}
			for(int i=0;i<booklist.size();i++) {
				booklist.get(i).setSdate(sDateList.get(i).substring(0, 10));
				booklist.get(i).setEdate(eDateList.get(i).substring(0, 10));
			}
				
			
			// 글의 총 개수
			int totalRecordCount = shBookingService.getBklistCount(param);
			
			model.addAttribute("Bookinglist", booklist);
			
			model.addAttribute("pageNumber", sn);
			model.addAttribute("pageCountPerScreen", 10);
			model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
			model.addAttribute("totalRecordCount", totalRecordCount);
			
			model.addAttribute("s_category", param.getS_category());
			model.addAttribute("s_keyword", param.getS_keyword());
		
		if(isS) {
			System.out.println("예약승인!");
			
			response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('예약승인');</script>");
	        out.flush();
	        return "Bookinglist.tiles";
		}else {
			System.out.println("승인실패!");
			return "Bookinglist.tiles";
		}
	}
	@RequestMapping(value = "BookCancel.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String BookCancel(ShBookingDto dto,HttpSession session
			, HttpServletRequest req , HttpServletResponse response, Model model, ShBbsParam param)throws Exception {
		logger.info("ShBookingController BookCancel " + new Date());
		
		 boolean isS = shBookingService.BookCancel(dto);
		 int sn = param.getPageNumber();	// 현재 페이지
			int start = (sn) * param.getRecordCountPerPage() + 1;	// 처음 페이지
			int end  = (sn + 1) * param.getRecordCountPerPage();	// 끝 페이지
			
			
			
			param.setStart(start);
			param.setEnd(end);
			
			List<ShBookingDto> booklist = (List<ShBookingDto>)(shBookingService.getBkPaginglist(param));
			ArrayList<String> sDateList=new ArrayList<String>();
			ArrayList<String> eDateList=new ArrayList<String>();
			for(int i=0;i<booklist.size();i++) {
			sDateList.add(booklist.get(i).getSdate());
			eDateList.add(booklist.get(i).getEdate());
			}
			for(int i=0;i<booklist.size();i++) {
				booklist.get(i).setSdate(sDateList.get(i).substring(0, 10));
				booklist.get(i).setEdate(eDateList.get(i).substring(0, 10));
			}
				
			
			// 글의 총 개수
			int totalRecordCount = shBookingService.getBklistCount(param);
			
			model.addAttribute("Bookinglist", booklist);
			
			model.addAttribute("pageNumber", sn);
			model.addAttribute("pageCountPerScreen", 10);
			model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
			model.addAttribute("totalRecordCount", totalRecordCount);
			
			model.addAttribute("s_category", param.getS_category());
			model.addAttribute("s_keyword", param.getS_keyword());
		if(isS) {
			System.out.println("예약 취소 성공");
			response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('예약 취소 성공');</script>");
	        out.flush();
			return "main.tiles";
		}else {
			System.out.println("예약 취소 실패");
			return "main.tiles";
		}
	}
}
