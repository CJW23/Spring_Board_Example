package org.zerock.web;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.domain.UserVO;
import org.zerock.dto.LoginDTO;
import org.zerock.service.UserService;

@Controller
public class UserController {
	@Inject
	UserService service;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginPage() {
		return "/login/loginPage";
	}
	
	@RequestMapping(value="/loginRequest", method=RequestMethod.POST)
	public void loginRequest(LoginDTO dto, HttpSession session, Model model) throws Exception{
		//LoginInterceptor preHandle
		UserVO vo = service.login(dto);
		if(vo == null) {
			return;
		}
		model.addAttribute("userVO", vo);
		//LoginInterceptor postHandle
	}
}
