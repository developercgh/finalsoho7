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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import sh.model.ShBbsParam;
import sh.model.ShBookingDto;
import sh.model.ShMemberDto;
import sh.service.ShBookingService;
import sh.service.ShMemberService;

@Controller
public class ShMemberController {


	private static final Logger logger = LoggerFactory.getLogger(ShMemberController.class);

	@Autowired
	ShMemberService ShMemberService;
	@Autowired
	ShBookingService shBookingService;

	@RequestMapping(value = "main.do", method = RequestMethod.GET)
	public String main() {
		logger.info("ShMemberController main " + new Date());
		return "main.tiles";
	}

	@RequestMapping(value = "login.do", method = RequestMethod.GET)
	public String login() {
		logger.info("ShMemberController login " + new Date());
		return "login.tiles";
	}

	@RequestMapping(value = "loginAf.do", method = RequestMethod.POST)
	public String loginAf(ShMemberDto dto, HttpServletRequest req, HttpServletResponse response) throws Exception {
		logger.info("ShMemberController loginAf " + new Date());

		ShMemberDto login = ShMemberService.login(dto);
		if (login != null && !login.getId().equals("")) {
			logger.info("ShMemberController loginAf SUC " + new Date());
			// session 저장
			req.getSession().setAttribute("login", login);
			// 이동
			System.out.println("로그인 완료");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 완료');</script>");
			out.flush();

			return "main.tiles";
		} else {
			logger.info("ShMemberController loginAf Fail " + new Date());
			System.out.println("로그인 실패");

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('아이디 또는 비밀번호를 확인해 주십시오');</script>");
			out.flush();
			return "login.tiles";
		}
	}

	@RequestMapping(value = "regi.do", method = RequestMethod.GET)
	public String regi() {
		logger.info("ShMemberController regi " + new Date());
		return "regi.tiles";
	}

	@RequestMapping(value = "regiAf.do", method = RequestMethod.POST)
	public String regiAf(ShMemberDto dto) throws Exception {
		logger.info("ShMemberController regiAf " + new Date());
		// logger.info(dto.toString());

		boolean b = ShMemberService.addmember(dto);
		if (b) {
			
			return "redirect:/regiAfView.do";
		} else {
			return "redirect:/regi.do";
		}
	}

	@RequestMapping(value = "regiAfView.do", method = RequestMethod.GET)
	public String regiAfView() {
		logger.info("ShMemberController regiAfView " + new Date());
		return "regiAfView.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value = "getId.do", method = RequestMethod.POST)
	public String getId(ShMemberDto mem) {
		logger.info("ShMemberController getId " + new Date());

		int count = ShMemberService.getId(mem);

		String msg = "";
		if (count > 0) {
			msg = "YES";
		} else {
			msg = "NO";
		}
		return msg;
	}

	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String logout(HttpServletRequest req) {
		req.getSession().invalidate();
		return "login.tiles";
	}

	@RequestMapping(value = "mypage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String mypage(HttpSession session, Model model, HttpServletResponse response, ShBbsParam param)
			throws Exception {

		List<ShBookingDto> blist = (List<ShBookingDto>) shBookingService.userBooking((ShMemberDto)session.getAttribute("login"));
		response.setContentType("text/html; charset=UTF-8");
		model.addAttribute("booking", blist);
		System.out.println("Controller:" + blist.toString());

		ArrayList<String> sDateList = new ArrayList<String>();
		ArrayList<String> eDateList = new ArrayList<String>();
		for (int i = 0; i < blist.size(); i++) {
			sDateList.add(blist.get(i).getSdate());
			eDateList.add(blist.get(i).getEdate());
		}
		for (int i = 0; i < blist.size(); i++) {
			blist.get(i).setSdate(sDateList.get(i).substring(0, 10));
			blist.get(i).setEdate(eDateList.get(i).substring(0, 10));
		}
		return "mypage.tiles";
	}

	// mypage 수정
	@RequestMapping(value = "myup.do")
	public String myup() throws Exception {
		return "myup.tiles";
	}

	@RequestMapping(value = "updateMypage.do", method = RequestMethod.POST)
	public String update_mypage(@ModelAttribute ShMemberDto mem, HttpSession session, HttpServletResponse response)
			throws Exception {
		session.setAttribute("mem", ShMemberService.updateMypage(mem));
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('내 정보가 수정되었습니다.');</script>");
		out.flush();
		return "main.tiles";
	}

	// 비밀번호 변경
	@RequestMapping(value = "pwdup.do")
	public String pwdup() throws Exception {
		return "pwdup.tiles";
	}

	@RequestMapping(value = "updatePwd.do", method = RequestMethod.POST)
	public String updatePwd(@ModelAttribute ShMemberDto mem, @RequestParam("oldPwd") String oldPwd, HttpSession session,
			HttpServletResponse response) throws Exception {
		session.setAttribute("login", session);
		// oldPwd값 가지고 지금 mem의 아이디가 가진 pwd랑 비교하는 구문추가(DB까지 다녀오는 로직 구현)
		// 기존 비번이 일치하면 아래 실행
		session.setAttribute("mem", ShMemberService.updatePwd(mem));
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('비밀번호가 변경되었습니다.');</script>");
		out.flush();
		return "main.tiles";
	}
	// 회원탈퇴

	@RequestMapping(value = "toDeletePage.do")
	public String toDeletePage() throws Exception {
		return "deleteMypage.tiles";
	}
	// 회원 탈퇴 post
	@RequestMapping(value = "deleteMypage.do", method = RequestMethod.POST)
	public String deleteMypage(HttpSession session, 
								HttpServletRequest req, 
								HttpServletResponse response) throws Exception {
		logger.info("post deleteMypage");
		ShMemberDto mem = (ShMemberDto) session.getAttribute("login");
		String oldPwd = mem.getPwd();	// db에 저장된 패스워드

		ShMemberService.deleteMypage(mem);	//
		session.invalidate();
		session = req.getSession(true);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('회원탈퇴가 완료되었습니다.');</script>");
		out.flush();
		
		return "main.tiles";
	}
}
