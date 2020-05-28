package org.zerock.web;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.service.BoardService;

@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	private BoardService service;

	// �Խñ� ����Ʈ
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String board(Model model) throws Exception {
		logger.info("---------get register");
		model.addAttribute("list", service.listAll());
		return "/board/board";
	}

	// ��� ������
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerPage() throws Exception {
		return "/board/register";
	}

	// ��� ��û ó��
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerTry(BoardVO board, RedirectAttributes attr) throws Exception {
		System.out.println("xxxxx" + board.getTitle());
		board.setWriter(3);
		service.regist(board);
		attr.addFlashAttribute("msg", "success");
		return "redirect:/board";
	}

	@RequestMapping(value = "/posts/{id}", method = RequestMethod.GET)
	public String readPost(@PathVariable int id, Model model) throws Exception {
		model.addAttribute("posts", service.read(id));
		return "/board/posts";
	}

	// ���� ������
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyPage(int id, Model model) throws Exception {
		model.addAttribute("board", service.read(id));
		return "/board/modify";
	}

	// ���� ��û ó��
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPost(BoardVO board, RedirectAttributes attr) throws Exception {
		service.modify(board);
		attr.addFlashAttribute("modifyresult", "true");
		return "redirect:/posts/" + board.getId();
	}

	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String removePost(int id, RedirectAttributes attr) throws Exception {
		service.remove(id);
		attr.addFlashAttribute("rmresult", "true");
		return "redirect:/board";
	}
}
