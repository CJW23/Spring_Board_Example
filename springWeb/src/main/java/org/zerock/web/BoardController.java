package org.zerock.web;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardPageMaker;
import org.zerock.domain.BoardVO;
import org.zerock.domain.CriteriaVO;
import org.zerock.service.BoardService;

@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	private BoardService service;

	// �Խ��� ������
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String board(CriteriaVO cri, Model model) throws Exception {
		//�Խù� ����Ʈ
		model.addAttribute("list", service.searchListPage(cri));
		BoardPageMaker maker = new BoardPageMaker(cri);
		logger.info(Integer.toString(service.searchTotalNum(cri)));
		logger.info(maker.toString());
		maker.setTotalCnt(service.searchTotalNum(cri));	//����¡ ���
		
		//������ ��ȣ ���� 
		model.addAttribute("maker", maker);
		return "/board/board";
	}

	// ��� ������
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerPage() throws Exception {
		return "/board/register";
	}

	// ��� ��û
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerTry(BoardVO board, RedirectAttributes attr) throws Exception {
		board.setWriter(3);
		service.regist(board);
		logger.info(board.getDes());
		attr.addFlashAttribute("msg", "success");
		return "redirect:/board";
	}
	
	//��ȸ ������
	@RequestMapping(value = "/posts/{id}", method = RequestMethod.GET)
	public String readPost(@PathVariable int id, @ModelAttribute("cri") CriteriaVO cri, Model model) throws Exception {
		model.addAttribute("posts", service.read(id));
		return "/board/posts";
	}

	// ���� ������
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyPage(int id, @ModelAttribute("cri") CriteriaVO cri, Model model) throws Exception {
		model.addAttribute("board", service.read(id));
		return "/board/modify";
	}

	// ���� ��û
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPost(BoardVO board, CriteriaVO cri, RedirectAttributes attr) throws Exception {
		service.modify(board);
		logger.info("�� �ȵ� " + cri.toString());
		attr.addAttribute("curPage", cri.getCurPage());
		attr.addAttribute("perPageNum", cri.getPerPageNum());
		return "redirect:/posts/" + board.getId();
	}
	
	//�Խñ� ���� ��û
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String removePost(int id, CriteriaVO cri, RedirectAttributes attr) throws Exception {
		service.remove(id);
		attr.addAttribute("curPage", cri.getCurPage());
		attr.addAttribute("perPageNum", cri.getPerPageNum());
		return "redirect:/board";
	}

}
