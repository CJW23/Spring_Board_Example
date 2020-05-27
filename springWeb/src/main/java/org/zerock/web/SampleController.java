package org.zerock.web;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.domain.ProductVO;


@Controller
public class SampleController {
	private static final Logger logger = LoggerFactory.getLogger(SampleController.class);
	
	@RequestMapping(value="/sample", method = RequestMethod.GET)
	public String sample(@ModelAttribute String msgs) {
		logger.info("sample called");
		System.out.println(msgs + "sdsd");
		return "result";
	}
	
	@RequestMapping(value="/attr", method = RequestMethod.GET)
	public @ResponseBody ProductVO attribute(Model model) {
		ProductVO product = new ProductVO("awd", 12.0);
		logger.info("attr called");
		//model.addAttribute("p", product);
		return product;
	}
}
