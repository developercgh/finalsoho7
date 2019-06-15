package sh.controller;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ShIntroController {

	private static Logger logger
		= LoggerFactory.getLogger(ShIntroController.class);
	
	
	@RequestMapping(value = "prologue.do", method = RequestMethod.GET)
	public String prologue() {
		logger.info("ShIntroController prologue " + new Date());
		return "prologue.tiles";
	}
	
	@RequestMapping(value = "pensionView.do", method = RequestMethod.GET)
	public String pensionView() {
		logger.info("ShIntroController pensionView " + new Date());
		return "pensionView.tiles";
	}
	
	@RequestMapping(value = "pensionViewAf.do", method = RequestMethod.POST)
	public String pensionViewAf() {
		logger.info("ShIntroController pensionView " + new Date());
		return "";
	}
}
